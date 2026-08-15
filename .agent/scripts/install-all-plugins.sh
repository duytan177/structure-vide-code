#!/usr/bin/env bash
# Wrapper: calls the all-in-one installer in .agent/plugins/installer/
# Keeps the path concise and consistent with the README & workflow rules.
set -e
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
exec bash "$ROOT/.agent/plugins/installer/install-all-plugins.sh" "$@"
