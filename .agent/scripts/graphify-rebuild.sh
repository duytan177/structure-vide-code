#!/usr/bin/env bash
# Wrapper: force a full Graphify graph rebuild for all workspace projects (or one).
#   bash .agent/scripts/graphify-rebuild.sh [name]
set -e
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
exec bash "$ROOT/.agent/scripts/graphify-setup.sh" --action rebuild "$@"
