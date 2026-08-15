#!/usr/bin/env bash
# ==============================================================================
# INSTALL PLUGINS / MCP FOR THE VIDE-CODER BASE (overlay applied onto the target project)
#   bash .agent/scripts/install-all-plugins.sh
# Auto-detects whether the project is NEW or EXISTING, installs well-known external plugins (does NOT rebuild).
# ==============================================================================
set -u

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( git rev-parse --show-toplevel 2>/dev/null || cd "$SCRIPT_DIR/../../.." && pwd )"

# --- Detect mode (new vs existing) — scan source in workspace/ ---------------
mode="new (greenfield)"
if [ -d "$PROJECT_ROOT/workspace" ] && find "$PROJECT_ROOT/workspace" -maxdepth 3 -type f \
     \( -name package.json -o -name composer.json -o -name pyproject.toml \
        -o -name go.mod -o -name pom.xml -o -name Cargo.toml \) \
     -not -path '*/node_modules/*' 2>/dev/null | grep -q .; then
  mode="existing (brownfield)"
fi
echo "🚀 [1/6] Detected environment: $mode project"

command -v node    &>/dev/null || echo "  ⚠️ Node.js v18+ not found."
command -v python3 &>/dev/null || echo "  ⚠️ Python3 not found."

# --- Install CODE-GRAPH / SECURITY plugins (best-effort, verified package names) ---
echo "📦 [2/6] Installing Graphify (PyPI), GitNexus (npm) & Semgrep..."
# Graphify: PyPI package is 'graphifyy'; the CLI command stays 'graphify'.
pip3 install graphifyy 2>/dev/null && echo "  ✓ graphify (graphifyy)" || echo "  ⚠️ graphify (pip install graphifyy) failed."
# GitNexus: npm package 'gitnexus'; usable via 'npx gitnexus analyze' or global install.
npm install -g gitnexus 2>/dev/null && echo "  ✓ gitnexus" || echo "  ⚠️ gitnexus (npm i -g gitnexus) failed — you can also use 'npx gitnexus'."
# Security scanner.
pip3 install semgrep 2>/dev/null && echo "  ✓ semgrep" || echo "  ⚠️ Semgrep could not be installed."

# --- Install SUPERPOWERS (methodology engine) — each agent installs separately ---------------
echo "🦸 [3/6] SUPERPOWERS (skill engine) — install MANUALLY per agent:"
cat <<'EOS'
  • Claude Code : /plugin marketplace add obra/superpowers  ->  /plugin install superpowers
  • Cursor      : Marketplace plugin -> add the obra/superpowers repo
  • Antigravity : register the github.com/obra/superpowers repo
  (The plugin does NOT transfer between agents — it must be installed separately per harness.)
  Details: .agent/plugins/superpowers.md
EOS

# --- Copy config templates into root ------------------------------------------
echo "⚙️ [4/6] Copying sample configs into root (does not overwrite if already present)..."
for f in .semgrep.yml .coderabbit.yaml graphify.config.json gitnexus.config.json superpower.config.json; do
  cp -n "$SCRIPT_DIR/$f" "$PROJECT_ROOT/$f" 2>/dev/null || true
done

# --- Onboarding for existing projects -----------------------------------------
echo "🧠 [5/6] Index / Onboarding..."
if [ "$mode" = "existing (brownfield)" ]; then
  echo "  -> Existing project: run 'bash .agent/scripts/onboard-existing.sh workspace/<project-name>' to index + generate a baseline."
else
  command -v graphify &>/dev/null && graphify init "$PROJECT_ROOT/workspace" 2>/dev/null || true
fi

echo "🔌 [6/6] MCP: edit .agent/mcp/servers.json + keys in .env, then run 'bash .agent/scripts/setup-mcp.sh'"
echo "        → syncs .mcp.json (Claude), .cursor/mcp.json (Cursor), .agents/mcp_config.json (Antigravity). Enable per phase (see plugins/README.md)."
echo "✅ DONE. Run 'bash .agent/scripts/verify-plugins.sh' to check."
