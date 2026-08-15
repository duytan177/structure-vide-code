#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — ONE-SHOT BOOTSTRAP (inspired by spec-kit's 'specify init' UX)
# Combines: enable git hooks -> install plugins/MCP -> detect mode -> suggest next step.
#   bash .agent/scripts/init.sh
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER init  —  base version $(cat VERSION 2>/dev/null || echo '?')"
echo "════════════════════════════════════════════════════"

echo "▶ [1/3] Enabling git hooks..."
bash "$ROOT/.agent/scripts/setup-hooks.sh" || echo "  ⚠️ setup-hooks failed."

echo "▶ [2/3] Installing plugins + syncing skills (Antigravity) + wiring MCP (Claude/Cursor/Antigravity)..."
bash "$ROOT/.agent/scripts/install-all-plugins.sh" || echo "  ⚠️ install failed (see log)."
bash "$ROOT/.agent/scripts/sync-skills.sh" || echo "  ⚠️ sync-skills failed."
bash "$ROOT/.agent/scripts/setup-mcp.sh" >/dev/null 2>&1 && echo "  ✓ MCP synced to all agents." || echo "  ⚠️ setup-mcp failed."

echo "▶ [3/3] Detecting mode & suggesting next steps..."
if [ -d "$ROOT/workspace" ] && find "$ROOT/workspace" -maxdepth 3 -type f \
     \( -name package.json -o -name composer.json -o -name pyproject.toml \
        -o -name go.mod -o -name pom.xml -o -name Cargo.toml \) \
     -not -path '*/node_modules/*' 2>/dev/null | grep -q .; then
  echo "  → EXISTING project (brownfield). Continue with:"
  echo "      bash .agent/scripts/onboard-existing.sh workspace/<project-name>"
else
  echo "  → NEW project (greenfield). Next steps:"
  echo "      1) Create source in workspace/<project-name>/"
  echo "      2) Drop requirements into docs/client-requirements/ + fill in docs/CONSTITUTION.md"
  echo "      3) Run the workflow starting from /discovery"
fi

echo ""
echo "✅ init done. Verify with: bash .agent/scripts/verify-plugins.sh"
