#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — BASE SELF-TEST (smoke test)
# Verifies the integrity of the base itself (NOT the target project).
# Run any time, especially before committing base changes:
#   bash .agent/scripts/self-test.sh
# Exits non-zero if any check fails.
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1

PASS=0; FAIL=0
ok()   { printf '  ✅ %s\n' "$*"; PASS=$((PASS+1)); }
bad()  { printf '  ❌ %s\n' "$*"; FAIL=$((FAIL+1)); }
sect() { printf '\n▶ %s\n' "$*"; }

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER self-test — base $(cat VERSION 2>/dev/null || echo '?')"
echo "════════════════════════════════════════════════════"

# 1) Shell scripts + hooks parse cleanly
sect "1. Shell syntax"
for f in .agent/scripts/*.sh .agent/plugins/installer/*.sh .githooks/commit-msg .githooks/pre-commit; do
  [ -f "$f" ] || continue
  if bash -n "$f" 2>/dev/null; then ok "$(basename "$f")"; else bad "syntax: $f"; fi
done

# 2) JSON configs are valid
sect "2. JSON validity"
for j in .agent/mcp/servers.json .mcp.json .cursor/mcp.json .claude/settings.json \
         .agent/plugins/installer/graphify.config.json .agent/plugins/installer/gitnexus.config.json; do
  [ -f "$j" ] || { bad "missing: $j"; continue; }
  if node -e "JSON.parse(require('fs').readFileSync('$j','utf8'))" 2>/dev/null; then ok "$j"; else bad "invalid JSON: $j"; fi
done

# 3) Skills valid (delegate)
sect "3. Skills"
if bash .agent/scripts/validate-skills.sh >/dev/null 2>&1; then
  ok "$(ls .claude/skills | wc -l | tr -d ' ') skills valid"
else bad "validate-skills reported problems"; fi

# 4) Required structure present
sect "4. Structure"
for p in .agent/rules/00-ai-workflow.md CLAUDE.md AGENTS.md .env.example \
         .agent/mcp/servers.json workspace/README.md reference/README.md \
         .claude/commands .cursor/commands docs/CONSTITUTION.md; do
  [ -e "$p" ] && ok "$p" || bad "missing: $p"
done

# 5) Only supported agents (no stray configs)
sect "5. Supported agents = Claude · Cursor · Antigravity only"
for stray in .windsurf GEMINI.md .github/copilot-instructions.md; do
  [ -e "$stray" ] && bad "stray agent artifact: $stray" || ok "absent: $stray"
done
if git ls-files | grep -vE '^workspace/|^CHANGELOG.md$' | xargs grep -lE '\bCodex\b|\bWindsurf\b|\bCopilot\b|\bGemini\b' 2>/dev/null | grep -q .; then
  bad "removed-agent mentions still present (see grep)"
else ok "no removed-agent mentions"; fi

# 6) MCP canonical distributes to all three agents
sect "6. MCP one-source distribution"
if command -v node >/dev/null 2>&1; then
  canon_keys=$(node -e "console.log(Object.keys(JSON.parse(require('fs').readFileSync('.agent/mcp/servers.json','utf8')).mcpServers).sort().join(','))" 2>/dev/null)
  for f in .mcp.json .cursor/mcp.json; do
    if [ -f "$f" ]; then
      k=$(node -e "console.log(Object.keys(JSON.parse(require('fs').readFileSync('$f','utf8')).mcpServers||{}).sort().join(','))" 2>/dev/null)
      [ "$k" = "$canon_keys" ] && ok "$f in sync with canonical" || bad "$f OUT OF SYNC — run setup-mcp.sh"
    else bad "missing generated config: $f (run setup-mcp.sh)"; fi
  done
else bad "node not found — cannot check MCP"; fi

# 7) Internal markdown links resolve (root-relative or true-relative)
sect "7. Markdown links"
deadlinks=0
while IFS= read -r f; do
  dir=$(dirname "$f")
  grep -oE '\]\([^)]+\)' "$f" 2>/dev/null | sed -E 's/^\]\(//; s/\)$//' | while read -r link; do
    case "$link" in http*|\#*|mailto*|"") continue;; esac
    t="${link%%#*}"
    # accept either true-relative (from file dir) or root-relative
    if [ -e "$dir/$t" ] || [ -e "$ROOT/$t" ]; then :; else echo "X $f -> $link"; fi
  done
done < <(git ls-files '*.md' | grep -vE '^workspace/') > /tmp/vc-deadlinks.$$ 2>/dev/null
deadlinks=$(wc -l < /tmp/vc-deadlinks.$$ | tr -d ' '); rm -f /tmp/vc-deadlinks.$$
[ "$deadlinks" = 0 ] && ok "no dead internal links" || bad "$deadlinks dead internal link(s)"

# ---- summary ----
echo ""
echo "════════════════════════════════════════════════════"
if [ "$FAIL" = 0 ]; then
  echo " ✅ SELF-TEST PASSED — $PASS checks OK"
  echo "════════════════════════════════════════════════════"
  exit 0
else
  echo " ❌ SELF-TEST FAILED — $FAIL failed, $PASS passed"
  echo "════════════════════════════════════════════════════"
  exit 1
fi
