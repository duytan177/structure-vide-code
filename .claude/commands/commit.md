---
description: Render commit title + description per Conventional/SemVer, tied to task/spec
argument-hint: [PROJECT-XXX]
---

Render a commit for the currently staged changes (task: $ARGUMENTS) following the skill
`.claude/skills/semantic-commit/SKILL.md`.

1. `git diff --staged --stat` → infer `<type>` + `<scope>` from the actual files/modules.
2. Get the Jira ID + goal + AC from `tasks/in-progress/PROJECT-XXX.md` and `docs/specs/SPEC-XXX.md`.
3. Generate the commit in the exact format: `<type>(<scope>): PROJECT-XXX - <summary ≤72 chars, imperative>`
   + a body with bullets tied to AC/spec + a footer `Refs/Closes/BREAKING CHANGE`.
4. Cross-check against the Conventional Commits format (rule 03). Forbid vague words (stuff/things/misc/"update code").
5. If you cannot map to a task/spec or the Jira ID is missing → STOP and ask, do not invent an ID.

SemVer mapping: `feat`→MINOR, `fix|perf`→PATCH, `!`/`BREAKING CHANGE`→MAJOR.
