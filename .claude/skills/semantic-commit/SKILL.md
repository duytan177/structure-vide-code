---
name: semantic-commit
description: >
  Render commit title + description theo Conventional Commits & Semantic Versioning, bám task/spec,
  chống lan man. Dùng KHI chuẩn bị commit/tạo PR, hoặc user nói "commit", "message", "changelog".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Semantic Commit — render commit chuẩn, bám task/spec

Sinh commit khớp hook `.githooks/commit-msg`: `<type>(<scope>): PROJECT-XXX - <summary ≤72, imperative>` + body bullet bám AC/spec.

- **SemVer**: `feat`→MINOR · `fix`/`perf`→PATCH · `!` hoặc `BREAKING CHANGE:`→MAJOR.
- **Nguồn (không bịa)**: `tasks/in-progress/PROJECT-XXX.md` → `docs/specs/SPEC-XXX.md` → `git diff --staged`. Thiếu Jira ID → DỪNG, hỏi.
- **Cấm**: "stuff/things/misc/update code/fix bug" chung chung, emoji, câu dài.

## Khuôn mẫu
```text
feat(auth): PROJECT-102 - add JWT refresh token rotation

- Add RefreshToken model + migration (SPEC-102 §3, AC-1)
- Rotate & invalidate old token on POST /auth/refresh (AC-3)

Refs: SPEC-102
Closes: PROJECT-102
```
Rule liên quan: [`03-git-jira-workflow.md`](../../../.agent/rules/03-git-jira-workflow.md). Command `/commit`.
