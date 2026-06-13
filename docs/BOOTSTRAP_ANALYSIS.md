# Bootstrap Analysis

## Current Status

- Local repository synchronized with `origin/main`.
- Active branch: `main`.
- Remote: `https://github.com/0xCyberBerserker/mente-activa.git`.
- Skills installed locally:
  - `~/.codex/skills/godot`
  - `~/.codex/skills/godot-ui`

## Project Shape

- Engine: Godot `4.6` declared in [`project.godot`](/home/aesir/Documentos/mente-activa/project.godot).
- Main scene resolved to [`Escena/control.tscn`](/home/aesir/Documentos/mente-activa/Escena/control.tscn).
- Code style:
  - GDScript gameplay scripts in [`script/`](/home/aesir/Documentos/mente-activa/script)
  - scenes in [`Escena/`](/home/aesir/Documentos/mente-activa/Escena)
  - bundled GDExtension addon in [`addons/orchestrator/`](/home/aesir/Documentos/mente-activa/addons/orchestrator)
- Runtime model is mixed:
  - `.gd` scripts for minigame logic
  - `.torch` Orchestrator scripts for menu flow
- Current gameplay scope appears to be a menu plus two minigames:
  - `MatchDayAndDay`
  - `CompletaelRefrán`

## Export Status

- Existing presets in [`export_presets.cfg`](/home/aesir/Documentos/mente-activa/export_presets.cfg):
  - `Windows Desktop`
  - `Android`
- Missing preset:
  - `Linux/X11` or equivalent Linux desktop preset
- Android preset details:
  - `gradle_build/use_gradle_build=true`
  - package id pattern: `com.guadalgames.$genname`
  - export target path inside repo: `ejecutar/Mente Activa.apk`

## Repository Risks

- Root contains generated/exported artifacts:
  - [`mente-activa.pck`](/home/aesir/Documentos/mente-activa/mente-activa.pck)
  - [`ejecutar/`](/home/aesir/Documentos/mente-activa/ejecutar)
- `.gitignore` ignores exports now, but already tracked generated files remain in history.
- No top-level `README.md`.
- No `docs/` before this bootstrap.
- No visible release automation, checksum flow, manifest flow, or packaging scripts.
- `addons/orchestrator` includes many platform binaries inside the repo. This may be correct for the addon, but it increases repository weight and requires version discipline.

## Tooling Notes

- `git` and `jdk-openjdk` were already present on the host.
- Godot/Android export tooling was requested for installation through package management.
- If the package install succeeds, validate with:

```bash
rtk git status --short --branch
rtk git remote -v
rtk --version
git --version
godot --version
```

## Validation Results

- Confirmed on host:
  - `rtk 0.37.2`
  - `git 2.54.0`
  - `godot 4.6.3.stable.arch_linux`
  - `adb 35.0.2`
  - `bundletool 1.18.3`
- `godot --headless --path ... --quit` failed initially because the main scene UID was not yet imported on this machine.
- `godot --headless --editor --path ... --quit` completed first import work and created `.godot/`, but surfaced project issues:
  - unresolved scene UID `uid://2bg18qkxlkb2` during startup
  - invalid theme UID in [`Escena/control.tscn`](/home/aesir/Documentos/mente-activa/Escena/control.tscn) falling back to `res://main_theme.tres`
  - missing editor setting `export/android/android_sdk_path`
  - leaked objects/RIDs and abnormal termination on editor exit

## Immediate Technical Conclusions

- The host environment is now suitable for Godot work.
- The project still needs a cleanup pass before export automation is trustworthy.
- First repair target should be resource UID consistency, then Android editor/export path configuration, then Linux export preset creation.

## Recommended Next Technical Step

1. Confirm `godot` launches this project headless.
2. Add a Linux export preset.
3. Decide whether tracked exports should stay in Git or move to release artifacts only.
