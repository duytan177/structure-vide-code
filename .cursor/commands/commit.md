# /commit — Render commit theo Semantic + bám task/spec

Sinh commit title + description cho thay đổi đang staged theo nguồn chân lý
`.claude/skills/semantic-commit/SKILL.md`.

- Khuôn: `<type>(<scope>): PROJECT-XXX - <summary ≤72 ký tự, imperative>` + body bullet bám AC/spec.
- Nguồn nội dung (không bịa): `tasks/in-progress/PROJECT-XXX.md` → `docs/specs/SPEC-XXX.md` → `git diff --staged`.
- SemVer: `feat`→MINOR, `fix|perf`→PATCH, `!`/`BREAKING CHANGE:`→MAJOR.
- Khớp hook `.githooks/commit-msg`. Cấm từ mơ hồ (stuff/things/misc/"fix bug"/"update code").
