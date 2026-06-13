# Mente Activa

## Español

Mente Activa es un proyecto educativo en Godot 4 centrado en minijuegos cortos para entrenar memoria, lenguaje y atención.

### Créditos

- Idea original y creación inicial: [rabu-dev](https://github.com/rabu-dev)
- Colaborador actual y mantenimiento del repositorio: [0xCyberBerserker](https://github.com/0xCyberBerserker)

La definición exacta de roles podrá ajustarse más adelante. Esta atribución queda reflejada desde la primera release estable.

### Alcance actual

- Menú principal implementado con scripts `.torch` de Orchestrator
- Minijuegos implementados en GDScript
- UI compartida basada en tema
- Proyecto Godot `4.6.x` con el addon `orchestrator` vendorizado

### Estructura del repositorio

- [`Escena/`](/home/aesir/Documentos/mente-activa/Escena): escenas Godot
- [`script/`](/home/aesir/Documentos/mente-activa/script): GDScript y scripts de Orchestrator
- [`addons/orchestrator/`](/home/aesir/Documentos/mente-activa/addons/orchestrator): addon y binarios vendorizados
- [`docs/`](/home/aesir/Documentos/mente-activa/docs): documentación operativa y de mantenimiento
- [`scripts/`](/home/aesir/Documentos/mente-activa/scripts): helpers reproducibles para local y CI

### Requisitos

- Godot `4.6.3`
- Export templates de la misma versión
- Para Android: JDK + Android SDK configurados en el editor de Godot

### Validación local

```bash
scripts/validate-project
```

### Export Linux

```bash
scripts/install-linux-templates
scripts/export-linux
```

Los artefactos se escriben en `dist/`.

### Releases

- La automatización de release es manual.
- No se ejecuta ninguna GitHub Action con commits normales.
- La release solo se lanza desde `Actions -> Manual Release`.

El workflow exporta la build Linux de escritorio, empaqueta metadatos de release y publica checksums.

### Seguridad

Consulta [SECURITY.md](/home/aesir/Documentos/mente-activa/SECURITY.md).

### Licencia

Este repositorio usa licencia [MIT](/home/aesir/Documentos/mente-activa/LICENSE), apta para uso comercial y open source.

Made with ❤️

## English

Mente Activa is a Godot 4 educational project focused on short minigames for memory, language, and attention training.

### Credits

- Original concept and initial creation: [rabu-dev](https://github.com/rabu-dev)
- Current collaborator and repository maintenance: [0xCyberBerserker](https://github.com/0xCyberBerserker)

Role naming can be refined later. This attribution is kept explicit from the first stable release onward.

### Current scope

- Main menu implemented with Orchestrator `.torch` scripts
- Minigames implemented in GDScript
- Shared theme-based UI
- Godot `4.6.x` project with a vendored `orchestrator` addon

### Repository layout

- [`Escena/`](/home/aesir/Documentos/mente-activa/Escena): Godot scenes
- [`script/`](/home/aesir/Documentos/mente-activa/script): GDScript and Orchestrator scripts
- [`addons/orchestrator/`](/home/aesir/Documentos/mente-activa/addons/orchestrator): vendored addon binaries and metadata
- [`docs/`](/home/aesir/Documentos/mente-activa/docs): operations and maintenance docs
- [`scripts/`](/home/aesir/Documentos/mente-activa/scripts): reproducible local and CI helpers

### Requirements

- Godot `4.6.3`
- Matching export templates for the same version
- For Android: JDK + Android SDK configured in the Godot editor

### Local validation

```bash
scripts/validate-project
```

### Linux export

```bash
scripts/install-linux-templates
scripts/export-linux
```

Artifacts are written to `dist/`.

### Releases

- Release automation is manual.
- No GitHub Action runs on normal commits.
- A release is triggered only from `Actions -> Manual Release`.

The workflow exports the Linux desktop build, packages release metadata, and publishes checksums.

### Security

See [SECURITY.md](/home/aesir/Documentos/mente-activa/SECURITY.md).

### License

This repository uses the [MIT](/home/aesir/Documentos/mente-activa/LICENSE) license, suitable for commercial use and open source distribution.

Made with ❤️
