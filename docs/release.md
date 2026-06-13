# Release Process

## Policy

- Stable releases are manual.
- No workflow runs on ordinary commits.
- Release publication is triggered only from GitHub Actions through `workflow_dispatch`.

## Release Artifacts

Current release target:

- Linux desktop export
- source archive
- `manifest.json`
- `checksums.txt`

## Preconditions

- `VERSION.json` updated
- project validates with `scripts/validate-project`
- Linux preset exists in `export_presets.cfg`
- no secrets stored in repo
- local manual Linux export can be prepared with `scripts/install-linux-templates`

## Follow-up

Android release automation should be added later, after the SDK path and signing flow are formalized.
