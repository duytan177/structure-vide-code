# Git Hooks (Vide-Coder)

Hooks enforce Bước 8 (Self Validation) và chuẩn commit (rule 03) mà **không cần npm/husky**.

## Kích hoạt (chạy 1 lần cho mỗi máy / worktree)

```bash
git config core.hooksPath .githooks
chmod +x .githooks/*
```

Hoặc dùng script gộp: `bash .agent/scripts/setup-hooks.sh`

## Hooks
- `commit-msg` — ép Conventional Commits + Jira ID (`feat(scope): PROJECT-123 - ...`).
- `pre-commit` — chạy lint/typecheck (nếu có) + quét secret thô sơ trên file staged.
