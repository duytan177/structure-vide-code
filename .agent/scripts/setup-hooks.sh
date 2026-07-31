#!/usr/bin/env bash
# Kích hoạt git hooks dùng chung (core.hooksPath). Chạy: bash .agent/scripts/setup-hooks.sh
set -e
ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"
git config core.hooksPath .githooks
chmod +x .githooks/* 2>/dev/null || true
echo "✅ Đã bật git hooks tại .githooks (commit-msg, pre-commit)."
