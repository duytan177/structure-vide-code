---
name: semantic-commit
description: >
  Render commit title + description per Conventional Commits & Semantic Versioning, tied to task/spec,
  preventing rambling. Use WHEN preparing a commit/creating a PR, or the user says "commit", "message", "changelog".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Semantic Commit — render standards-compliant commits, tied to task/spec

Generate commits per Conventional Commits (rule 03; Jira ID optional): `<type>(<scope>): <summary ≤72, imperative>` + body bullets tied to AC/spec.

- **SemVer**: `feat`→MINOR · `fix`/`perf`→PATCH · `!` or `BREAKING CHANGE:`→MAJOR.
- **Sources (do not fabricate)**: `tasks/in-progress/PROJECT-XXX.md` → `docs/specs/SPEC-XXX.md` → `git diff --staged`. Missing Jira ID → STOP, ask.
- **Forbidden**: generic "stuff/things/misc/update code/fix bug", emoji, long sentences.

## Template
```text
feat(auth): PROJECT-102 - add JWT refresh token rotation

- Add RefreshToken model + migration (SPEC-102 §3, AC-1)
- Rotate & invalidate old token on POST /auth/refresh (AC-3)

Refs: SPEC-102
Closes: PROJECT-102
```
Related rule: [`03-git-jira-workflow.md`](../../../.agent/rules/03-git-jira-workflow.md). Command `/commit`.
