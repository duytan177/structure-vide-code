#!/usr/bin/env bash
# ==============================================================================
# CÀI ĐẶT PLUGIN / MCP CHO BASE VIDE-CODER (overlay áp lên dự án đích)
#   bash .agent/scripts/install-all-plugins.sh
# Tự phát hiện dự án MỚI hay CŨ, cài plugin ngoài nổi tiếng (KHÔNG rebuild).
# ==============================================================================
set -u

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( git rev-parse --show-toplevel 2>/dev/null || cd "$SCRIPT_DIR/../../.." && pwd )"

# --- Phát hiện chế độ (mới vs cũ) — quét source trong workspace/ -------------
mode="mới (greenfield)"
if [ -d "$PROJECT_ROOT/workspace" ] && find "$PROJECT_ROOT/workspace" -maxdepth 3 -type f \
     \( -name package.json -o -name composer.json -o -name pyproject.toml \
        -o -name go.mod -o -name pom.xml -o -name Cargo.toml \) \
     -not -path '*/node_modules/*' 2>/dev/null | grep -q .; then
  mode="cũ (brownfield)"
fi
echo "🚀 [1/6] Môi trường phát hiện: dự án $mode"

command -v node    &>/dev/null || echo "  ⚠️ Chưa có Node.js v18+."
command -v python3 &>/dev/null || echo "  ⚠️ Chưa có Python3."

# --- Cài plugin CODE-GRAPH / SECURITY (best-effort) --------------------------
echo "📦 [2/6] Cài Graphify, GitNexus, Superpower(code-graph) & Semgrep..."
# LƯU Ý: xác nhận tên package thật trước khi phụ thuộc. Cài best-effort.
npm install -g graphify-cli gitnexus-cli superpower-code-graph 2>/dev/null || echo "  ⚠️ Một số npm CLI chưa cài được — kiểm tra lại tên package."
pip3 install semgrep 2>/dev/null || echo "  ⚠️ Semgrep chưa cài được."

# --- Cài SUPERPOWERS (methodology engine) — mỗi agent cài riêng ---------------
echo "🦸 [3/6] SUPERPOWERS (engine skill) — cài THỦ CÔNG theo từng agent:"
cat <<'EOS'
  • Claude Code : /plugin marketplace add obra/superpowers  ->  /plugin install superpowers
  • Cursor      : Marketplace plugin -> thêm repo obra/superpowers
  • Codex/Antigravity/Copilot CLI : đăng ký repo github.com/obra/superpowers
  (Plugin KHÔNG chuyển giữa các agent — phải cài riêng từng harness.)
  Chi tiết: .agent/plugins/superpowers.md
EOS

# --- Copy config templates vào root ------------------------------------------
echo "⚙️ [4/6] Sao chép config mẫu vào root (không ghi đè nếu đã có)..."
for f in .semgrep.yml .coderabbit.yaml graphify.config.json gitnexus.config.json superpower.config.json; do
  cp -n "$SCRIPT_DIR/$f" "$PROJECT_ROOT/$f" 2>/dev/null || true
done

# --- Onboarding cho dự án cũ --------------------------------------------------
echo "🧠 [5/6] Index / Onboarding..."
if [ "$mode" = "cũ (brownfield)" ]; then
  echo "  -> Dự án cũ: chạy 'bash .agent/scripts/onboard-existing.sh workspace/<ten-du-an>' để index + sinh baseline."
else
  command -v graphify &>/dev/null && graphify init "$PROJECT_ROOT/workspace" 2>/dev/null || true
fi

echo "🔌 [6/6] MCP: dùng .mcp.json (Claude) / .cursor/mcp.json (Cursor). Bật MCP theo phase (xem plugins/README.md)."
echo "✅ HOÀN TẤT. Chạy 'bash .agent/scripts/verify-plugins.sh' để kiểm tra."
