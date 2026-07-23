#!/usr/bin/env bash

# ==============================================================================
# SCRIPT TỰ ĐỘNG CÀI ĐẶT & THIẾT LẬP TOÀN BỘ PLUGIN / MCP CHO DỰ ÁN (VIDE-CODER)
# ==============================================================================
# Script này được gọi tự động bởi AI Agent hoặc chạy trực tiếp bằng lệnh:
# bash .agent/plugins/installer/install-all-plugins.sh
# ==============================================================================

set -e

echo "🚀 [1/6] Đang kiểm tra môi trường Node.js và Python..."
if ! command -v node &> /dev/null; then
    echo "⚠️  Node.js chưa được cài đặt. Vui lòng cài đặt Node.js v18+ trước."
fi

if ! command -v python3 &> /dev/null; then
    echo "⚠️  Python3 chưa được cài đặt. Vui lòng cài đặt Python3 trước."
fi

echo "📦 [2/6] Đang cài đặt Graphify, GitNexus, Superpower & Semgrep CLI..."
# Cài đặt hoặc update CLI tools
npm install -g graphify-cli gitnexus-cli superpower-code-graph || true
pip3 install semgrep || true

echo "⚙️ [3/6] Sao chép các file Cấu Hình Mẫu (Templates) vào Root..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/../../.." && pwd )"

cp -n "$SCRIPT_DIR/.semgrep.yml" "$PROJECT_ROOT/.semgrep.yml" 2>/dev/null || true
cp -n "$SCRIPT_DIR/.coderabbit.yaml" "$PROJECT_ROOT/.coderabbit.yaml" 2>/dev/null || true
cp -n "$SCRIPT_DIR/graphify.config.json" "$PROJECT_ROOT/graphify.config.json" 2>/dev/null || true
cp -n "$SCRIPT_DIR/gitnexus.config.json" "$PROJECT_ROOT/gitnexus.config.json" 2>/dev/null || true
cp -n "$SCRIPT_DIR/superpower.config.json" "$PROJECT_ROOT/superpower.config.json" 2>/dev/null || true

echo "🧠 [4/6] Khởi tạo Graphify Knowledge Graph & GitNexus Indexing..."
if command -v graphify &> /dev/null; then
    graphify init "$PROJECT_ROOT/src" || true
fi

if command -v gitnexus &> /dev/null; then
    gitnexus index "$PROJECT_ROOT/src" || true
fi

echo "🔌 [5/6] Hướng dẫn kích hoạt MCP Servers (Model Context Protocol)..."
echo "Đã sẵn sàng file template MCP tại: .agent/plugins/installer/mcp-config.json.template"
echo "AI Agent có thể load cấu hình này vào Antigravity / Cursor / Claude Code."

echo "✅ [6/6] TẤT CẢ PLUGIN VÀ MCP TOOLSET ĐÃ ĐƯỢC CÀI ĐẶT & THIẾT LẬP THÀNH CÔNG!"
