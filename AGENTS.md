# AGENTS.md — Standard entry point for AI Agents (Antigravity + agents.md-compatible tools)

> This file follows the [agents.md](https://agents.md) standard. It is a **pointer** — the single source of truth
> for the workflow is [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md).
> (Claude Code reads `CLAUDE.md`; Cursor reads `.cursor/rules/`; Antigravity reads this file. They all point back here.)

## MUST READ BEFORE CODING

1. The 11-step workflow — **single source of truth**: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md)
2. Code style: [`.agent/rules/01-code-style.md`](.agent/rules/01-code-style.md)
3. Architecture principles: [`.agent/rules/02-architecture-principles.md`](.agent/rules/02-architecture-principles.md)
4. Git/Jira workflow: [`.agent/rules/03-git-jira-workflow.md`](.agent/rules/03-git-jira-workflow.md)
5. Testing/QA: [`.agent/rules/04-testing-qa.md`](.agent/rules/04-testing-qa.md)

## THE 11-STEP WORKFLOW (summary)

```
REQUIREMENT
  → 1. DISCOVERY        (docs/discovery/)
  → 2. IMPACT ANALYSIS  (Graphify / GitNexus)
  → 3. ARCHITECTURE     (docs/adr/ — ADR/RFC)
  → 4. SPECIFICATION    (docs/specs/)
  → 5. PLANNING         (plans/)
  → 6. TASK BREAKDOWN   (tasks/backlog/)
  → 7. IMPLEMENTATION   (Git Worktree + workspace/<project-name>/)
  → 8. SELF VALIDATION  (Lint + Typecheck + Unit + E2E)
  → 9. AI REVIEW        (Semgrep + CodeRabbit)
  → 10. HUMAN REVIEW    (PR Approval)
  → 11. KNOWLEDGE UPDATE(ADR + Memory + Graph + Changelog)
  → MERGE / RELEASE
```

## GOLDEN RULES

- **Do not skip** Discovery, Impact Analysis, or Self-Validation.
- Each task runs in its own **Git Worktree**.
- Branch: `feature|fix|refactor|hotfix/PROJECT-XXX-desc`. Commit: Conventional Commits + Jira ID (see rule 03).
- Definition of Done: [`docs/DEFINITION-OF-DONE.md`](docs/DEFINITION-OF-DONE.md).
- Always update [`.agent/memory/decision-log.md`](.agent/memory/decision-log.md) + [`docs/traceability-matrix.md`](docs/traceability-matrix.md) at the end.

## SOURCE LOCATION

The target project's source lives in **`workspace/<project-name>/`** (fully gitignored — see `workspace/README.md`).
Read/edit/test code HERE, NOT in the base root.

## BUILD / TEST COMMANDS

> Run inside `workspace/<project-name>/` according to the project's stack.

```bash
# Example (Node/TS) — cd into the project in the workspace first:
# (cd workspace/<project-name> && npm run lint && npm run typecheck && npm test)
bash .agent/scripts/verify-plugins.sh    # check the plugin toolchain (run at the base root)
```

## SKILLS (Agent Skills open standard — shared by every agent)

Skills are written **once** following the `SKILL.md` standard (folder + frontmatter), shared across Claude Code, Cursor, and Antigravity.
Standardization details: [`docs/AGENT-STANDARD.md`](docs/AGENT-STANDARD.md).

- **Antigravity** scans skills at **`.agents/skills/<name>/SKILL.md`**.
- **Claude Code** reads **`.claude/skills/<name>/SKILL.md`** (canonical).
- After adding/editing a canonical skill → run `bash .agent/scripts/sync-skills.sh` to sync.
- Example available: `ui-ux-promax` (beautiful FE, anti-AI-slop, design-to-code).

## MCP / PLUGINS

- Plugin matrix + token budgeting: [`.agent/plugins/README.md`](.agent/plugins/README.md).
- **One MCP setup**: edit servers in [`.agent/mcp/servers.json`](.agent/mcp/servers.json), keys in `.env`, then run
  `bash .agent/scripts/setup-mcp.sh` to sync all agents.
- Generated per-agent configs: `.mcp.json` (Claude Code) · `.cursor/mcp.json` (Cursor) · `.agents/mcp_config.json` (Antigravity).
