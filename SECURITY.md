# Security Policy

## Scope

This repository contains a Godot project and release automation assets.

Security-sensitive areas include:

- release workflows
- exported artifacts
- vendored addon binaries
- Android export configuration

## Reporting

Do not publish suspected security issues in public release notes or casual issues before triage.

Use private maintainer contact paths first when available.

## Release Hygiene

- Releases must be created manually.
- Generated artifacts must come from reproducible scripts in this repository.
- Checksums must be published with every stable release artifact set.
- Secrets such as Android keystore material must never be committed to the repository.

## Review Priorities

- workflow permissions
- third-party binary provenance
- export configuration drift
- accidental inclusion of credentials or signing material
