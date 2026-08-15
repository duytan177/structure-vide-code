#!/usr/bin/env bash
# Validate SKILL.md against the Agent Skills standard (agentskills.io). Used both locally & in CI.
#   bash .agent/scripts/validate-skills.sh
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
DIR="$ROOT/.claude/skills"
fail=0; n=0

[ -d "$DIR" ] || { echo "⚠️ $DIR not found"; exit 0; }

for f in "$DIR"/*/SKILL.md; do
  [ -f "$f" ] || continue
  n=$((n+1))
  name_dir="$(basename "$(dirname "$f")")"
  # Extract the first frontmatter block
  fm="$(awk 'NR==1&&/^---/{f=1;next} f&&/^---/{exit} f{print}' "$f")"
  name="$(printf '%s\n' "$fm" | sed -nE 's/^name:[[:space:]]*([^[:space:]]+).*/\1/p' | head -1)"
  desc="$(printf '%s\n' "$fm" | grep -c '^description:')"

  err=""
  [ -n "$name" ] || err="$err [missing name]"
  [ "$name" = "$name_dir" ] || err="$err [name!=folder ($name vs $name_dir)]"
  printf '%s' "$name" | grep -Eq '^[a-z0-9]([a-z0-9-]*[a-z0-9])?$' || err="$err [name not kebab-case]"
  [ "${#name}" -le 64 ] || err="$err [name >64]"
  [ "$desc" -ge 1 ] || err="$err [missing description]"

  if [ -n "$err" ]; then echo "  ❌ $name_dir:$err"; fail=$((fail+1)); fi
done

echo "----"
if [ "$fail" -eq 0 ]; then
  echo "✅ $n/$n SKILL.md valid."
else
  echo "❌ $fail/$n SKILL.md failed."; exit 1
fi
