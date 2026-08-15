# VIDE-CODER — AI AGENT WORKFLOW BASE (Overlay)

**Vide-Coder is NOT an app.** It is a reusable **workflow base / overlay** you drop into **any repo** to force
every supported AI Agent — **Claude Code · Cursor · Antigravity** — to follow **one unified workflow**:

> `requirement → discovery → spec → design → implement → review → test → release`

Skills/plugins reuse **well-known, off-the-shelf tools** (Superpowers, Graphify, GitNexus, Context7, Semgrep…) —
the base **orchestrates**, it does **not** rebuild them. The target project's source lives in `workspace/` and is never touched.

---

## ⚡ TL;DR — start here every time

```bash
# 0) One-shot bootstrap (hooks + plugins + skills + MCP wiring)
bash .agent/scripts/init.sh

# 1) Put your MCP keys in ONE place, then sync all three agents
cp .env.example .env      # fill GITHUB_/FIGMA_/TWENTYFIRST_/POSTGRES_ keys
bash .agent/scripts/setup-mcp.sh

# 2) Bring in the project source (auto-detects stack, configures MCP/skills per repo)
bash .agent/scripts/workspace-setup.sh <repo-url> <name>     # existing/customize project
#   └─ new project instead:  mkdir -p workspace/<name>       # then init your source there

# 3) Fill the project constitution, then run the workflow
#    edit docs/CONSTITUTION.md  →  /discovery → /clarify → … → /knowledge-update

# Check the base is healthy any time:
bash .agent/scripts/self-test.sh
```

---

## 🚀 STARTING A PROJECT — step by step

Everything below runs **at the base root**. Source code always goes into `workspace/<project-name>/`.

### Mode A — NEW project (greenfield)

```bash
bash .agent/scripts/init.sh                       # bootstrap the base
cp .env.example .env && bash .agent/scripts/setup-mcp.sh   # keys + MCP
mkdir -p workspace/<name>                          # create the source here (npm init, etc.)
# Drop inputs:
#   docs/client-requirements/   ← BRD / PDF / Word / MD from the client
#   docs/basic-design/          ← .xlsx basic-design from PO/BA
# Fill docs/CONSTITUTION.md (tech stack, invariant constraints, quality thresholds)
```
→ Then run the workflow from **Step 1**: `/discovery`.

### Mode B — EXISTING / CUSTOMIZE project (brownfield)

```bash
bash .agent/scripts/init.sh
cp .env.example .env && bash .agent/scripts/setup-mcp.sh

# Clone + auto-configure (stack detection → per-repo MCP/skills; auto old-code snapshot):
bash .agent/scripts/workspace-setup.sh <repo-url> <name> [branch]
#   many at once:  cp workspace/projects.example.txt workspace/projects.txt   (edit)
#                  bash .agent/scripts/workspace-setup.sh --manifest workspace/projects.txt

# Index the legacy code into a knowledge graph (all workspace projects):
bash .agent/scripts/graphify-setup.sh

# Onboarding: generate a current-state baseline for Impact Analysis:
bash .agent/scripts/onboard-existing.sh workspace/<name>
```
→ Each change (bug/feature) enters at **Step 1** `/discovery` as a *change request* → Impact Analysis on the code graph → continue.

> 🧭 **Customize projects get a read-only OLD-code snapshot** in `reference/<name>/` (auto-created for git repos with history).
> Trace before changing: `diff -ru reference/<name>/<path> workspace/<name>/<path>`. Refresh: `reference-snapshot.sh <name> --force`.

---

## 📂 BASE STRUCTURE (an overlay — never touches the target's source)

```text
<any-repo>/
├── .claude/                      # Claude Code: commands/ + skills/ (canonical SKILL.md) + settings.json
│   └── skills/<skill>/SKILL.md   #   ★ canonical skills (mirrored to .agents/skills/ for Antigravity)
├── .cursor/                      # Cursor: rules/ + commands/ + mcp.json
├── .agent/                       # ★ WORKFLOW LAYER (core of the base)
│   ├── rules/                    #   00-ai-workflow (11 steps) — SINGLE SOURCE OF TRUTH — + code-style/git/qa
│   ├── agents/                   #   subagent personas (architect, planner, security-reviewer, e2e-runner, …)
│   ├── mcp/servers.json          #   ★ ONE MCP source of truth → setup-mcp.sh syncs all agents
│   ├── plugins/                  #   declares external plugins (Superpowers, Graphify, GitNexus, Semgrep…)
│   ├── memory/                   #   context.md + decision-log.md
│   └── scripts/                  #   init · setup-mcp · workspace-setup · graphify-* · reference-snapshot · self-test · …
├── docs/                         # ★ ENTERPRISE DOCS (templates + storage)
│   ├── CONSTITUTION.md           #   per-project immutable constraints (the /analyze gate enforces these)
│   ├── client-requirements/ basic-design/ discovery/ specs/ adr/ spec-changes/
│   └── traceability-matrix.md · DEFINITION-OF-DONE.md · AGENT-STANDARD.md
├── plans/  tasks/                # Implementation plans · Jira board (backlog/in-progress/completed)
├── workspace/                    # ★ TARGET PROJECT SOURCE lives here (fully gitignored)
│   └── <project-name>/           #   the actual code — the base does NOT track it
├── reference/                    # ★ read-only OLD-code snapshots for CUSTOMIZE projects (gitignored)
├── CLAUDE.md  AGENTS.md          # Multi-agent entry points — Claude Code, Antigravity (pointers to .agent/rules)
├── .env.example                  # single place for MCP keys (copy → .env, gitignored)
└── .githooks/  .mcp.json         # git hooks · generated MCP config (Claude)
```

---

## 🔄 THE WORKFLOW (11 steps + gates)

Single source of truth: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md). Each step maps to a slash command.

| Step | Command | Who | Output |
| :-- | :-- | :-- | :-- |
| 0. Onboarding (brownfield) | `onboard-existing.sh` | Vide-Coder | `docs/specs/_baseline/` |
| 1. Discovery | `/discovery` | Superpowers `brainstorming` | `docs/discovery/` |
| 1.5 Clarify | `/clarify` | Vide-Coder | clarifications + constitution |
| 2. Impact Analysis | `/impact` | Graphify / GitNexus | blast radius |
| 3. Architecture | `/architecture` | Vide-Coder | `docs/adr/` (ADR/RFC) |
| 4. Specification | `/spec` | Vide-Coder (+ Context7) | `docs/specs/` |
| 5. Planning | `/plan` | Superpowers `writing-plans` | `plans/` |
| 6. Task Breakdown | `/breakdown` | Vide-Coder | `tasks/backlog/` + traceability |
| **6.5 Analyze (GATE)** | `/analyze` | Vide-Coder | STOP on any 🔴 blocker |
| 7. Implementation | `/implement` | Superpowers worktree/subagent | code in `workspace/<name>/` |
| 8. Self Validation | `/validate` | Superpowers TDD | lint + typecheck + E2E |
| 9. AI Review | `/ai-review` | Superpowers + Semgrep + CodeRabbit | findings |
| 10. Human Review | — | CODEOWNERS + PR template | approval |
| 11. Knowledge Update | `/knowledge-update` | Vide-Coder | memory + graph + changelog |

Commit any time with `/commit` (Conventional Commits + SemVer). **Never skip** Discovery, Impact Analysis, or Self-Validation.

---

## 🤖 SUPPORTED AGENTS (exactly three)

| Agent | Entry point | MCP config |
| :--- | :--- | :--- |
| Claude Code | `CLAUDE.md` + `.claude/commands/` | `.mcp.json` |
| Cursor | `.cursor/rules/00-workflow.mdc` + `.cursor/commands/` | `.cursor/mcp.json` |
| Antigravity | `AGENTS.md` (agents.md standard) + `.agents/skills/` | `.agents/mcp_config.json` |

The workflow is written **once** in `.agent/rules/`; each agent reads it through its pointer. Edit the rules → all agents update.

---

## 🔌 MCP — one setup, keys in one place

- **Define servers once**: [`.agent/mcp/servers.json`](.agent/mcp/servers.json) (Playwright, GitHub, Context7, Filesystem, Postgres, Figma, shadcn/ui, Magic).
- **Keys in one file**: `.env` (template `.env.example`, gitignored — never commit real values).
- **Sync all agents**: `bash .agent/scripts/setup-mcp.sh` → writes `.mcp.json`, `.cursor/mcp.json`, `.agents/mcp_config.json`.
- Enable MCPs **per phase** to save tokens (see [`.agent/plugins/README.md`](.agent/plugins/README.md)).

## 🧰 Per-project tooling

| Task | Command |
| :-- | :-- |
| Clone + configure a repo | `workspace-setup.sh <repo-url> <name>` · `--manifest workspace/projects.txt` |
| Code graph (all projects) | `graphify-setup.sh` · `graphify-rebuild.sh` · `graphify-sync.sh` |
| Old-code snapshot (customize) | `reference-snapshot.sh <name> [ref] [--force]` |
| Enable git hooks | `setup-hooks.sh` · Verify plugins: `verify-plugins.sh` · Self-test: `self-test.sh` |

**External plugins** (install via `install-all-plugins.sh`): Graphify (`pip install graphifyy`), GitNexus (`npx gitnexus`),
Semgrep (`pip install semgrep`), Superpowers (install per agent — see [`.agent/plugins/superpowers.md`](.agent/plugins/superpowers.md)).

---

## 📚 REFERENCES

- **Workflow (SSOT)**: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md) · Code style / Architecture / Git-Jira / Testing: [`.agent/rules/`](.agent/rules/)
- **Project constitution**: [`docs/CONSTITUTION.md`](docs/CONSTITUTION.md) (the `/analyze` gate blocks on violations)
- **Definition of Done**: [`docs/DEFINITION-OF-DONE.md`](docs/DEFINITION-OF-DONE.md) · **Traceability**: [`docs/traceability-matrix.md`](docs/traceability-matrix.md)
- **Multi-agent standard**: [`docs/AGENT-STANDARD.md`](docs/AGENT-STANDARD.md) · **Plugin matrix**: [`.agent/plugins/README.md`](.agent/plugins/README.md)
- **Workspace guide**: [`workspace/README.md`](workspace/README.md) · **Old-code reference**: [`reference/README.md`](reference/README.md)
- **CI** runs Steps 8–9 on every PR (`.github/workflows/ci.yml`). Base version: [`VERSION`](VERSION) · [`CHANGELOG.md`](CHANGELOG.md).

> ⚖️ When a request conflicts with `docs/CONSTITUTION.md`: **STOP**, state the conflict, and ask for a decision (amend via ADR or change the request).
