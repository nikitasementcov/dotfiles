#!/bin/sh
# Claude Code only discovers skills one level deep under skills/ (each needs its own
# <name>/SKILL.md). oh-my-claudecode's learner writes flat *.md files directly into
# skills/omc-learned/, so they're invisible to native skill discovery. This mirrors
# each one into skills/<name>/SKILL.md as a symlink back to the original, keeping the
# omc-learned file as the single source of truth.
set -eu

CONFIG_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
SKILLS_DIR="$CONFIG_DIR/skills"
LEARNED_DIR="$SKILLS_DIR/omc-learned"

[ -d "$LEARNED_DIR" ] || exit 0

for src in "$LEARNED_DIR"/*.md; do
  [ -e "$src" ] || continue
  base="$(basename "$src" .md)"
  name="$(awk -F': *' '/^name:/{print $2; exit}' "$src" 2>/dev/null || true)"
  [ -n "${name:-}" ] || name="$base"

  dest_dir="$SKILLS_DIR/$name"
  dest_link="$dest_dir/SKILL.md"
  rel_target="../omc-learned/$(basename "$src")"

  mkdir -p "$dest_dir"
  if [ -L "$dest_link" ]; then
    current="$(readlink "$dest_link")"
    [ "$current" = "$rel_target" ] || ln -sf "$rel_target" "$dest_link"
  elif [ -e "$dest_link" ]; then
    : # a real (non-symlink) SKILL.md already lives here -- leave it alone
  else
    ln -s "$rel_target" "$dest_link"
  fi
done

# Clean up skill dirs this script created whose source file has since been removed.
for dest_link in "$SKILLS_DIR"/*/SKILL.md; do
  [ -L "$dest_link" ] || continue
  target="$(readlink "$dest_link")"
  case "$target" in
    ../omc-learned/*)
      src_name="${target#../omc-learned/}"
      [ -e "$LEARNED_DIR/$src_name" ] || rm -rf "$(dirname "$dest_link")"
      ;;
  esac
done
