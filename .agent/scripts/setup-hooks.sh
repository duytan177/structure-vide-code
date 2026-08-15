#!/usr/bin/env bash
# Enable shared git hooks (core.hooksPath). Run: bash .agent/scripts/setup-hooks.sh
set -e
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
git config core.hooksPath .githooks
chmod +x .githooks/* 2>/dev/null || true
echo "✅ Git hooks enabled at .githooks (commit-msg, pre-commit)."
