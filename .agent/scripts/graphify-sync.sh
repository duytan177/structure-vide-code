#!/usr/bin/env bash
# Wrapper: sync each workspace git project (git pull) then rebuild its Graphify graph.
#   bash .agent/scripts/graphify-sync.sh [name]
set -e
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
exec bash "$ROOT/.agent/scripts/graphify-setup.sh" --action sync "$@"
