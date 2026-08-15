#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — BOOTSTRAP 1 PHÁT (học UX 'specify init' của spec-kit)
# Gộp: bật git hooks → cài plugin/MCP → phát hiện mode → gợi ý bước tiếp theo.
#   bash .agent/scripts/init.sh
# ==============================================================================
set -u
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER init  —  base version $(cat VERSION 2>/dev/null || echo '?')"
echo "════════════════════════════════════════════════════"

echo "▶ [1/3] Bật git hooks..."
bash "$ROOT/.agent/scripts/setup-hooks.sh" || echo "  ⚠️ setup-hooks lỗi."

echo "▶ [2/3] Cài plugin / MCP + sync skill cho Codex/Antigravity..."
bash "$ROOT/.agent/scripts/install-all-plugins.sh" || echo "  ⚠️ install lỗi (xem log)."
bash "$ROOT/.agent/scripts/sync-skills.sh" || echo "  ⚠️ sync-skills lỗi."

echo "▶ [3/3] Phát hiện mode & gợi ý..."
if [ -d "$ROOT/workspace" ] && find "$ROOT/workspace" -maxdepth 3 -type f \
     \( -name package.json -o -name composer.json -o -name pyproject.toml \
        -o -name go.mod -o -name pom.xml -o -name Cargo.toml \) \
     -not -path '*/node_modules/*' 2>/dev/null | grep -q .; then
  echo "  → Dự án CŨ (brownfield). Chạy tiếp:"
  echo "      bash .agent/scripts/onboard-existing.sh workspace/<ten-du-an>"
else
  echo "  → Dự án MỚI (greenfield). Việc tiếp theo:"
  echo "      1) Tạo source trong workspace/<ten-du-an>/"
  echo "      2) Bỏ yêu cầu vào docs/client-requirements/ + điền docs/CONSTITUTION.md"
  echo "      3) Chạy quy trình từ /discovery"
fi

echo ""
echo "✅ init xong. Kiểm tra: bash .agent/scripts/verify-plugins.sh"
