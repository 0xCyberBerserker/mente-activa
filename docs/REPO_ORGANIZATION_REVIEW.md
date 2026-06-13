# Repo Organization Review

## Baseline

This repository is functional as a small Godot project, but it is not yet organized like a professional shipping repository. Compared with the discipline used in `codex-ui-linux-port`, the main gaps are release hygiene, artifact boundaries, metadata, and reproducible operations.

## Priority 1

- Add a top-level `README.md` with:
  - project purpose
  - engine version
  - local run command
  - export targets
  - addon dependency note for `orchestrator`
- Separate source from outputs:
  - keep scenes, scripts, assets, addons as source
  - move generated deliverables to a dedicated release path such as `dist/`
  - stop using root-level `.pck` files as normal tracked content
- Decide a clear policy for `ejecutar/`:
  - either remove tracked exports from Git
  - or redefine it as a generated directory outside version control

## Priority 2

- Introduce release metadata similar in spirit to `codex-ui-linux-port`:
  - `VERSION.json`
  - `checksums.txt` for published outputs
  - optional `manifest.json` for release inventory
- Add a minimal `SECURITY.md`.
- Add a short `NOTICE.md` only if third-party attribution requires it beyond current licenses.
- Create `docs/` structure for:
  - local development
  - export process
  - release process

## Priority 3

- Add reproducible scripts under `scripts/`:
  - `scripts/run-local`
  - `scripts/export-linux`
  - `scripts/export-android`
  - `scripts/validate-project`
- Keep scripts thin and deterministic.
- Make scripts validate tool presence and fail loudly.

## Priority 4

- Add CI/release automation only after the tree is cleaned:
  - project validation
  - headless Godot smoke check
  - export dry-run for Linux
  - release asset checksum generation
- If releases are going to be published from GitHub, formalize:
  - tag naming
  - version source of truth
  - artifact naming
  - checksum publication

## Recommended Target Layout

```text
.
├── README.md
├── LICENSE
├── SECURITY.md
├── VERSION.json
├── project.godot
├── Escena/
├── script/
├── addons/
├── assets/              # optional, if art grows
├── docs/
├── scripts/
├── dist/                # generated release outputs only
└── .github/workflows/   # later, once export flow is stable
```

## Specific Findings For This Repo

- `export_presets.cfg` has no Linux preset even though Linux is a required target for this host.
- The repository already mixes source and generated deliverables.
- There is no obvious versioning policy.
- There is no release publication contract yet.
- `orchestrator` binaries are vendored in-repo, so addon version pinning should be documented explicitly.

## Execution Order

1. Add project metadata files.
2. Move release outputs out of root and stop tracking generated artifacts.
3. Add deterministic local scripts for run/export/validate.
4. Add Linux export preset.
5. Add release metadata and checksums flow.
6. Add CI and publication automation.
