---
description: Dựng FE đẹp/thẩm mỹ, design-to-code từ Figma (skill fe-ui-craft)
argument-hint: [figma-link | component | screen]
---

Dựng/hoàn thiện UI cho: $ARGUMENTS theo skill `.claude/skills/ui-ux-promax/SKILL.md`.

1. Nếu có Figma: dùng Figma MCP `get_design_context` / `get_variable_defs` / `get_screenshot`; map tokens; ưu tiên Code Connect.
2. Nếu không: dùng shadcn/ui MCP + Radix + Tailwind theo design system dự án (bảng màu/font trong `docs/CONSTITUTION.md`).
3. Rà **checklist thẩm mỹ**: spacing 4/8pt, typography scale, semantic colors + dark mode, trạng thái hover/focus/disabled/loading/empty/error, micro-interaction, responsive, a11y (WCAG AA).
4. Visual QA: chụp bằng Playwright MCP, đối chiếu Figma, sửa lệch.

Không hardcode màu/px rải rác. Không trộn nhiều UI lib. Không bỏ a11y.
