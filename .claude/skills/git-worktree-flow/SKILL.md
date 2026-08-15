---
name: git-worktree-flow
description: >
  Cô lập mỗi task bằng Git Worktree + coding theo spec (dùng Superpowers using-git-worktrees). Dùng KHI
  bắt đầu implement, hoặc user nói "worktree", "implement", "code task", "branch".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Implementation (Bước 7)

Cô lập môi trường để nhiều agent chạy song song không đè code nhau. Dùng Superpowers `using-git-worktrees` + `subagent-driven-development`.

## Lệnh worktree
```bash
git worktree add -b feature/PROJECT-101-login ../worktree-PROJECT-101 main
cd ../worktree-PROJECT-101
# ... code trong workspace/<ten-du-an>/ ...
git worktree remove ../worktree-PROJECT-101   # sau khi PR merge
```

## Trong khi code
- Đọc spec trước (skill `write-spec` / read-spec). Tuân rule 01/02. Ưu tiên TDD (`tdd-workflow`).
- FE: dùng skill `ui-ux-promax`. Gắn traceability (`code-traceability`).
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`.

Command `/implement`. Next: `/validate`.
