# Architecture

## English

Mente Activa is a Godot 4 application with a small source tree and manual release pipeline.

```text
Activity data
  -> Godot activity scenes
  -> Menu navigation
  -> Manual Godot exports
  -> GitHub Releases
  -> GitHub Pages index
```

## Main Areas

- `assets/`: branding and shared theme assets.
- `scenes/`: menus and playable activities.
- `scripts/game/`: gameplay, navigation, shared copy, and data loading.
- `data/activities/`: versioned activity content.
- `addons/orchestrator/`: vendored third-party addon; do not treat as first-party code.
- `scripts/validate/`: project, activity data, and release-layout validation.
- `scripts/release/`: release export, metadata, source archive, and Pages rendering.
- `docs/`: development, release, product, and licensing documentation.
- `site/`: public release index and static site.

## Trust Boundaries

- Android signing secrets stay in GitHub Actions secrets, never in git.
- Build outputs stay outside source control.
- Orchestrator updates require manual security audit and explicit owner approval.
- Ordinary commits must not trigger releases; release workflows are manual.

See `docs/development/project-structure.md` for the detailed tree.

---

# Arquitectura

## Español

Mente Activa es una aplicación Godot 4 con árbol fuente pequeño y pipeline de release manual.

## Áreas principales

- `assets/`: branding y theme compartido.
- `scenes/`: menús y actividades jugables.
- `scripts/game/`: gameplay, navegación, copy compartido y carga de datos.
- `data/activities/`: contenido versionado de actividades.
- `addons/orchestrator/`: addon tercero vendorizado; no tratar como código propio.
- `scripts/validate/`: validación de proyecto, datos de actividad y layout de release.
- `scripts/release/`: export de release, metadata, source archive y render de Pages.
- `docs/`: documentación de desarrollo, release, producto y licencias.
- `site/`: índice público de releases y web estática.

## Límites de confianza

- Los secretos de firma Android viven en GitHub Actions secrets, nunca en git.
- Los outputs de build quedan fuera del control de versiones.
- Las actualizaciones de Orchestrator requieren auditoría manual de seguridad y aprobación explícita del owner.
- Los commits ordinarios no deben disparar releases; los workflows de release son manuales.

Consulta `docs/development/project-structure.md` para el árbol detallado.
