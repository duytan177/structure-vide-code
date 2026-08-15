---
description: Render commit title + description theo Conventional/SemVer, bám task/spec
argument-hint: [PROJECT-XXX]
---

Render commit cho thay đổi đang staged (task: $ARGUMENTS) theo skill
`.claude/skills/semantic-commit/SKILL.md`.

1. `git diff --staged --stat` → suy `<type>` + `<scope>` từ file/module thực tế.
2. Lấy Jira ID + mục tiêu + AC từ `tasks/in-progress/PROJECT-XXX.md` và `docs/specs/SPEC-XXX.md`.
3. Sinh commit đúng khuôn: `<type>(<scope>): PROJECT-XXX - <summary ≤72 ký tự, imperative>`
   + body bullet bám AC/spec + footer `Refs/Closes/BREAKING CHANGE`.
4. Đối chiếu regex hook `.githooks/commit-msg`. Cấm từ mơ hồ (stuff/things/misc/"update code").
5. Nếu không map được task/spec hoặc thiếu Jira ID → DỪNG và hỏi, không tự bịa ID.

Ánh xạ SemVer: `feat`→MINOR, `fix|perf`→PATCH, `!`/`BREAKING CHANGE`→MAJOR.
