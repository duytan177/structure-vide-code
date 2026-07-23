#!/usr/bin/env bash
# Script Kiểm Tra Trạng Thái Hoạt Động Của 10 Plugins

echo "🔍 Đang kiểm tra trạng thái 10 Plugins & Tools..."

check_tool() {
    if command -v "$1" &> /dev/null; then
        echo "  ✅ $1: Đã cài đặt ($( $1 --version 2>&1 | head -n 1 ))"
    else
        echo "  ❌ $1: Chưa tìm thấy CLI (Vui lòng chạy 'npm run setup:plugins')"
    fi
}

echo "=== KIỂM TRA BỘ TOOLKITS ==="
check_tool node
check_tool npm
check_tool git
check_tool semgrep
check_tool npx

echo "=== KIỂM TRA CÁC FILE CONFIG ==="
[ -f .coderabbit.yaml ] && echo "  ✅ CodeRabbit config (.coderabbit.yaml): OK" || echo "  ❌ Thếu .coderabbit.yaml"
[ -f .semgrep.yml ] && echo "  ✅ Semgrep rules (.semgrep.yml): OK" || echo "  ❌ Thiếu .semgrep.yml"
[ -f package.json ] && echo "  ✅ Package config (package.json): OK" || echo "  ❌ Thiếu package.json"
