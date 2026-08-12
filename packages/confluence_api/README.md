# confluence_api

A Dart client for the **Confluence Cloud REST API v2**, generated from Atlassian's
OpenAPI specification — 218 operations.

## Do not edit `lib/`

Everything under `lib/` is generated and is deleted and rewritten wholesale by
the regeneration script. Hand-edits there are lost silently.

## Regenerating

From the repository root:

```powershell
pwsh tool/generate_jira_api.ps1 -Package confluence_api
```

That downloads the current spec to `spec/openapi-v2.v3.json`, applies the fixups
in `tool/patch_jira_spec.dart`, regenerates `lib/`, and fails if the result does
not compile.

The generator jar version is pinned by `openapitools.json` at the repository
root, so a regeneration months from now produces a comparable diff.

## The base path includes `/wiki/api/v2`

Unlike the Jira specs, whose paths are absolute from the site root, this spec
declares a server of `https://{your-domain}/wiki/api/v2` and its paths are
relative to it. A client therefore has to be constructed with that whole prefix
as its `basePath`, not just the site — see `ConfluenceApi` in the app.

## v2 has no search

There is no search operation anywhere in this spec: CQL search lives only in the
v1 API, at `/wiki/rest/api/search`. Rather than generate a second package for
one endpoint, the app calls it through its raw authenticated-request path. If
more of v1 is ever needed, add its spec to the generation script the same way
this one was added.

## Why the spec is patched

`spec/openapi-v2.v3.json` is exactly what Atlassian publishes. The patches in
`tool/patch_jira_spec.dart` are shared with the Jira specs and applied here for
the same reasons; see `packages/jira_platform_api/README.md` for what each one
works around. They are applied to a temporary copy, so the committed spec stays
pristine and every deviation is visible as code.
