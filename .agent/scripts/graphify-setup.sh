#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — GRAPHIFY CODE-GRAPH FOR ALL WORKSPACE PROJECTS
#
# Builds/maintains a Graphify Knowledge Graph for every project under workspace/.
#
# Usage:
#   bash .agent/scripts/graphify-setup.sh [name]            # setup (index) all, or one project
#   bash .agent/scripts/graphify-setup.sh --action rebuild [name]
#   bash .agent/scripts/graphify-setup.sh --action sync    [name]
#
# Actions:
#   setup    (default) first-time index of each project        -> `graphify init`
#   rebuild  force a full graph rebuild (after many new files) -> `graphify rebuild`
#   sync     `git pull` each git project, then rebuild its graph
#
# Convenience wrappers: graphify-rebuild.sh, graphify-sync.sh
#
# Never edits project source (except `git pull` in sync). Never commits anything.
# Override the CLI commands via env if your Graphify build differs:
#   GRAPHIFY_BIN (default: graphify)
#   GRAPHIFY_INIT_CMD / GRAPHIFY_REBUILD_CMD
# ==============================================================================
set -u

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1
WS="$ROOT/workspace"
CFG_TEMPLATE="$ROOT/.agent/plugins/installer/graphify.config.json"

GRAPHIFY_BIN="${GRAPHIFY_BIN:-graphify}"
# Real Graphify CLI (0.9.x) builds/updates the graph with:  graphify update <path>
# (no LLM needed for extraction). Override if your build differs.
GRAPHIFY_UPDATE_CMD="${GRAPHIFY_UPDATE_CMD:-update}"
# Extra flags for the update command (e.g. --no-cluster to skip LLM community naming).
GRAPHIFY_UPDATE_FLAGS="${GRAPHIFY_UPDATE_FLAGS:-}"

info() { printf '  %s\n' "$*"; }
step() { printf '\n▶ %s\n' "$*"; }
warn() { printf '  ⚠️ %s\n' "$*"; }
has()  { command -v "$1" >/dev/null 2>&1; }

# ----- parse args -----
ACTION="setup"; ONLY=""
while [ "$#" -gt 0 ]; do
  case "$1" in
    --action) ACTION="${2:-setup}"; shift 2 ;;
    -h|--help) sed -n '2,22p' "$0"; exit 0 ;;
    *) ONLY="$1"; shift ;;
  esac
done

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER graphify ($ACTION) — base $(cat "$ROOT/VERSION" 2>/dev/null || echo '?')"
echo "════════════════════════════════════════════════════"

if ! has "$GRAPHIFY_BIN"; then
  warn "'$GRAPHIFY_BIN' CLI not found. Install it first:"
  info "  bash .agent/scripts/install-all-plugins.sh   (see .agent/plugins/graphify.md)"
  info "Then re-run this script. Aborting."
  exit 1
fi

[ -d "$WS" ] || { warn "workspace/ not found."; exit 1; }

# ----- ensure a per-project graphify.config.json exists (does not overwrite) --
ensure_config() {
  local d="$1"
  [ -f "$d/graphify.config.json" ] && return 0
  if [ -f "$CFG_TEMPLATE" ] && has node; then
    # derive projectRoot: use ./src if present, else "."
    local proot="."
    [ -d "$d/src" ] && proot="./src"
    node -e '
      const fs=require("fs");
      const c=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
      c.projectRoot=process.argv[3];
      fs.writeFileSync(process.argv[2], JSON.stringify(c,null,2)+"\n");
    ' "$CFG_TEMPLATE" "$d/graphify.config.json" "$proot" 2>/dev/null \
      && info "config → workspace/$(basename "$d")/graphify.config.json (projectRoot: $proot)" \
      || warn "could not write graphify.config.json for $(basename "$d")"
  fi
}

# ----- run the chosen action for one project dir -----
process_project() {
  local d="$1"; local name; name="$(basename "$d")"
  step "[$ACTION] $name  (workspace/$name)"
  ensure_config "$d"
  ( cd "$d" || exit 1
    case "$ACTION" in
      setup)
        # shellcheck disable=SC2086
        "$GRAPHIFY_BIN" "$GRAPHIFY_UPDATE_CMD" . $GRAPHIFY_UPDATE_FLAGS 2>&1 | sed 's/^/    /' \
          && info "indexed → graphify-out/graph.json" || warn "graphify $GRAPHIFY_UPDATE_CMD failed for $name"
        ;;
      rebuild)
        # shellcheck disable=SC2086
        "$GRAPHIFY_BIN" "$GRAPHIFY_UPDATE_CMD" . --force $GRAPHIFY_UPDATE_FLAGS 2>&1 | sed 's/^/    /' \
          && info "rebuilt (forced)." || warn "graphify $GRAPHIFY_UPDATE_CMD --force failed for $name"
        ;;
      sync)
        if [ -d "$d/.git" ]; then
          info "git pull..."
          git -C "$d" pull --ff-only 2>&1 | sed 's/^/    /' || warn "git pull failed (continuing with rebuild)"
        else
          info "not a git repo — skipping pull, rebuilding only"
        fi
        # shellcheck disable=SC2086
        "$GRAPHIFY_BIN" "$GRAPHIFY_UPDATE_CMD" . --force $GRAPHIFY_UPDATE_FLAGS 2>&1 | sed 's/^/    /' \
          && info "graph synced." || warn "graphify $GRAPHIFY_UPDATE_CMD --force failed for $name"
        ;;
      *) warn "unknown action: $ACTION (use setup|rebuild|sync)"; exit 2 ;;
    esac
  )
}

# ----- iterate projects -----
count=0
if [ -n "$ONLY" ]; then
  if [ -d "$WS/$ONLY" ]; then process_project "$WS/$ONLY"; count=1
  else warn "workspace/$ONLY not found."; exit 1; fi
else
  for d in "$WS"/*/; do
    [ -d "$d" ] || continue
    case "$(basename "$d")" in .git) continue;; esac
    process_project "$d"; count=$((count+1))
  done
fi

step "Done"
if [ "$count" = 0 ]; then
  info "No projects in workspace/. Clone one first:"
  info "  bash .agent/scripts/workspace-setup.sh <repo-url> [name]"
else
  info "Processed $count project(s). Query the graph e.g.: cd workspace/<name> && $GRAPHIFY_BIN query \"SomeService\""
fi
echo ""
echo "✅ graphify $ACTION finished (no commits made)."
