# Git Hooks (Vide-Coder)

Hooks support Step 8 (Self Validation) **without needing npm/husky**.

## Enable (run once per machine / worktree)

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit
```

Or use the combined script: `bash .agent/scripts/setup-hooks.sh`

## Hooks
- `pre-commit` — run lint/typecheck (if present) + a basic secret scan on staged files.

> Commit-message convention (Conventional Commits + optional Jira ID) is **not hook-enforced** — follow
> rule 03 and the `semantic-commit` skill / `/commit` command instead.
