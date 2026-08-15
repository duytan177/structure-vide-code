#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — ONE MCP SETUP (Claude Code + Cursor + Antigravity)
#
# Single source of truth for MCP servers:  .agent/mcp/servers.json
# Single place for secrets/keys:            .env  (template: .env.example)
#
# This script distributes the canonical server list to each agent's config:
#   .mcp.json                 → Claude Code
#   .cursor/mcp.json          → Cursor
#   .agents/mcp_config.json   → Antigravity  (gitignored)
#
# Usage:
#   bash .agent/scripts/setup-mcp.sh            # write ${VAR} placeholders (keys stay in .env)
#   bash .agent/scripts/setup-mcp.sh --inline   # ALSO inline real key values from .env into the
#                                               # Antigravity config only (it is gitignored, so safe)
#
# Never commits. Secrets are never written to tracked files.
# ==============================================================================
set -u

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1
CANON="$ROOT/.agent/mcp/servers.json"

info() { printf '  %s\n' "$*"; }
warn() { printf '  ⚠️ %s\n' "$*"; }
has()  { command -v "$1" >/dev/null 2>&1; }

INLINE=0
[ "${1:-}" = "--inline" ] && INLINE=1

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER setup-mcp — Claude · Cursor · Antigravity"
echo "════════════════════════════════════════════════════"

[ -f "$CANON" ] || { warn "canonical not found: $CANON"; exit 1; }
has node || { warn "node required."; exit 1; }

# ----- ensure .env exists (single place for keys) -----
if [ ! -f "$ROOT/.env" ]; then
  if [ -f "$ROOT/.env.example" ]; then
    cp "$ROOT/.env.example" "$ROOT/.env"
    info "created .env from .env.example — fill in your real keys there (it is gitignored)."
  else
    warn ".env and .env.example both missing — MCP servers needing keys may not start."
  fi
else
  info ".env found (single place for keys)."
fi

# ----- build the clean {mcpServers} from canonical (strip // comment keys) -----
CLEAN="$(node -e '
  const fs=require("fs");
  const c=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
  process.stdout.write(JSON.stringify({mcpServers:c.mcpServers||{}}, null, 2)+"\n");
' "$CANON")" || { warn "failed to parse canonical servers.json"; exit 1; }

write_config() {
  local path="$1"
  mkdir -p "$(dirname "$path")"
  printf '%s' "$CLEAN" > "$path"
  info "wrote $path"
}

# ----- distribute placeholders to the three agents -----
write_config "$ROOT/.mcp.json"                # Claude Code
write_config "$ROOT/.cursor/mcp.json"         # Cursor
write_config "$ROOT/.agents/mcp_config.json"  # Antigravity (gitignored)

# ----- optionally inline real keys into the Antigravity config only -----
if [ "$INLINE" = 1 ]; then
  node -e '
    const fs=require("fs");
    const root=process.argv[1], envp=root+"/.env", target=root+"/.agents/mcp_config.json";
    const env={};
    if(fs.existsSync(envp)){
      for(const line of fs.readFileSync(envp,"utf8").split("\n")){
        const m=line.match(/^\s*([A-Z0-9_]+)\s*=\s*(.*)\s*$/);
        if(m) env[m[1]]=m[2];
      }
    }
    let s=fs.readFileSync(target,"utf8");
    // ${VAR:-default} → env value or default
    s=s.replace(/\$\{([A-Z0-9_]+):-([^}]*)\}/g,(_,k,d)=> env[k] && env[k].length ? env[k] : d);
    // ${VAR} → env value or empty
    s=s.replace(/\$\{([A-Z0-9_]+)\}/g,(_,k)=> env[k] || "");
    fs.writeFileSync(target,s);
  ' "$ROOT"
  warn "inlined real keys into .agents/mcp_config.json (gitignored — do not track it)."
fi

# ----- validate JSON outputs -----
ok=1
for f in .mcp.json .cursor/mcp.json .agents/mcp_config.json; do
  node -e "JSON.parse(require('fs').readFileSync('$ROOT/$f','utf8'))" 2>/dev/null \
    && info "valid: $f" || { warn "INVALID JSON: $f"; ok=0; }
done

echo ""
if [ "$ok" = 1 ]; then
  echo "✅ setup-mcp done. Edit servers in .agent/mcp/servers.json · keys in .env · re-run to sync."
else
  echo "⚠️ setup-mcp finished with JSON errors — check the canonical .agent/mcp/servers.json."
fi
echo "(no commits made)"
