# Git Hooks (Vide-Coder)

Hooks enforce Step 8 (Self Validation) and the commit standard (rule 03) **without needing npm/husky**.

## Enable (run once per machine / worktree)

```bash
git config core.hooksPath .githooks
chmod +x .githooks/*
```

Or use the combined script: `bash .agent/scripts/setup-hooks.sh`

## Hooks
- `commit-msg` — enforce Conventional Commits + Jira ID (`feat(scope): PROJECT-123 - ...`).
- `pre-commit` — run lint/typecheck (if present) + a basic secret scan on staged files.
