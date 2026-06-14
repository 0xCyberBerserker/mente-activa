# Project Structure

## Español

### Objetivo

Esta es la estructura operativa actual del proyecto tras la normalización de rutas Godot.

### Árbol principal

- `assets/`
  - `branding/`: logo e identidad visual del proyecto
  - `themes/`: theme global de Godot
- `scenes/`
  - `menus/`: navegación principal
  - `activities/`: escenas jugables
- `scripts/game/`
  - `menus/`: controladores de navegación
  - `activities/`: lógica de actividades
  - `shared/`: rutas, copy y carga de datos
- `data/activities/`
  - contenido versionado para actividades
- `addons/orchestrator/`
  - dependencia vendorizada de tercero; no tratar como código propio
- `scripts/release/`
  - export, packaging, manifest, tabla pública y Pages
- `scripts/validate/`
  - validaciones mínimas de proyecto y layout de release
- `docs/`
  - documentación operativa, release, producto, desarrollo y licencias
- `site/`
  - landing pública y tabla de releases consumida por GitHub Pages

### Reglas

- No volver a introducir rutas legacy `Escena/` o `script/`.
- Las escenas navegan mediante `scripts/game/shared/app_routes.gd`.
- El texto visible común sale de `scripts/game/shared/app_text.gd`.
- El contenido de actividades debe vivir en `data/activities/` siempre que sea viable.
- `build/` y `dist/` son outputs temporales o publicables, no fuente.

## English

### Goal

This is the current operational layout after normalizing the Godot project paths.

### Main tree

- `assets/`
  - `branding/`: project logo and brand assets
  - `themes/`: shared Godot theme
- `scenes/`
  - `menus/`: primary navigation
  - `activities/`: playable scenes
- `scripts/game/`
  - `menus/`: navigation controllers
  - `activities/`: activity logic
  - `shared/`: routes, copy, and data loading
- `data/activities/`
  - versioned activity content
- `addons/orchestrator/`
  - vendored third-party dependency; do not treat as first-party code
- `scripts/release/`
  - export, packaging, manifest, public table, and Pages
- `scripts/validate/`
  - minimal project and release-layout validation
- `docs/`
  - operational, release, product, development, and licensing documentation
- `site/`
  - public landing page and release table consumed by GitHub Pages

### Rules

- Do not reintroduce legacy `Escena/` or `script/` paths.
- Scene navigation should go through `scripts/game/shared/app_routes.gd`.
- Shared visible copy should come from `scripts/game/shared/app_text.gd`.
- Activity content should live in `data/activities/` whenever practical.
- `build/` and `dist/` are temporary or publishable outputs, not source.
