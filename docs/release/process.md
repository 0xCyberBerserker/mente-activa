# Release Process

## Español

### Política

- Las releases estables son manuales.
- Ningún workflow se ejecuta con commits ordinarios.
- La publicación se dispara solo mediante `workflow_dispatch`.
- La GitHub Pages pública se actualiza desde la misma release manual.

### Artefactos de release

Objetivo actual:

- Linux `x86_64`: binario principal + bundle `.zip`
- Linux `ARM64`: binario principal + bundle `.zip`
- Windows `x86_64`: `.exe` principal + bundle `.zip`
- Android `arm64-v8a`: `.apk` firmado
- source archive
- `manifest.json`
- `checksums.txt`
- tabla bilingüe de versiones por sistema operativo
- GitHub Pages estática generada desde datos reales de GitHub Releases

### Precondiciones

- `VERSION.json` actualizado
- el proyecto valida con `scripts/validate-project`
- existen presets `Linux/X11`, `Linux ARM64`, `Windows Desktop` y `Android`
- no hay secretos en el repo
- las export templates se preparan con `scripts/release/install-templates`
- Android requiere secretos de firma y SDK operativo en CI

### Flujo

1. validar versión y metadata
2. exportar targets manuales
3. agrupar solo assets permitidos
4. generar `manifest.json` y `checksums.txt`
5. publicar release
6. regenerar índice Markdown/JSON de releases
7. desplegar GitHub Pages

La validación en CI usa `recovery-mode` del editor, pero el export real usa `godot --headless --export-release` porque los scripts `.torch` de Orchestrator no deben degradarse durante el empaquetado.

## English

### Policy

- Stable releases are manual.
- No workflow runs on ordinary commits.
- Publication is triggered only through `workflow_dispatch`.
- The public GitHub Pages site is refreshed from the same manual release.

### Release artifacts

Current target:

- Linux `x86_64`: primary binary + `.zip` bundle
- Linux `ARM64`: primary binary + `.zip` bundle
- Windows `x86_64`: primary `.exe` + `.zip` bundle
- Android `arm64-v8a`: signed `.apk`
- source archive
- `manifest.json`
- `checksums.txt`
- bilingual version table by operating system
- static GitHub Pages output generated from real GitHub Releases data

### Preconditions

- `VERSION.json` updated
- the project validates with `scripts/validate-project`
- `Linux/X11`, `Linux ARM64`, `Windows Desktop`, and `Android` presets exist
- no secrets are stored in the repo
- export templates are prepared through `scripts/release/install-templates`
- Android requires signing secrets and a working SDK in CI

### Flow

1. validate version and metadata
2. export manual targets
3. keep only allowed assets
4. generate `manifest.json` and `checksums.txt`
5. publish the release
6. regenerate the Markdown/JSON release index
7. deploy GitHub Pages

CI validation uses editor `recovery-mode`, but the real export uses `godot --headless --export-release` because Orchestrator `.torch` scripts must not be degraded during packaging.
