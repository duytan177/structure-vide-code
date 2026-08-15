#!/usr/bin/env bash
# ==============================================================================
# SYNC SKILLS — mirror skill canonical (.claude/skills) sang nơi các agent khác đọc.
# Agent Skills là open standard: cùng SKILL.md chạy trên Claude/Cursor/Antigravity/Codex.
#   bash .agent/scripts/sync-skills.sh
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
SRC="$ROOT/.claude/skills"          # canonical (Claude Code)
DST="$ROOT/.agents/skills"          # Codex + Antigravity quét ở đây

[ -d "$SRC" ] || { echo "⚠️ Chưa có $SRC — tạo skill canonical trước."; exit 0; }

mkdir -p "$DST"
# Xóa mirror cũ (chỉ trong .agents/skills), rồi copy lại từ canonical
find "$DST" -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} + 2>/dev/null || true

count=0
for dir in "$SRC"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name="$(basename "$dir")"
  cp -r "$dir" "$DST/$name"
  count=$((count+1))
done

echo "✅ Đã sync $count skill: $SRC  ->  $DST"
echo "   Claude đọc .claude/skills · Codex/Antigravity đọc .agents/skills · Cursor qua AGENTS.md."
