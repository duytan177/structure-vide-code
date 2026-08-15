---
description: Step 2 — Impact Analysis (blast radius, dependency graph)
argument-hint: [affected module/feature]
---

Perform **Step 2 — IMPACT ANALYSIS** for: $ARGUMENTS

1. Apply the skill `.claude/skills/impact-analysis/SKILL.md`.
2. Use Graphify / GitNexus / Superpower to determine the blast radius and dependent modules.
3. List the affected files/modules, breaking-change risks, and what needs to be re-tested.

Wrap-up: if there is a major architecture change → `/architecture`, otherwise → `/spec`.
