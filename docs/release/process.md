# Release Process

## Español

### Política

- Las releases del canal actual son manuales.
- Ningún workflow se ejecuta con commits ordinarios.
- La publicación se dispara solo mediante `workflow_dispatch`.
- La validación ligera vive en `Manual Validate` y tampoco corre en `push`.
- La GitHub Pages pública puede actualizarse desde la release manual o desde la pipeline manual `Deploy Site`.

### Artefactos de release

Objetivo actual:

- Linux `x86_64`: bundle `.zip` completo
- Linux `ARM64`: bundle `.zip` completo
- Windows `x86_64`: bundle `.zip` completo
- Android `arm64-v8a`: `.apk` sin firmar
- source archive
- `manifest.json`
- `checksums.txt`
- tabla bilingüe de versiones por sistema operativo
- GitHub Pages estática generada desde datos reales de GitHub Releases
- pipeline manual separada para publicar solo la web sin recompilar el juego
- una release solo es presentable cuando validacion, artefactos, checksums y web publica estan coherentes

### Precondiciones

- `VERSION.json` actualizado
- el proyecto valida con `scripts/validate-project`
- existen presets `Linux/X11`, `Linux ARM64`, `Windows Desktop` y `Android`
- no hay secretos en el repo
- las export templates se preparan con `scripts/release/install-templates`
- Android requiere SDK operativo en CI

### Flujo

1. validar versión y metadata
2. exportar targets manuales
3. agrupar solo assets permitidos
4. generar `manifest.json` y `checksums.txt`
5. publicar release
6. regenerar índice Markdown/JSON de releases
7. desplegar GitHub Pages

Pipeline alternativa:
1. lanzar `Deploy Site`
2. decidir si se regenera la tabla pública desde GitHub Releases con `refresh_release_index`
3. publicar la web sin exportar ni recompilar Godot

Si `refresh_release_index=false`, la pipeline reutiliza `site/data/releases.json` y `site/data/releases.md` ya versionados en el repo. No se deben inventar datos de releases.

La validación en CI usa `recovery-mode` del editor, pero el export real usa `godot --headless --export-release` para preservar el comportamiento real del proyecto durante el empaquetado.
Los artefactos desktop soportados son los `.zip` completos. Los binarios sueltos no se publican porque el runtime necesita sidecars nativos del addon `orchestrator` en el mismo directorio.
La APK Android de esta fase se publica sin firma para no bloquear la release en una keystore todavía no formalizada.

## English

### Policy

- Releases for the current channel are manual.
- No workflow runs on ordinary commits.
- Publication is triggered only through `workflow_dispatch`.
- Lightweight validation lives in `Manual Validate` and also does not run on `push`.
- The public GitHub Pages site can be refreshed from the manual release workflow or from the dedicated `Deploy Site` workflow.

### Release artifacts

Current target:

- Linux `x86_64`: complete `.zip` bundle
- Linux `ARM64`: complete `.zip` bundle
- Windows `x86_64`: complete `.zip` bundle
- Android `arm64-v8a`: unsigned `.apk`
- source archive
- `manifest.json`
- `checksums.txt`
- bilingual version table by operating system
- static GitHub Pages output generated from real GitHub Releases data
- separate manual pipeline to publish only the website without rebuilding the game
- a release is presentable only when validation, artifacts, checksums, and the public web output are coherent

### Preconditions

- `VERSION.json` updated
- the project validates with `scripts/validate-project`
- `Linux/X11`, `Linux ARM64`, `Windows Desktop`, and `Android` presets exist
- no secrets are stored in the repo
- export templates are prepared through `scripts/release/install-templates`
- Android requires a working SDK in CI

### Flow

1. validate version and metadata
2. export manual targets
3. keep only allowed assets
4. generate `manifest.json` and `checksums.txt`
5. publish the release
6. regenerate the Markdown/JSON release index
7. deploy GitHub Pages

Alternative pipeline:
1. run `Deploy Site`
2. choose whether `refresh_release_index` should rebuild the public table from GitHub Releases
3. publish the website without exporting or rebuilding Godot

If `refresh_release_index=false`, the pipeline reuses the committed `site/data/releases.json` and `site/data/releases.md` files already stored in the repository. No fabricated release data should be added.

CI validation uses editor `recovery-mode`, but the real export uses `godot --headless --export-release` to preserve the real project runtime during packaging.
Supported desktop deliverables are the complete `.zip` bundles. Standalone binaries are not published because the runtime needs native `orchestrator` sidecars in the same directory.
The Android APK in this phase is published unsigned so releases do not depend on a keystore that is not yet formalized.
