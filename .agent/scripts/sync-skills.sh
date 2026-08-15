#!/usr/bin/env bash
# ==============================================================================
# SYNC SKILLS — mirror the canonical skills (.claude/skills) to where other agents read them.
# Agent Skills is an open standard: the same SKILL.md runs on Claude Code, Cursor, and Antigravity.
#   bash .agent/scripts/sync-skills.sh
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
SRC="$ROOT/.claude/skills"          # canonical (Claude Code)
DST="$ROOT/.agents/skills"          # Antigravity scans here

[ -d "$SRC" ] || { echo "⚠️ $SRC not found — create the canonical skills first."; exit 0; }

mkdir -p "$DST"
# Remove the old mirror (only within .agents/skills), then copy again from canonical
find "$DST" -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} + 2>/dev/null || true

count=0
for dir in "$SRC"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name="$(basename "$dir")"
  cp -r "$dir" "$DST/$name"
  count=$((count+1))
done

echo "✅ Synced $count skills: $SRC  ->  $DST"
echo "   Claude reads .claude/skills · Antigravity reads .agents/skills · Cursor via AGENTS.md."
