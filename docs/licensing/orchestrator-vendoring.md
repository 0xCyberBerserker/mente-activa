# Orchestrator Vendoring Policy

## Español

- `addons/orchestrator/` contiene binarios y metadatos de terceros necesarios para el proyecto.
- La procedencia funcional es el proyecto `godot-orchestrator` de CraterCrash.
- Su licencia upstream y avisos propios se conservan dentro de `addons/orchestrator/`.
- Este repositorio no relicencia ese addon bajo la licencia principal de `Mente Activa`.
- Cualquier actualización del addon debe revisar:
  - auditoría de seguridad manual previa aprobada por el owner del proyecto
  - integridad de binarios
  - compatibilidad con Godot `4.6.x`
  - impacto en export `Linux`, `Windows` y `Android`
  - continuidad de avisos y licencia upstream
- No se deben subir binarios auxiliares del addon como assets top-level de release. Si una plataforma los necesita, deben viajar dentro del bundle distribuible de esa plataforma.

## English

- `addons/orchestrator/` contains third-party binaries and metadata required by the project.
- The functional upstream source is CraterCrash's `godot-orchestrator` project.
- Upstream licensing and notices remain preserved inside `addons/orchestrator/`.
- This repository does not relicense that addon under the main `Mente Activa` license.
- Any addon update must review:
  - prior manual security audit approved by the project owner
  - binary integrity
  - Godot `4.6.x` compatibility
  - `Linux`, `Windows`, and `Android` export impact
  - continuity of upstream notice and license files
- Addon runtime sidecars must not be published as top-level release assets. If a platform needs them, they must travel inside that platform's distributable bundle.
