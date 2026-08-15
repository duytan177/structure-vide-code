---
description: Step 11 — Knowledge Update (ADR + Memory + Graph + Changelog)
argument-hint: [PROJECT-XXX]
---

Perform **Step 11 — KNOWLEDGE UPDATE** for: $ARGUMENTS

1. Apply the skill `.claude/skills/knowledge-update/SKILL.md`.
2. Re-index Graphify / GitNexus / Superpower Knowledge Graph.
3. Update `.agent/memory/decision-log.md` and `.agent/memory/context.md`.
4. Update `docs/traceability-matrix.md` (TASK → PR, status ✅).
5. Write a changelog to `docs/spec-changes/` if the spec changed.
6. Move the task `tasks/in-progress/PROJECT-XXX.md` → `tasks/completed/`.
7. Clean up the used Git Worktree.

Wrap-up: ready to MERGE / RELEASE.
