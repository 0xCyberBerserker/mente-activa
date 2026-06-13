# Repo Organization Review

## Español

### Resumen

El repositorio ya tiene una base mucho más seria, pero aún hay deuda estructural antes de llamar a la automatización de release “cerrada”.

### Prioridad 1

- mantener separados fuente y artefactos generados
- evitar que `ejecutar/` y `.pck` queden como contenido normal del árbol
- formalizar la política de binarios vendorizados de `orchestrator`

### Prioridad 2

- consolidar metadata:
  - `README.md`
  - `SECURITY.md`
  - `VERSION.json`
  - `LICENSE`
- mantener `docs/` como fuente operativa única

### Prioridad 3

- sostener scripts reproducibles:
  - `scripts/validate-project`
  - `scripts/install-linux-templates`
  - `scripts/export-linux`
  - `scripts/package-release`

### Prioridad 4

- endurecer la automatización de release con validaciones extra
- añadir Android cuando el flujo de firma exista

## English

### Summary

The repository now has a much more serious base, but there is still structural debt before calling release automation “closed”.

### Priority 1

- keep source and generated artifacts separated
- avoid treating `ejecutar/` and `.pck` files as normal tree contents
- formalize the vendored binary policy for `orchestrator`

### Priority 2

- consolidate metadata:
  - `README.md`
  - `SECURITY.md`
  - `VERSION.json`
  - `LICENSE`
- keep `docs/` as the single operational source

### Priority 3

- preserve reproducible scripts:
  - `scripts/validate-project`
  - `scripts/install-linux-templates`
  - `scripts/export-linux`
  - `scripts/package-release`

### Priority 4

- harden release automation with extra validation
- add Android once the signing flow exists
