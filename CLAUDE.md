# CLAUDE.md — Entry point for Claude Code

> This is a **pointer** file. The single source of truth for the workflow is
> [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md). Do not copy the workflow content here — just point to it.

## MUST READ BEFORE DOING ANYTHING

1. The 11-step workflow: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md)
2. Code style: [`.agent/rules/01-code-style.md`](.agent/rules/01-code-style.md)
3. Architecture principles: [`.agent/rules/02-architecture-principles.md`](.agent/rules/02-architecture-principles.md)
4. Git/Jira workflow: [`.agent/rules/03-git-jira-workflow.md`](.agent/rules/03-git-jira-workflow.md)
5. Testing/QA: [`.agent/rules/04-testing-qa.md`](.agent/rules/04-testing-qa.md)

## THE 11-STEP WORKFLOW (summary — see the source file for details)

`REQUIREMENT → 1.Discovery → 2.Impact Analysis → 3.Architecture → 4.Specification → 5.Planning → 6.Task Breakdown → 7.Implementation → 8.Self Validation → 9.AI Review → 10.Human Review → 11.Knowledge Update → MERGE/RELEASE`

- **Never skip** Discovery, Impact Analysis, or Self-Validation.
- Isolate each task with a **Git Worktree** (see [`.claude/skills/git-worktree-flow/SKILL.md`](.claude/skills/git-worktree-flow/SKILL.md)).
- Always update knowledge at the end: [`.agent/memory/decision-log.md`](.agent/memory/decision-log.md).

## SLASH COMMANDS

Each step has a corresponding command in [`.claude/commands/`](.claude/commands/): `/discovery`, `/impact`, `/architecture`, `/spec`, `/plan`, `/breakdown`, `/implement`, `/validate`, `/ai-review`, `/knowledge-update`.

## SUBAGENTS & SKILLS

- Personas: [`.agent/agents/`](.agent/agents/) (architect, planner, security-reviewer, e2e-runner, build-error-resolver).
- Core skills (SKILL.md standard): [`.claude/skills/`](.claude/skills/) (mirrored to `.agents/skills/` for Antigravity).
- Plugin / MCP matrix + token budgeting: [`.agent/plugins/README.md`](.agent/plugins/README.md).

## SOURCE LOCATION

The target project's source lives in **`workspace/<project-name>/`** (fully gitignored — see [`workspace/README.md`](workspace/README.md)). Read/edit/test code HERE, not in the base root.

## MCP

The MCP config for Claude Code is in [`.mcp.json`](.mcp.json) (the filesystem server points to `./workspace`). Only enable MCP per phase (see token budgeting in plugins/README.md).
