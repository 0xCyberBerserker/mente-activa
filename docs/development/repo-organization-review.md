# Repo Organization Review

## Español

### Resumen

El repositorio ya adopta una estructura más profesional: `assets/`, `scenes/`, `scripts/game/`, `scripts/release/`, `scripts/validate/`, `docs/` y `site/` tienen ahora responsabilidades más claras. Aun así, esta guía sigue siendo el recordatorio de disciplina operativa.

### Prioridad 1

- mantener separados fuente y artefactos generados
- mantener `build/`, `dist/` y `ejecutar/` fuera del árbol versionado normal
- sostener la política de binarios vendorizados de `orchestrator`
- evitar cualquier regreso a rutas legacy como `Escena/` o `script/`

### Prioridad 2

- consolidar metadata pública mínima:
  - `README.md`
  - `SECURITY.md`
  - `VERSION.json`
  - licencias
- mantener `docs/` como fuente operativa única

### Prioridad 3

- sostener scripts reproducibles:
  - `scripts/validate/project`
  - `scripts/release/install-templates`
  - `scripts/release/export-target`
  - `scripts/release/build-release-metadata`
  - `scripts/release/render-release-index`

### Prioridad 4

- endurecer la automatización de release con validaciones extra
- mantener GitHub Pages y tabla de versiones generadas desde datos reales de release

## English

### Summary

The repository now follows a more professional layout: `assets/`, `scenes/`, `scripts/game/`, `scripts/release/`, `scripts/validate/`, `docs/`, and `site/` each have clearer responsibilities. This note remains the operational discipline checkpoint.

### Priority 1

- keep source and generated artifacts separated
- keep `build/`, `dist/`, and `ejecutar/` outside the normal versioned tree
- preserve the vendored binary policy for `orchestrator`
- prevent any return to legacy paths such as `Escena/` or `script/`

### Priority 2

- consolidate minimal public metadata:
  - `README.md`
  - `SECURITY.md`
  - `VERSION.json`
  - licensing files
- keep `docs/` as the single operational source

### Priority 3

- preserve reproducible scripts:
  - `scripts/validate/project`
  - `scripts/release/install-templates`
  - `scripts/release/export-target`
  - `scripts/release/build-release-metadata`
  - `scripts/release/render-release-index`

### Priority 4

- harden release automation with extra validation
- keep GitHub Pages and the version table generated from real release data
