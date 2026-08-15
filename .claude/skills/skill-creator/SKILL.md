---
name: skill-creator
description: >
  Create/edit new skills to the Agent Skills standard (SKILL.md + frontmatter) for the Vide-Coder base. Use WHEN
  the user wants to "create a skill", "add a skill", "write a skill", "new skill", or standardize a repeated workflow.
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Skill Creator — create standards-compliant skills for any agent

Learned from anthropics `skill-creator` + agentskills.io. Write a skill once, run it on Claude/Cursor/Antigravity.

## Workflow
1. **Ask to clarify**: what problem does the skill solve? WHEN should it be used (trigger)? Input/Output? Main steps?
2. **Create folder** `.claude/skills/<name>/SKILL.md` (`name` kebab-case ≤64 chars, = folder name, no `--`).
3. **Frontmatter**:
   ```yaml
   ---
   name: <kebab-case>
   description: >
     <what it DOES> + <WHEN to use, with keywords users often type>.   # ≤1024 chars — decides auto-trigger
   license: MIT
   metadata: { author: vide-coder, version: "1.0" }
   ---
   ```
4. **Body** (<500 lines, self-contained): goal · step-by-step workflow · examples · HARD-GATE (if any) · anti-patterns. Put heavy resources in `references/` `scripts/` `assets/`.
5. **Sync**: `bash .agent/scripts/sync-skills.sh` (mirror to `.agents/skills/`).
6. **Validate**: `bash .agent/scripts/validate-skills.sh` (check frontmatter). Update `CHANGELOG.md`.

## Tips for writing a `description` that triggers well
- State clearly **when to use** + **keywords** users typically type (e.g. "commit", "review", "beautiful UI").
- Avoid vague "Helps with X". Good example: "Extract PDF text... Use when user mentions PDFs/forms".

## Anti-patterns
- Don't put detailed logic in the `description`. Don't create a skill that duplicates an existing one. Don't forget to sync + validate.
