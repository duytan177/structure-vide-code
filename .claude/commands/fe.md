---
description: Build beautiful/aesthetic FE, design-to-code from Figma (skill fe-ui-craft)
argument-hint: [figma-link | component | screen]
---

Build/finish the UI for: $ARGUMENTS following the skill `.claude/skills/ui-ux-promax/SKILL.md`.

1. If Figma is available: use Figma MCP `get_design_context` / `get_variable_defs` / `get_screenshot`; map tokens; prefer Code Connect.
2. If not: use shadcn/ui MCP + Radix + Tailwind following the project design system (color palette/font in `docs/CONSTITUTION.md`).
3. Review the **aesthetics checklist**: 4/8pt spacing, typography scale, semantic colors + dark mode, hover/focus/disabled/loading/empty/error states, micro-interactions, responsive, a11y (WCAG AA).
4. Visual QA: capture with Playwright MCP, compare against Figma, fix mismatches.

Do not hardcode scattered colors/px. Do not mix multiple UI libraries. Do not skip a11y.
