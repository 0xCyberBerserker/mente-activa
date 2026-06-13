# Mente Activa

Mente Activa is a Godot 4 educational game project focused on short cognitive minigames for memory, language, and attention training.

## Credits

- Original concept and initial creation: [rabu-dev](https://github.com/rabu-dev)
- Current collaboration and repository maintenance: [0xCyberBerserker](https://github.com/0xCyberBerserker)

Role naming and ownership details can be refined later. This repository keeps the attribution explicit from the first stable release onward.

## Current Scope

- Main menu implemented with Orchestrator `.torch` scripts
- Gameplay minigames implemented in GDScript
- Shared theme-based UI
- Godot `4.6.x` project with bundled `orchestrator` addon

## Repository Layout

- [`Escena/`](/home/aesir/Documentos/mente-activa/Escena): Godot scenes
- [`script/`](/home/aesir/Documentos/mente-activa/script): GDScript and Orchestrator scripts
- [`addons/orchestrator/`](/home/aesir/Documentos/mente-activa/addons/orchestrator): vendored addon binaries and metadata
- [`docs/`](/home/aesir/Documentos/mente-activa/docs): operational and maintenance documentation
- [`scripts/`](/home/aesir/Documentos/mente-activa/scripts): reproducible local and CI helpers

## Requirements

- Godot `4.6.3`
- Matching export templates for the same Godot version
- For Android exports: JDK + Android SDK tools configured in Godot editor settings

## Local Validation

```bash
scripts/validate-project
```

## Linux Export

```bash
scripts/install-linux-templates
scripts/export-linux
```

Artifacts are written to `dist/`.

## Releases

- Release automation is manual only.
- No GitHub Action runs on normal commits.
- A release is created only through `Actions -> Manual Release`.

The workflow exports the Linux desktop build, packages release metadata, and publishes checksums.

## Security

See [SECURITY.md](/home/aesir/Documentos/mente-activa/SECURITY.md).

## License

This repository currently ships under the existing [LICENSE](/home/aesir/Documentos/mente-activa/LICENSE).

Made with 🖤 in Barcelona City 🇪🇸
