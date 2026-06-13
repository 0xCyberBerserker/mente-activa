# Mente Activa

<p align="center">
  <img src="logoma.png" alt="Mente Activa logo" width="180">
</p>

## Español

Mente Activa es un proyecto educativo en Godot 4 centrado en minijuegos cortos para entrenar memoria, lenguaje y atención.

### Branding

- Logo principal del proyecto: [`logoma.png`](./logoma.png)
- Variante vectorial disponible: [`logoma.svg`](./logoma.svg)

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

- [`Escena/`](./Escena): escenas Godot
- [`script/`](./script): GDScript y scripts de Orchestrator
- [`addons/orchestrator/`](./addons/orchestrator): addon y binarios vendorizados
- [`docs/`](./docs): documentación operativa y de mantenimiento
- [`scripts/`](./scripts): helpers reproducibles para local y CI

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

Consulta [SECURITY.md](./SECURITY.md).

### Licencia

Este proyecto es `source-available`.

Es gratuito para uso personal, familiar, educativo, investigación no comercial y entidades no comerciales permitidas.

El uso comercial requiere licencia comercial previa.

Esto incluye, entre otros, el uso por parte de residencias privadas, clínicas privadas, empresas, consultoras, aseguradoras, proveedores SaaS y cualquier entidad que use el software como parte de una actividad económica o un servicio de pago.

No es software open source aprobado por OSI porque restringe el uso comercial.

Consulta:

- [LICENSE](./LICENSE)
- [COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md)
- [LICENSE-FAQ.md](./LICENSE-FAQ.md)

Esto no es asesoramiento legal. Para acuerdos comerciales o reclamaciones, consulta con un abogado cualificado.

Made with ❤️

## English

Mente Activa is a Godot 4 educational project focused on short minigames for memory, language, and attention training.

### Branding

- Primary project logo: [`logoma.png`](./logoma.png)
- Vector variant available: [`logoma.svg`](./logoma.svg)

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

- [`Escena/`](./Escena): Godot scenes
- [`script/`](./script): GDScript and Orchestrator scripts
- [`addons/orchestrator/`](./addons/orchestrator): vendored addon binaries and metadata
- [`docs/`](./docs): operations and maintenance docs
- [`scripts/`](./scripts): reproducible local and CI helpers

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

See [SECURITY.md](./SECURITY.md).

### License

This project is `source-available`.

It is free for personal, family, educational, non-commercial research, and permitted non-commercial entity use.

Commercial use requires a prior commercial license.

This includes, among others, use by private care homes, private clinics, companies, consultancies, insurers, SaaS providers, and any entity using the software as part of an economic activity or paid service.

It is not OSI-approved open source because it restricts commercial use.

See:

- [LICENSE](./LICENSE)
- [COMMERCIAL-LICENSE.md](./COMMERCIAL-LICENSE.md)
- [LICENSE-FAQ.md](./LICENSE-FAQ.md)

This is not legal advice. For commercial agreements or enforcement, consult a qualified lawyer.

Made with ❤️
