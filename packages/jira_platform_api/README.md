# jira_platform_api

A Dart client for the **Jira Cloud platform REST API v3**, generated from Atlassian's
OpenAPI specification — 616 operations.

## Do not edit `lib/`

Everything under `lib/` is generated and is deleted and rewritten wholesale by
the regeneration script. Hand-edits there are lost silently.

## Regenerating

From the repository root:

```powershell
pwsh tool/generate_jira_api.ps1 -Package jira_platform_api
```

That downloads the current spec to `spec/swagger-v3.v3.json`, applies the fixups in
`tool/patch_jira_spec.dart`, regenerates `lib/`, and fails if the result does
not compile.

The generator jar version is pinned by `openapitools.json` at the repository
root, so a regeneration months from now produces a comparable diff.

## Why the spec is patched

`spec/swagger-v3.v3.json` is exactly what Atlassian publishes. The Dart generator needs three
fixups to emit code that compiles, applied to a temporary copy so the committed
spec stays pristine and every deviation is visible as code:

- **enum properties with a `default`** make it emit the enum's private
  generative constructor as a default value, which Dart rejects
- **`uniqueItems: true`** makes it type a field as `Set` while the deserialiser
  it emits for arrays nested in `additionalProperties` still builds a `List`
- **maps of maps of objects** are typed `Map<String, Map<String, Object>>` but
  populated from a `Map<String, dynamic>` cast, which does not assign

Separately, Jira genuinely has properties named `toString`, which collide with
`Object.toString`. Those are renamed to `toStringValue` via the generator's
`--name-mappings`, which preserves the name on the wire.
