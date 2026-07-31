#!/usr/bin/env bash
# ==============================================================================
# BƯỚC 0 — ONBOARDING DỰ ÁN CŨ (BROWNFIELD)
# Index codebase hiện có + sinh baseline để làm mốc cho Impact Analysis (Bước 2).
# KHÔNG đụng source của dự án đích — chỉ đọc & sinh tài liệu vào docs/specs/_baseline/.
#   bash .agent/scripts/onboard-existing.sh [đường-dẫn-source, mặc định: .]
# ==============================================================================
set -u

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
# Mặc định index toàn bộ workspace/ (nơi chứa source dự án). Có thể truyền path cụ thể: workspace/<ten-du-an>
SRC="${1:-$ROOT/workspace}"
BASELINE_DIR="$ROOT/docs/specs/_baseline"
mkdir -p "$BASELINE_DIR"

echo "🔎 [Bước 0] Onboarding dự án cũ. Source: $SRC"

# 1. Index bằng Graphify (nếu có)
if command -v graphify &>/dev/null; then
  echo "🧠 Graphify index..."
  graphify init "$SRC" || echo "  ⚠️ graphify init lỗi (bỏ qua)."
else
  echo "  ⚠️ Chưa có 'graphify' CLI — bỏ qua index. Chạy install-all-plugins.sh trước."
fi

# 2. Index bằng GitNexus (nếu có)
if command -v gitnexus &>/dev/null; then
  echo "🧠 GitNexus index..."
  gitnexus index "$SRC" || echo "  ⚠️ gitnexus index lỗi (bỏ qua)."
else
  echo "  ⚠️ Chưa có 'gitnexus' CLI — bỏ qua."
fi

# 3. Sinh baseline hiện trạng (khung để AI Agent điền tiếp)
BASELINE_FILE="$BASELINE_DIR/README.md"
if [ ! -f "$BASELINE_FILE" ]; then
  {
    echo "# BASELINE — Hiện trạng dự án (brownfield)"
    echo ""
    echo "> Sinh tự động bởi onboard-existing.sh. AI Agent điền/đối chiếu ở Bước 1-2."
    echo ""
    echo "## Cây thư mục cấp cao"
    echo '```text'
    ( cd "$SRC" && find . -maxdepth 2 -type d \
        -not -path './.git*' -not -path './node_modules*' -not -path './.agent*' \
        | sort | head -100 )
    echo '```'
    echo ""
    echo "## Ngôn ngữ / manifest phát hiện được"
    for f in package.json composer.json requirements.txt pyproject.toml go.mod pom.xml build.gradle Gemfile Cargo.toml; do
      [ -f "$SRC/$f" ] && echo "- \`$f\`"
    done
    echo ""
    echo "## Việc cần AI Agent làm tiếp"
    echo "- [ ] Tóm tắt kiến trúc & module chính vào docs/specs/_baseline/."
    echo "- [ ] Ghi các ADR ngầm (quyết định kiến trúc đã tồn tại) vào docs/adr/."
    echo "- [ ] Xác định điểm vào cho change request đầu tiên → chạy /discovery."
  } > "$BASELINE_FILE"
  echo "📄 Đã tạo baseline: $BASELINE_FILE"
else
  echo "📄 Baseline đã tồn tại: $BASELINE_FILE (giữ nguyên)."
fi

echo "✅ Onboarding xong. Tiếp theo: chạy quy trình từ Bước 1 (/discovery) cho change request đầu tiên."
