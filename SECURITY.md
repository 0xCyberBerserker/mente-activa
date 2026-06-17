# Security Policy

## Español

### Alcance

Este repositorio contiene un proyecto Godot y activos de automatización de releases.

Las zonas sensibles incluyen:

- workflows de release
- artefactos exportados
- binarios de terceros vendorizados
- configuración de export Android

### Reporte

No publiques problemas de seguridad sospechados en notas de release públicas ni en issues casuales antes de triage.

Usa primero canales privados de mantenimiento cuando existan.

### Higiene de release

- Las releases deben crearse manualmente.
- Los artefactos generados deben salir de scripts reproducibles en este repositorio.
- Cada release publicada debe incluir checksums.
- Secretos como keystores o credenciales Android no deben entrar en Git.

### Prioridades de revisión

- permisos de workflows
- procedencia de binarios de terceros
- drift de configuración de export
- inclusión accidental de credenciales o material de firma

## English

### Scope

This repository contains a Godot project and release automation assets.

Security-sensitive areas include:

- release workflows
- exported artifacts
- vendored third-party binaries
- Android export configuration

### Reporting

Do not publish suspected security issues in public release notes or casual issues before triage.

Use private maintainer channels first when available.

### Release hygiene

- Releases must be created manually.
- Generated artifacts must come from reproducible scripts in this repository.
- Every published release should include checksums.
- Secrets such as Android keystores or credentials must never be committed to Git.

### Review priorities

- workflow permissions
- third-party binary provenance
- export configuration drift
- accidental inclusion of credentials or signing material
