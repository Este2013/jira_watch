<#
.SYNOPSIS
  Regenerates the Jira API client packages from Atlassian's OpenAPI specs.

.DESCRIPTION
  The generated output is committed, so this only needs running when a spec
  changes or the generator is upgraded. Committing it keeps Java off the CI
  runner, keeps `flutter pub get` fast, and makes a spec change show up as a
  reviewable diff rather than as invisible drift.

  Each spec becomes its own package. The two specs share 25 schema names
  (IssueBean, Changelog, FieldMetadata, ...) and 2 operationIds (getIssue,
  getConfiguration), so a single flat package would collide.

  The `dart` generator is used rather than `dart-dio`: dart-dio emits built_value
  models needing build_runner over ~1000 schemas, which would dominate every
  build. `dart` emits plain classes with hand-written JSON and depends only on
  http.

.PARAMETER Package
  Which package to regenerate. Defaults to all of them.

.PARAMETER SkipDownload
  Regenerate from the spec already committed under the package's spec/ folder,
  rather than fetching the current one. Useful for reproducing a past generation.

.EXAMPLE
  pwsh tool/generate_jira_api.ps1
  pwsh tool/generate_jira_api.ps1 -Package jira_platform_api
  pwsh tool/generate_jira_api.ps1 -SkipDownload
#>
param(
  [ValidateSet('jira_platform_api', 'jira_software_api')]
  [string[]]$Package,
  [switch]$SkipDownload
)

$ErrorActionPreference = 'Stop'

# The npm package is only a wrapper (2.x); the generator itself is a Java jar it
# downloads (7.x). The jar version is pinned by openapitools.json at the repo
# root, which is committed — that is the wrapper's own mechanism, and it ignores
# an OPENAPI_GENERATOR_VERSION environment variable. Change the version there,
# not here.
$CliVersion = '2.40.1'

$Specs = @(
  [ordered]@{
    Package     = 'jira_platform_api'
    SpecFile    = 'swagger-v3.v3.json'
    Url         = 'https://developer.atlassian.com/cloud/jira/platform/swagger-v3.v3.json'
    Description = 'Generated client for the Jira Cloud platform REST API v3.'
  },
  [ordered]@{
    Package     = 'jira_software_api'
    SpecFile    = 'swagger.v3.json'
    Url         = 'https://developer.atlassian.com/cloud/jira/software/swagger.v3.json'
    Description = 'Generated client for the Jira Software (Agile) Cloud REST API.'
  }
)

$repoRoot = Split-Path -Parent $PSScriptRoot
$selected = if ($Package) { $Specs | Where-Object { $Package -contains $_.Package } } else { $Specs }

foreach ($spec in $selected) {
  $pkgDir  = Join-Path $repoRoot "packages/$($spec.Package)"
  $specDir = Join-Path $pkgDir 'spec'
  $specPath = Join-Path $specDir $spec.SpecFile

  Write-Host ""
  Write-Host "=== $($spec.Package) ===" -ForegroundColor Cyan
  New-Item -ItemType Directory -Force $specDir | Out-Null

  if (-not $SkipDownload) {
    Write-Host "Downloading $($spec.Url)"
    Invoke-WebRequest -Uri $spec.Url -OutFile $specPath -UseBasicParsing
  }
  if (-not (Test-Path $specPath)) {
    throw "No spec at $specPath. Run without -SkipDownload to fetch it."
  }

  # The spec is deliberately not parsed here. PowerShell's ConvertFrom-Json
  # cannot represent the platform spec at all — it has keys differing only in
  # case (issueType and issuetype) — so reading it is left to the Dart step,
  # which reports the title and operation count as it patches.

  # Everything under lib/ is generated, so it is cleared first: a spec that drops
  # an endpoint should drop its file too, rather than leaving an orphan behind
  # that still compiles.
  $libDir = Join-Path $pkgDir 'lib'
  if (Test-Path $libDir) { Remove-Item -Recurse -Force $libDir }

  # The spec committed above is pristine upstream. The generator needs a few
  # fixups to emit code that compiles, so it works from a patched copy while the
  # committed one stays exactly what Atlassian publishes — see patch_jira_spec.dart.
  $patchedSpec = Join-Path ([System.IO.Path]::GetTempPath()) "patched-$($spec.SpecFile)"
  Write-Host "Patching spec for the Dart generator ..."
  dart run (Join-Path $PSScriptRoot 'patch_jira_spec.dart') $specPath $patchedSpec
  if ($LASTEXITCODE -ne 0) { throw "Spec patching failed for $($spec.Package)." }

  # Generator options go in a config file rather than --additional-properties:
  # the description contains spaces, and PowerShell splits a quoted native
  # argument at them, which the generator then reads as stray parameters.
  $configPath = Join-Path ([System.IO.Path]::GetTempPath()) "openapi-$($spec.Package).json"
  @{
    pubName        = $spec.Package
    pubVersion     = '1.0.0'
    pubDescription = $spec.Description
  } | ConvertTo-Json | Set-Content -LiteralPath $configPath -Encoding utf8

  Write-Host "Generating (cli $CliVersion, jar pinned by openapitools.json) ..."
  try {
    # Jira really does have properties named `toString` (ChangeDetails, the
    # changelog items). Generated as-is they collide with Object.toString and the
    # package will not compile, so the Dart identifier is renamed while the
    # generator keeps serialising it under its original wire name.
    npx --yes "@openapitools/openapi-generator-cli@$CliVersion" generate `
      -i $patchedSpec `
      -g dart `
      -o $pkgDir `
      -c $configPath `
      --name-mappings toString=toStringValue
    if ($LASTEXITCODE -ne 0) { throw "Generation failed for $($spec.Package)." }
  } finally {
    Remove-Item -LiteralPath $configPath -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $patchedSpec -ErrorAction SilentlyContinue
  }

  # The generator writes its own pubspec, README and .openapi-generator metadata.
  # Ours are kept: the generated pubspec pins dependency versions that fight the
  # app's, and the generated analysis_options is stricter than generated code can
  # satisfy.
  foreach ($f in @('analysis_options.yaml', '.openapi-generator-ignore')) {
    $generated = Join-Path $pkgDir $f
    $keep = Join-Path $pkgDir "$f.keep"
    if (Test-Path $keep) {
      Move-Item -Force $keep $generated
    }
  }

  Push-Location $pkgDir
  try {
    Write-Host "Resolving dependencies ..."
    dart pub get
    if ($LASTEXITCODE -ne 0) { throw "pub get failed for $($spec.Package)." }
  } finally {
    Pop-Location
  }

  # Analyzed with flutter rather than dart, and from the repo root. `dart analyze`
  # dies on this machine with "Cannot delete file ...\Dart\perf\<pid>"
  # (errno 1920) before reporting anything; the Flutter front end does not.
  #
  # Warnings and infos are not fatal: generated code trips plenty of style lints
  # and editing it is pointless because the next regeneration overwrites it.
  # Errors still surface, which is what matters — the package has to compile.
  Write-Host "Analyzing ..."
  Push-Location $repoRoot
  try {
    $analysis = flutter analyze "packages/$($spec.Package)" 2>&1
    $errors = $analysis | Select-String -Pattern 'error -'
    if ($errors) {
      $errors | ForEach-Object { Write-Host $_.Line.Trim() -ForegroundColor Red }
      throw "$($spec.Package) has $($errors.Count) compile error(s) — the spec needs another fixup in tool/patch_jira_spec.dart."
    }
    $issues = ($analysis | Select-String -Pattern ' - [a-z_]+$').Count
    Write-Host "No errors ($issues non-fatal issue(s))."
  } finally {
    Pop-Location
  }

  $files = (Get-ChildItem -Recurse -File (Join-Path $pkgDir 'lib') | Measure-Object).Count
  Write-Host "$($spec.Package): $files generated files" -ForegroundColor Green
}

Write-Host ""
Write-Host "Done. Review the diff before committing — generated output is checked in." -ForegroundColor Cyan
