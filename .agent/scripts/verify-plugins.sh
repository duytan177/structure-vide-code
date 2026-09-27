#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — VERIFY PLUGIN / MCP STATUS
# Checks the CLIs, config files, and MCP servers the base declares as available.
# Read-only: never installs/modifies anything. Run after install-all-plugins.sh
# and setup-mcp.sh to confirm they actually took effect.
#   bash .agent/scripts/verify-plugins.sh
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1

ok()   { printf '  ✅ %s\n' "$*"; }
miss() { printf '  ❌ %s\n' "$*"; }
warn() { printf '  ⚠️  %s\n' "$*"; }
sect() { printf '\n▶ %s\n' "$*"; }

# Load .env (if present) so MCP env-var checks below see real values.
if [ -f .env ]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

echo "🔍 Vide-Coder plugin/MCP status"

sect "CLIs"
check_tool() {
  if command -v "$1" >/dev/null 2>&1; then
    ok "$1: $($1 --version 2>&1 | head -n1)"
  else
    miss "$1: not found${2:+ ($2)}"
  fi
}
check_tool node
check_tool npm
check_tool npx
check_tool git
check_tool semgrep   "optional — pip3 install semgrep"
check_tool graphify  "optional — pip3 install graphifyy"
check_tool gitnexus  "optional — npm install -g gitnexus"

sect "Config files"
for f in .semgrep.yml .coderabbit.yaml .agent/mcp/servers.json .mcp.json .cursor/mcp.json .agents/mcp_config.json; do
  [ -f "$f" ] && ok "$f" || miss "$f"
done

sect "MCP servers declared in .agent/mcp/servers.json"
if command -v node >/dev/null 2>&1 && [ -f .agent/mcp/servers.json ]; then
  node -e '
    const fs = require("fs");
    const canon = JSON.parse(fs.readFileSync(".agent/mcp/servers.json","utf8")).mcpServers || {};
    for (const [name, cfg] of Object.entries(canon)) {
      const envKeys = Object.keys(cfg.env || {});
      const missing = envKeys.filter(k => {
        const ref = (cfg.env[k].match(/\$\{([A-Z0-9_]+)/) || [])[1] || k;
        return !process.env[ref];
      });
      if (missing.length) {
        console.log("  ⚠️  " + name + ": needs env var(s) " + missing.join(", ") + " (set in .env)");
      } else {
        console.log("  ✅ " + name + (envKeys.length ? " (env OK)" : ""));
      }
    }
  '
  canon_keys=$(node -e "console.log(Object.keys(JSON.parse(require('fs').readFileSync('.agent/mcp/servers.json','utf8')).mcpServers).sort().join(','))" 2>/dev/null)
  for f in .mcp.json .cursor/mcp.json .agents/mcp_config.json; do
    if [ -f "$f" ]; then
      cur=$(node -e "console.log(Object.keys(JSON.parse(require('fs').readFileSync('$f','utf8')).mcpServers||{}).sort().join(','))" 2>/dev/null)
      [ "$canon_keys" = "$cur" ] && ok "$f in sync" || warn "$f out of sync — run: bash .agent/scripts/setup-mcp.sh"
    else
      warn "$f missing — run: bash .agent/scripts/setup-mcp.sh"
    fi
  done
else
  warn "node not found or .agent/mcp/servers.json missing — cannot check MCP servers"
fi

sect "Next steps"
echo "  Install missing CLIs / config templates: bash .agent/scripts/install-all-plugins.sh"
echo "  Sync MCP servers to all 3 agents:         bash .agent/scripts/setup-mcp.sh"
echo "  Fill in secrets first:                    cp .env.example .env && edit .env"
