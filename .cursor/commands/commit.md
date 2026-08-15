# /commit — Render commit following Semantic + tied to task/spec

Generate a commit title + description for the currently staged changes according to the single source of truth
`.claude/skills/semantic-commit/SKILL.md`.

- Template: `<type>(<scope>): PROJECT-XXX - <summary ≤72 chars, imperative>` + body bullets tied to AC/spec.
- Content sources (no fabrication): `tasks/in-progress/PROJECT-XXX.md` → `docs/specs/SPEC-XXX.md` → `git diff --staged`.
- SemVer: `feat`→MINOR, `fix|perf`→PATCH, `!`/`BREAKING CHANGE:`→MAJOR.
- Follow Conventional Commits (rule 03). Forbid vague words (stuff/things/misc/"fix bug"/"update code").
