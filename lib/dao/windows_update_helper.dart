/// The out-of-process half of the update.
///
/// A running executable's files cannot be overwritten or deleted while the image
/// is mapped, so the swap has to happen after the app exits — which means it
/// cannot be done by the app itself. This generates a small PowerShell script,
/// launched detached, that waits for the app to go away and then replaces it.
library;

/// The script body.
///
/// Everything it needs arrives as a parameter, so this is a raw string with no
/// interpolation — PowerShell's `$` would otherwise collide with Dart's.
///
/// The ordering is the safety property: every old file is moved aside *before*
/// any new file is written, so the install directory never holds a mixture of the
/// two. Anything that fails before that point leaves the install byte-identical;
/// anything that fails after it can be rolled back exactly, from a journal.
const String applyUpdateScript = r'''
param(
  [Parameter(Mandatory = $true)][int]$OldPid,
  [Parameter(Mandatory = $true)][string]$Install,
  [Parameter(Mandatory = $true)][string]$Payload,
  [Parameter(Mandatory = $true)][string]$Version,
  [Parameter(Mandatory = $true)][string]$Markers,
  [Parameter(Mandatory = $true)][string]$LogPath,
  [int]$ExitTimeoutSeconds = 120,
  [int]$HealthTimeoutSeconds = 45
)

$ErrorActionPreference = 'Stop'

$exeName   = 'jira_watch.exe'
$exePath   = Join-Path $Install $exeName
$workDir   = Join-Path $Install '.jw_update'
$backupDir = Join-Path $workDir 'backup'
$journal   = Join-Path $workDir 'journal.txt'

function Write-Log([string]$message) {
  $line = "{0}  {1}" -f (Get-Date -Format 'yyyy-MM-ddTHH:mm:ss.fff'), $message
  Add-Content -LiteralPath $LogPath -Value $line -Encoding UTF8
}

function Write-Marker([string]$name, [string]$content) {
  Set-Content -LiteralPath (Join-Path $Markers $name) -Value $content -Encoding UTF8
}

# The authoritative "the app is really gone" signal. It asks the OS the exact
# question that matters, and unlike a PID check it cannot be fooled by PID reuse.
function Test-Unlocked([string]$path) {
  try {
    $stream = [System.IO.File]::Open($path, 'Open', 'ReadWrite', 'None')
    $stream.Close()
    $stream.Dispose()
    return $true
  } catch {
    return $false
  }
}

function Restore-FromJournal() {
  if (-not (Test-Path -LiteralPath $journal)) { return }
  # Reversed: undo the moves in the opposite order to how they were made.
  $names = @(Get-Content -LiteralPath $journal) | Where-Object { $_ -ne '' }
  [array]::Reverse($names)
  foreach ($name in $names) {
    $from = Join-Path $backupDir $name
    $to   = Join-Path $Install $name
    if (-not (Test-Path -LiteralPath $from)) { continue }
    if (Test-Path -LiteralPath $to) { Remove-Item -LiteralPath $to -Recurse -Force }
    Move-Item -LiteralPath $from -Destination $to -Force
    Write-Log "rolled back $name"
  }
}

# Restarting the app after a rollback is a courtesy, not part of the rollback
# being correct. If it fails, the install is still properly restored — so this
# must never throw, or a successful rollback would escalate into the last-resort
# path and tell the user to recover from a backup they do not need.
function Start-AppQuietly([string]$path, [string]$workingDirectory) {
  try {
    Start-Process -FilePath $path -WorkingDirectory $workingDirectory
    Write-Log "restarted $path"
  } catch {
    Write-Log "could not restart $path (the install is still correctly restored): $($_.Exception.Message)"
  }
}

function Remove-CopiedPayload() {
  foreach ($item in Get-ChildItem -LiteralPath $Payload) {
    $target = Join-Path $Install $item.Name
    if (Test-Path -LiteralPath $target) {
      Remove-Item -LiteralPath $target -Recurse -Force -ErrorAction SilentlyContinue
    }
  }
}

# Gives the old install back and says so, for when rolling back is not enough.
function Invoke-LastResort([string]$reason) {
  Write-Log "LAST RESORT: $reason"
  $backupExe = Join-Path $backupDir $exeName
  if (Test-Path -LiteralPath $backupExe) {
    # A Flutter build runs from anywhere as long as its tree is intact, and the
    # backup is a complete tree — so this leaves a working app rather than none.
    Start-Process -FilePath $backupExe -WorkingDirectory $backupDir
    Write-Log "started the backup copy at $backupExe"
  }
  Write-Marker 'update_failed.json' (@{
    version  = $Version
    reason   = $reason
    log      = $LogPath
    recovery = $backupDir
  } | ConvertTo-Json)
  exit 12
}

Write-Log "=== applying update to $Version ==="
Write-Log "install=$Install payload=$Payload oldPid=$OldPid"

# --- 1. wait for the old process to go away -----------------------------------
$deadline = (Get-Date).AddSeconds($ExitTimeoutSeconds)
while ((Get-Date) -lt $deadline) {
  $proc = Get-Process -Id $OldPid -ErrorAction SilentlyContinue
  if (-not $proc) { break }
  # A recycled PID belonging to something else is not our app still running.
  if ($proc.Path -and $proc.Path -ne $exePath) { break }
  Start-Sleep -Milliseconds 250
}
while (-not (Test-Unlocked $exePath) -and (Get-Date) -lt $deadline) {
  Start-Sleep -Milliseconds 250
}
if (-not (Test-Unlocked $exePath)) {
  # Nothing has been touched yet, so aborting here is completely safe.
  Write-Log 'the app is still holding its executable; aborting without changes'
  Write-Marker 'update_failed.json' (@{
    version = $Version
    reason  = 'Jira Watcher did not close, so the update was not applied. Nothing was changed.'
    log     = $LogPath
  } | ConvertTo-Json)
  exit 2
}
Write-Log 'the old process is gone and the executable is unlocked'

# --- 2. move the old install aside, recording every move ----------------------
try {
  if (Test-Path -LiteralPath $backupDir) { Remove-Item -LiteralPath $backupDir -Recurse -Force }
  New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
  Set-Content -LiteralPath $journal -Value '' -Encoding UTF8

  foreach ($item in Get-ChildItem -LiteralPath $Install) {
    if ($item.Name -eq '.jw_update') { continue }

    $moved = $false
    # Antivirus and indexers hold brief handles just after a process exits, so a
    # first failure is usually transient rather than fatal.
    for ($attempt = 1; $attempt -le 5; $attempt++) {
      try {
        Move-Item -LiteralPath $item.FullName -Destination (Join-Path $backupDir $item.Name) -Force
        $moved = $true
        break
      } catch {
        Write-Log "move of $($item.Name) failed (attempt $attempt): $($_.Exception.Message)"
        Start-Sleep -Milliseconds 400
      }
    }
    if (-not $moved) { throw "could not move $($item.Name) out of the install folder" }
    Add-Content -LiteralPath $journal -Value $item.Name -Encoding UTF8
  }
  Write-Log 'the old install is fully banked'
} catch {
  Write-Log "banking failed: $($_.Exception.Message)"
  try {
    Restore-FromJournal
    Write-Log 'restored; the install is unchanged'
    # The app has already exited by this point, so put it back for the user.
    Start-AppQuietly $exePath $Install
    Write-Marker 'update_failed.json' (@{
      version = $Version
      reason  = "The update could not start because a file was in use. Your previous version was left untouched."
      log     = $LogPath
    } | ConvertTo-Json)
    exit 10
  } catch {
    Invoke-LastResort "rollback after a failed move also failed: $($_.Exception.Message)"
  }
}

# --- 3. only now write anything new ------------------------------------------
try {
  foreach ($item in Get-ChildItem -LiteralPath $Payload) {
    Copy-Item -LiteralPath $item.FullName -Destination (Join-Path $Install $item.Name) -Recurse -Force
  }
  Write-Log 'the new version is in place'
} catch {
  Write-Log "installing the new version failed: $($_.Exception.Message)"
  try {
    Remove-CopiedPayload
    Restore-FromJournal
    Write-Log 'restored the previous version'
    Start-AppQuietly $exePath $Install
    Write-Marker 'update_failed.json' (@{
      version = $Version
      reason  = "The new version could not be written, so your previous version was restored."
      log     = $LogPath
    } | ConvertTo-Json)
    exit 11
  } catch {
    Invoke-LastResort "rollback after a failed copy also failed: $($_.Exception.Message)"
  }
}

# --- 4. start it and watch that it survives ----------------------------------
$okMarker = Join-Path $Markers ("update_ok." + $Version)
if (Test-Path -LiteralPath $okMarker) { Remove-Item -LiteralPath $okMarker -Force }

$new = Start-Process -FilePath $exePath -WorkingDirectory $Install -ArgumentList '--post-update', $Version -PassThru
Write-Log "started the new version (pid $($new.Id))"

$healthy = $false
$healthDeadline = (Get-Date).AddSeconds($HealthTimeoutSeconds)
while ((Get-Date) -lt $healthDeadline) {
  if (Test-Path -LiteralPath $okMarker) { $healthy = $true; break }
  # The hard failure signal is the process dying, not a missing marker: were it
  # the marker, a future regression in writing it would silently roll back every
  # update instead of just failing to confirm one.
  $new.Refresh()
  if ($new.HasExited) {
    Write-Log "the new version exited immediately with code $($new.ExitCode)"
    try {
      Remove-CopiedPayload
      Restore-FromJournal
      Start-AppQuietly $exePath $Install
      Write-Log 'restored and restarted the previous version'
      Write-Marker 'update_failed.json' (@{
        version = $Version
        reason  = "Version $Version started and closed immediately, so your previous version was restored."
        log     = $LogPath
      } | ConvertTo-Json)
      exit 13
    } catch {
      Invoke-LastResort "rollback after the new version failed to stay running also failed: $($_.Exception.Message)"
    }
  }
  Start-Sleep -Milliseconds 500
}

if (-not $healthy) {
  # Still running, just did not confirm. Treated as success: it is visible on
  # screen, so the user can judge it, and rolling back a working app would be worse.
  Write-Log 'no confirmation within the health window, but the process is alive; treating as success'
}

Write-Marker 'pending_cleanup.json' (@{
  newVersion = $Version
  backup     = $backupDir
  log        = $LogPath
} | ConvertTo-Json)
Write-Log "=== update to $Version applied ==="
exit 0
''';

/// The probe used during preflight.
///
/// Doubles as the check that script execution is permitted at all: if its output
/// comes back, a script file can run here. Bundling the other queries into the
/// same invocation keeps preflight to one process start rather than three.
const String preflightProbeScript = r'''
param(
  [Parameter(Mandatory = $true)][string]$ExePath,
  [Parameter(Mandatory = $true)][string]$InstallDrive,
  [Parameter(Mandatory = $true)][string]$TempDrive
)
$ErrorActionPreference = 'SilentlyContinue'

# Anything other than this process counts: a second copy would hold the files.
$instances = @(Get-Process -Name 'jira_watch' | Where-Object { $_.Path -eq $ExePath }).Count

# Get-PSDrive rather than wmic, which is removed on Windows 11 24H2 and later.
$installFree = (Get-PSDrive -Name $InstallDrive).Free
$tempFree    = (Get-PSDrive -Name $TempDrive).Free

Write-Output 'probe-ok'
Write-Output "instances=$instances"
Write-Output "installFree=$installFree"
Write-Output "tempFree=$tempFree"
''';
