# Contributor Workflow

## Español

### Objetivo

Esta guía define cómo trabajar en el repositorio `mente-activa` sin romper la estructura, sin subir artefactos generados y sin mezclar cambios locales con `main` de forma peligrosa.

### Antes de tocar nada

1. Actualiza tu copia local:

```bash
git checkout main
git pull --ff-only origin main
```

2. Comprueba que no tienes cambios locales:

```bash
git status
```

Si `git status` muestra archivos modificados que no entiendes, para y pregunta antes de seguir.

### Nota para Windows

No uses `rtk`: es una herramienta local de Linux y no existe en Windows. Para ejecutar los scripts del repo en Windows, abre **Git Bash** desde la raíz del repositorio. Si no tienes `godot`, `jq` o `python3` en el `PATH`, no hagas push directo: sube una rama y deja que GitHub Actions valide.

### Estructura que debes respetar

- Escenas: `scenes/menus/` y `scenes/activities/`.
- Scripts de juego: `scripts/game/menus/`, `scripts/game/activities/` y `scripts/game/shared/`.
- Datos de actividades: `data/activities/`.
- Assets: `assets/branding/` y `assets/themes/`.
- Release/CI: `scripts/release/`, `scripts/validate/` y `.github/workflows/`.
- Web pública: `site/`.
- Dependencia vendorizada permitida: `addons/orchestrator/`.

### No hagas esto

- No crees `scene/`, `script/` ni `Escena/`.
- No subas `build/`, `dist/`, `ejecutar/`, `.godot/`, `.agents/` ni `.codex/`.
- No subas exports: `*.apk`, `*.exe`, `*.pck`, `*.zip`, `*.sha256`.
- No añadas addons personales de editor en `addons/`.
- No metas claves, keystores, `.env`, certificados ni contraseñas.
- No hagas `git push --force`.
- No hagas merge si `git pull --ff-only` falla.

### Flujo recomendado para cambios

1. Crea una rama:

```bash
git checkout main
git pull --ff-only origin main
git checkout -b rabu-dev/nombre-corto-del-cambio
```

2. Haz cambios pequeños y revisa qué has tocado:

```bash
git status
git diff
```

3. Valida el proyecto:

```bash
bash scripts/validate/project
```

4. Comprueba que no estás subiendo basura:

```bash
git status --short
git ls-files | rg '^(scene/|script/|Escena/|addons/(kanban_tasks|script-ide|discord_social_sdk)/|build/|dist/|ejecutar/|kanban_tasks_data\.kanban$|.*\.(apk|exe|pck|zip|sha256)$)'
```

El segundo comando no debe imprimir nada.

5. Haz commit:

```bash
git add rutas/que/has/tocado
git commit -m "Describe el cambio en una frase"
```

6. Sube tu rama:

```bash
git push -u origin rabu-dev/nombre-corto-del-cambio
```

7. Abre PR o avisa antes de mezclar en `main`.

### Si necesitas trabajar directo en `main`

Sólo para cambios pequeños y consensuados:

```bash
git checkout main
git pull --ff-only origin main
bash scripts/validate/project
git status
git add rutas/que/has/tocado
git commit -m "Describe el cambio"
git push origin main
```

### Si algo sale mal

Ver qué has cambiado:

```bash
git status
git diff
```

Deshacer sólo un archivo local no commiteado:

```bash
git restore ruta/del/archivo
```

Quitar un archivo del staging sin borrar el cambio:

```bash
git restore --staged ruta/del/archivo
```

Borrar un archivo generado local que no debe estar:

```bash
rm -rf build dist ejecutar .godot
```

Si ya hiciste commit con basura, no empujes. Avisa y espera revisión.

### Checklist antes de push

- `git status` sólo muestra cambios esperados.
- `bash scripts/validate/project` pasa en Git Bash o GitHub Actions valida la rama.
- No hay rutas legacy `scene/`, `script/` o `Escena/`.
- No hay exports ni builds trackeados.
- No hay secretos ni ficheros de firma.
- La estructura documentada en `docs/development/project-structure.md` sigue vigente.

## English

### Goal

This guide defines how to work in the `mente-activa` repository without breaking the layout, committing generated artifacts, or mixing local changes into `main` unsafely.

### Before editing anything

1. Update your local checkout:

```bash
git checkout main
git pull --ff-only origin main
```

2. Confirm that your working tree is clean:

```bash
git status
```

If `git status` shows modified files you do not understand, stop and ask before continuing.

### Windows Note

Do not use `rtk`: it is a local Linux tool and does not exist on Windows. To run repository scripts on Windows, open **Git Bash** from the repository root. If `godot`, `jq`, or `python3` are not available in `PATH`, do not push directly to `main`: push a branch and let GitHub Actions validate it.

### Structure to preserve

- Scenes: `scenes/menus/` and `scenes/activities/`.
- Game scripts: `scripts/game/menus/`, `scripts/game/activities/`, and `scripts/game/shared/`.
- Activity data: `data/activities/`.
- Assets: `assets/branding/` and `assets/themes/`.
- Release/CI: `scripts/release/`, `scripts/validate/`, and `.github/workflows/`.
- Public web page: `site/`.
- Allowed vendored dependency: `addons/orchestrator/`.

### Do not do this

- Do not create `scene/`, `script/`, or `Escena/`.
- Do not commit `build/`, `dist/`, `ejecutar/`, `.godot/`, `.agents/`, or `.codex/`.
- Do not commit exports: `*.apk`, `*.exe`, `*.pck`, `*.zip`, `*.sha256`.
- Do not add personal editor addons under `addons/`.
- Do not commit keys, keystores, `.env` files, certificates, or passwords.
- Do not run `git push --force`.
- Do not merge if `git pull --ff-only` fails.

### Recommended change flow

1. Create a branch:

```bash
git checkout main
git pull --ff-only origin main
git checkout -b rabu-dev/short-change-name
```

2. Keep the change small and inspect it:

```bash
git status
git diff
```

3. Validate the project:

```bash
bash scripts/validate/project
```

4. Check that no junk is tracked:

```bash
git status --short
git ls-files | rg '^(scene/|script/|Escena/|addons/(kanban_tasks|script-ide|discord_social_sdk)/|build/|dist/|ejecutar/|kanban_tasks_data\.kanban$|.*\.(apk|exe|pck|zip|sha256)$)'
```

The second command must print nothing.

5. Commit:

```bash
git add paths/you/changed
git commit -m "Describe the change in one sentence"
```

6. Push your branch:

```bash
git push -u origin rabu-dev/short-change-name
```

7. Open a PR or ask before merging into `main`.

### If you must work directly on `main`

Only for small agreed changes:

```bash
git checkout main
git pull --ff-only origin main
bash scripts/validate/project
git status
git add paths/you/changed
git commit -m "Describe the change"
git push origin main
```

### If something goes wrong

Inspect your changes:

```bash
git status
git diff
```

Discard one uncommitted local file:

```bash
git restore path/to/file
```

Unstage a file without deleting the change:

```bash
git restore --staged path/to/file
```

Delete local generated files that should not be kept:

```bash
rm -rf build dist ejecutar .godot
```

If you already committed junk, do not push. Ask for review first.

### Pre-push checklist

- `git status` shows only expected changes.
- `bash scripts/validate/project` passes in Git Bash or GitHub Actions validates the branch.
- There are no legacy `scene/`, `script/`, or `Escena/` paths.
- No exports or builds are tracked.
- No secrets or signing files are tracked.
- The structure documented in `docs/development/project-structure.md` still holds.
