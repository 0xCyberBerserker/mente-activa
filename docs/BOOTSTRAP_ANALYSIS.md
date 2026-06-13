# Bootstrap Analysis

## Español

### Estado actual

- Repositorio local sincronizado con `origin/main`
- Rama activa: `main`
- Remote: `https://github.com/0xCyberBerserker/mente-activa.git`
- Skills instaladas localmente:
  - `~/.codex/skills/godot`
  - `~/.codex/skills/godot-ui`

### Forma del proyecto

- Motor: Godot `4.6` declarado en [`project.godot`](./project.godot)
- Escena principal resuelta a [`Escena/control.tscn`](./Escena/control.tscn)
- Modelo mixto:
  - scripts `.gd` para lógica de minijuegos
  - scripts `.torch` de Orchestrator para flujo de menús
- Estructura base:
  - [`Escena/`](./Escena)
  - [`script/`](./script)
  - [`addons/orchestrator/`](./addons/orchestrator)

### Estado de export

- Presets existentes en [`export_presets.cfg`](./export_presets.cfg):
  - `Linux/X11`
  - `Windows Desktop`
  - `Android`
- El preset Android usa `Gradle`
- El paquete Android sigue necesitando configuración de SDK path en el editor

### Riesgos del repositorio

- Hay artefactos generados mezclados con fuente:
  - [`mente-activa.pck`](./mente-activa.pck)
  - [`ejecutar/`](./ejecutar)
- `orchestrator` mete binarios vendorizados de varias plataformas
- El proyecto requería saneado de UID del theme compartido

### Validación

- Confirmado en host:
  - `rtk`
  - `git`
  - `godot 4.6.3`
  - `adb`
  - `bundletool`
- `scripts/validate-project` pasa
- El arranque de UI dejó de emitir el warning del UID roto del theme tras el fix aplicado

## English

### Current status

- Local repository synchronized with `origin/main`
- Active branch: `main`
- Remote: `https://github.com/0xCyberBerserker/mente-activa.git`
- Local skills installed:
  - `~/.codex/skills/godot`
  - `~/.codex/skills/godot-ui`

### Project shape

- Engine: Godot `4.6` declared in [`project.godot`](./project.godot)
- Main scene resolved to [`Escena/control.tscn`](./Escena/control.tscn)
- Mixed runtime model:
  - `.gd` scripts for minigame logic
  - Orchestrator `.torch` scripts for menu flow
- Base structure:
  - [`Escena/`](./Escena)
  - [`script/`](./script)
  - [`addons/orchestrator/`](./addons/orchestrator)

### Export status

- Existing presets in [`export_presets.cfg`](./export_presets.cfg):
  - `Linux/X11`
  - `Windows Desktop`
  - `Android`
- The Android preset uses `Gradle`
- Android packaging still requires SDK path configuration in the editor

### Repository risks

- Generated artifacts are mixed with source:
  - [`mente-activa.pck`](./mente-activa.pck)
  - [`ejecutar/`](./ejecutar)
- `orchestrator` vendors multi-platform binaries
- The project required shared theme UID cleanup

### Validation

- Confirmed on host:
  - `rtk`
  - `git`
  - `godot 4.6.3`
  - `adb`
  - `bundletool`
- `scripts/validate-project` passes
- UI startup no longer emits the shared theme broken UID warning after the applied fix
