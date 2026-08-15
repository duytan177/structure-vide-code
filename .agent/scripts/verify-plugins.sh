#!/usr/bin/env bash
# Script to check the operational status of the 10 Plugins

echo "🔍 Checking the status of the 10 Plugins & Tools..."

check_tool() {
    if command -v "$1" &> /dev/null; then
        echo "  ✅ $1: Installed ($( $1 --version 2>&1 | head -n 1 ))"
    else
        echo "  ❌ $1: CLI not found (Please run 'npm run setup:plugins')"
    fi
}

echo "=== CHECKING TOOLKITS ==="
check_tool node
check_tool npm
check_tool git
check_tool semgrep
check_tool npx

echo "=== CHECKING CONFIG FILES ==="
[ -f .coderabbit.yaml ] && echo "  ✅ CodeRabbit config (.coderabbit.yaml): OK" || echo "  ❌ Missing .coderabbit.yaml"
[ -f .semgrep.yml ] && echo "  ✅ Semgrep rules (.semgrep.yml): OK" || echo "  ❌ Missing .semgrep.yml"
[ -f package.json ] && echo "  ✅ Package config (package.json): OK" || echo "  ❌ Missing package.json"
