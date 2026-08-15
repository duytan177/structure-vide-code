#!/usr/bin/env bash
# Enable shared git hooks (core.hooksPath). Run: bash .agent/scripts/setup-hooks.sh
set -e
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
git config core.hooksPath .githooks
# Only the actual hooks are made executable (not README.md and other docs).
chmod +x .githooks/pre-commit 2>/dev/null || true
echo "✅ Git hooks enabled at .githooks (pre-commit)."
