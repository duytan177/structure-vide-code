#!/usr/bin/env bash
# SessionStart hook — load the workflow context from the very first message (like superpowers).
# Stdout is injected by Claude Code as additionalContext.
cat <<'EOF'
[VIDE-CODER] Mandatory workflow (source: .agent/rules/00-ai-workflow.md):
1.Discovery → 1.5.Clarify → 2.Impact → 3.Architecture → 4.Spec → 5.Plan → 6.Breakdown
→ 6.5.Analyze(GATE) → 7.Implement → 8.Validate → 9.AI-Review → 10.Human → 11.Knowledge.
- Before EVERY task: scan the available skills in .claude/skills/ (>1% relevance means use it).
- Project source lives in workspace/<project-name>/ (do NOT code at the root). Follow docs/CONSTITUTION.md.
- Commit via the semantic-commit skill. FE uses the ui-ux-promax skill.
EOF
