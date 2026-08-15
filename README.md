# VIDE-CODER — AI AGENT WORKFLOW BASE (Overlay)

**Vide-Coder is NOT an app.** It is a reusable **workflow base / overlay** that you drop into **any repo**
(a new project **or** an existing project under maintenance/continued development) to **force every AI Agent**
(Claude Code / Cursor / Antigravity) to work according to **one unified workflow**:

> `requirement → spec → design → implement → review → test → release`

Skills/plugins reuse **well-known, off-the-shelf tools** (Superpowers, Graphify, GitNexus, Context7…) — the base **does not rebuild them from scratch**.
Skills/plugins customized for each project → the team **adds them later**. Detailed direction: [`docs/BASE-PLAN.md`](docs/BASE-PLAN.md).

---

## 📂 BASE STRUCTURE (just an overlay — does NOT touch the target project's source)

```text
<any-repo>/                       # target project (new/existing) — their source stays untouched
├── .claude/skills/               # ★ Agent Skills standard (SKILL.md) — canonical, shared by every agent
│   └── <skill>/SKILL.md          #   (mirrored to .agents/skills/ for Antigravity via sync-skills.sh)
├── .agent/                       # ★ WORKFLOW LAYER (the core of the base)
│   ├── rules/                    # Core rules: 00-workflow (11 steps), code-style, git/jira, QA — SINGLE SOURCE OF TRUTH
│   ├── agents/                   # 🎭 Subagent personas (Architect, Planner, Security Reviewer, Build Error Resolver, E2E Runner)
│   ├── templates/                # Per-project override templates (overrides/ wins over core)
│   ├── memory/                   # Context memory & decision log (initialized empty per project)
│   ├── plugins/                  # DECLARES external plugins + installer (Superpowers, Graphify, GitNexus, Context7, Semgrep, Playwright, GitHub MCP)
│   ├── mcp/servers.json          # ★ ONE MCP source of truth → setup-mcp.sh syncs all agents
│   └── scripts/                  # init / setup-mcp / workspace-setup / graphify-* / reference-snapshot / onboard-existing / sync-skills / setup-hooks / verify
├── docs/                         # ★ ENTERPRISE DOCUMENTATION LAYER (templates + storage)
│   ├── client-requirements/      # 📂 Original requirements from the client (BRD, PDF, Word, MD)
│   ├── basic-design/             # 📂 Excel (.xlsx) basic-design files from PO/BA
│   ├── specs/                    # Per-screen specifications (+ specs/_baseline/ for existing projects)
│   ├── adr/                      # Architecture Decision Records + RFC
│   └── spec-changes/             # Spec change trail (Jira Q&A, sync meetings)
├── plans/                        # Implementation Plans
├── tasks/                        # Jira board (backlog / in-progress / completed)
├── workspace/                    # ★ WHERE THE TARGET PROJECT SOURCE LIVES (clone it here) — entire content gitignored
│   └── <project-name>/           # the actual source (new/existing) — the base does NOT track it
├── reference/                    # ★ Read-only OLD-code snapshots for CUSTOMIZE projects (gitignored) — trace before changing
├── CLAUDE.md  AGENTS.md          # ★ Multi-agent entry points — Claude Code, Antigravity (pointers to .agent/rules)
├── .cursor/                      # Cursor rules + commands (+ .cursor/mcp.json)
├── .github/                      # CI + PR template + CODEOWNERS
├── .env.example                  # Single place for MCP keys (copy → .env, gitignored)
└── .githooks/  .mcp.json         # Git hooks + generated MCP config (Claude)
```

> ⚠️ The base **has no `src/` at the root**. The project's source lives in **`workspace/<project-name>/`** and is **fully gitignored** — the base only overlays the workflow + documentation layer on top (see [`workspace/README.md`](workspace/README.md)).

---

## 🚀 HOW TO APPLY THE BASE TO A PROJECT — 2 MODES

### Mode A — NEW project (greenfield)
1. Create the source in `workspace/<project-name>/` (the base overlay is already in place at the root).
2. `bash .agent/scripts/install-all-plugins.sh` (auto-detects the mode) + `bash .agent/scripts/setup-hooks.sh`.
3. Drop requirements into `docs/client-requirements/` (and Excel into `docs/basic-design/`) → run the workflow from **Step 1**.

### Mode B — EXISTING project (brownfield / maintenance / continued development)
1. Clone the source into the workspace: `git clone <repo-url> workspace/<project-name>` — **do not touch their source**.
2. `bash .agent/scripts/install-all-plugins.sh` + `bash .agent/scripts/setup-hooks.sh`.
3. **Step 0 Onboarding**: `bash .agent/scripts/onboard-existing.sh workspace/<project-name>` → index the legacy code (Graphify/GitNexus) and generate a baseline into `docs/specs/_baseline/`.
4. Each change (bug/feature) = an entry point into **Step 1** as a *change request* → Impact Analysis on the legacy code graph → continue the workflow.

---

## 🤖 ENABLING MULTIPLE AI AGENTS

The workflow is written **once** in `.agent/`; each tool reads it through its own entry point (all of them *pointers* to `.agent/rules/00-ai-workflow.md`):

| Tool | Entry point | MCP config |
| :--- | :--- | :--- |
| Claude Code | `CLAUDE.md` + `.claude/commands/` | `.mcp.json` |
| Cursor | `.cursor/rules/00-workflow.mdc` + `.cursor/commands/` | `.cursor/mcp.json` |
| Antigravity | `AGENTS.md` (agents.md standard) + `.agents/skills/` | `.agents/mcp_config.json` |

→ To change the workflow, just edit `.agent/rules/`, and every tool updates accordingly.
→ MCP is configured in **one place** — edit `.agent/mcp/servers.json` + `.env`, then run `bash .agent/scripts/setup-mcp.sh`.

## ⚙️ FIRST-TIME SETUP

```bash
bash .agent/scripts/init.sh                            # ONE-SHOT BOOTSTRAP: hooks + plugins + detect mode
cp .env.example .env                                   # then fill in your MCP keys (single place, gitignored)
bash .agent/scripts/setup-mcp.sh                       # sync MCP to Claude + Cursor + Antigravity
# Clone & auto-configure related projects into workspace/ (MCP/skills per repo; old-code snapshot for customize):
# bash .agent/scripts/workspace-setup.sh <repo-url> [name] [branch]
# bash .agent/scripts/workspace-setup.sh --manifest workspace/projects.txt
# Code graph for all workspace projects:
# bash .agent/scripts/graphify-setup.sh                # index all · graphify-rebuild.sh · graphify-sync.sh
# (or run base steps manually:)
# bash .agent/scripts/setup-hooks.sh
# bash .agent/scripts/install-all-plugins.sh
# bash .agent/scripts/onboard-existing.sh workspace/<project-name>   # EXISTING projects ONLY
# bash .agent/scripts/verify-plugins.sh
```

- **11 steps & Superpowers role assignment**: [`.agent/rules/00-ai-workflow.md`](.agent/rules/00-ai-workflow.md).
- **Slash commands**: `/discovery` → `/clarify` → `/impact` → `/architecture` → `/spec` → `/plan` → `/breakdown` → `/analyze` (gate) → `/implement` → `/validate` → `/ai-review` → (Human Review) → `/knowledge-update`. Commit: `/commit`.
- **Project constitution**: [`docs/CONSTITUTION.md`](docs/CONSTITUTION.md) (per-project immutable constraints; `/analyze` blocks on violations).
- **Definition of Done**: [`docs/DEFINITION-OF-DONE.md`](docs/DEFINITION-OF-DONE.md).
- **Traceability**: [`docs/traceability-matrix.md`](docs/traceability-matrix.md) (REQ→SPEC→PLAN→TASK→PR).
- **Per-project override templates**: [`.agent/templates/`](.agent/templates/README.md).
- **CI**: `.github/workflows/ci.yml` automatically runs Steps 8-9 on every PR. Base version: [`VERSION`](VERSION) · [`CHANGELOG.md`](CHANGELOG.md).
