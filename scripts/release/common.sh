#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
version_file="$repo_root/VERSION.json"

json_get() {
  local filter="$1"
  jq -r "$filter" "$version_file"
}

target_json_get() {
  local target="$1"
  local filter="$2"
  jq -r --arg target "$target" ".targets[\$target]${filter}" "$version_file"
}

require_commands() {
  local cmd
  for cmd in "$@"; do
    command -v "$cmd" >/dev/null
  done
}

clean_dir() {
  local dir="$1"
  rm -rf "$dir"
  mkdir -p "$dir"
}

ensure_dir() {
  mkdir -p "$1"
}

templates_dir() {
  local godot_version
  godot_version="$(json_get '.godotVersion')"
  printf '%s\n' "${HOME}/.local/share/godot/export_templates/${godot_version//-/.}"
}

release_workspace() {
  mkdir -p "$repo_root/build"
  : > "$repo_root/build/.gdignore"
  printf '%s\n' "$repo_root/build/release"
}

sha256_file() {
  sha256sum "$1" | awk '{print $1}'
}
