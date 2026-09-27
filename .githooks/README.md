# Git Hooks (Vide-Coder)

Hooks support Step 8 (Self Validation) **without needing npm/husky**.

## Enable (run once per machine / worktree)

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit .githooks/commit-msg
```

Or use the combined script: `bash .agent/scripts/setup-hooks.sh`

## Hooks
- `pre-commit` — run lint/typecheck (if present) + a basic secret scan on staged files.
- `commit-msg` — enforces the Conventional-Commit shape from rule 03 (`<type>(<scope>): [PROJECT-XXX - ]<summary>`). The Jira ticket token is required for target-project work but optional for commits made in this base repo itself (base maintenance has no ticket).

> This governs the BASE repo's own commits only. A target project cloned into `workspace/<name>/` is typically its own separate git repository — copy `.githooks/` into it too (and run `git -C workspace/<name> config core.hooksPath .githooks`) if you want the same enforcement on its commits.
