# Release Process

## Español

### Política

- Las releases estables son manuales.
- Ningún workflow se ejecuta con commits ordinarios.
- La publicación se dispara solo mediante `workflow_dispatch`.

### Artefactos de release

Objetivo actual:

- export Linux desktop
- source archive
- `manifest.json`
- `checksums.txt`
- assets de branding (`logoma.png`, `logoma.svg`) incluidos en el source archive

### Precondiciones

- `VERSION.json` actualizado
- el proyecto valida con `scripts/validate-project`
- existe preset Linux en `export_presets.cfg`
- no hay secretos en el repo
- el export manual Linux puede prepararse con `scripts/install-linux-templates`

### Siguiente fase

La automatización Android debe añadirse más adelante, cuando el SDK path y la firma estén formalizados.

## English

### Policy

- Stable releases are manual.
- No workflow runs on ordinary commits.
- Publication is triggered only through `workflow_dispatch`.

### Release artifacts

Current target:

- Linux desktop export
- source archive
- `manifest.json`
- `checksums.txt`
- branding assets (`logoma.png`, `logoma.svg`) included in the source archive

### Preconditions

- `VERSION.json` updated
- the project validates with `scripts/validate-project`
- a Linux preset exists in `export_presets.cfg`
- no secrets are stored in the repo
- manual Linux export can be prepared with `scripts/install-linux-templates`

### Next phase

Android automation should be added later, once SDK path and signing are formalized.
