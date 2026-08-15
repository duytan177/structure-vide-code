#!/usr/bin/env bash
# SessionStart hook — nạp ngữ cảnh quy trình ngay từ message đầu (như superpowers).
# Stdout được Claude Code chèn làm additionalContext.
cat <<'EOF'
[VIDE-CODER] Quy trình bắt buộc (nguồn: .agent/rules/00-ai-workflow.md):
1.Discovery → 1.5.Clarify → 2.Impact → 3.Architecture → 4.Spec → 5.Plan → 6.Breakdown
→ 6.5.Analyze(GATE) → 7.Implement → 8.Validate → 9.AI-Review → 10.Human → 11.Knowledge.
- Trước MỌI task: quét skill khả dụng ở .claude/skills/ (>1% liên quan là dùng).
- Source dự án ở workspace/<ten-du-an>/ (KHÔNG code ở root). Tuân docs/CONSTITUTION.md.
- Commit qua skill semantic-commit. FE dùng skill ui-ux-promax.
EOF
