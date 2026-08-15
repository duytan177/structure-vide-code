---
name: git-worktree-flow
description: >
  Isolate each task with a Git Worktree + code per the spec (using Superpowers using-git-worktrees). Use WHEN
  starting implementation, or the user says "worktree", "implement", "code task", "branch".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Implementation (Step 7)

Isolate the environment so multiple agents run in parallel without overwriting each other's code. Use Superpowers `using-git-worktrees` + `subagent-driven-development`.

## Worktree commands
```bash
git worktree add -b feature/PROJECT-101-login ../worktree-PROJECT-101 main
cd ../worktree-PROJECT-101
# ... code inside workspace/<project-name>/ ...
git worktree remove ../worktree-PROJECT-101   # after the PR is merged
```

## While coding
- Read the spec first (skill `write-spec` / read-spec). Follow rule 01/02. Prefer TDD (`tdd-workflow`).
- FE: use skill `ui-ux-promax`. Attach traceability (`code-traceability`).
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`.

Command `/implement`. Next: `/validate`.
