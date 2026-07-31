#!/usr/bin/env bash
# Wrapper: gọi installer trọn gói trong .agent/plugins/installer/
# Giữ đường dẫn gọn nhất quán với README & workflow rules.
set -e
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
exec bash "$ROOT/.agent/plugins/installer/install-all-plugins.sh" "$@"
