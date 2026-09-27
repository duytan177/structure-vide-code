# VIDE-CODER — WORKFLOW BASE BUILD PLAN (Overlay, applies to any project)

> **Vide-Coder is NOT an app.** It is a reusable **workflow BASE / overlay** you drop into any repo
> (a new project OR an existing project under maintenance/continued development) to **force AI Agents to work to one unified workflow**:
> `requirement → spec → design → implement → review → test → release`.
>
> **Principles:**
> 1. Build only the **WORKFLOW** (mandatory). For skills/plugins use **well-known off-the-shelf** tools (Superpowers, Graphify, GitNexus, Context7…) — **do NOT rebuild them**.
> 2. The base is a **pure overlay** — **no `src/`**, does not touch the target project's source.
> 3. Custom skills/plugins for each project → the team adds them later.
>
> Status: 🟢 Implemented — the checklist in §6 reflects the repo state as of 2026-09-27 (item 7 is still optional/open). Originally drafted 2026-07-23. (Replaces the deleted MIGRATION-PLAN.md.)

---

## 1. REPOSITIONING

| | Before (misunderstood) | After (correct) |
|---|---|---|
| Nature | An app with FE/BE | **Workflow overlay base** |
| `src/` | Present, forced structure | **Removed** — the target project has its own source |
| Skills | Self-written/rebuilt in the superpowers style | **Install Superpowers** as the engine, no rebuild |
| Vide-Coder's role | Do everything | Only the **enterprise layer** + **enforce the workflow** |

## 2. BASE ARCHITECTURE AFTER ADJUSTMENT (overlay)

```text
<any-repo>/                          # target project (new or old) — DON'T touch their source
├── .agent/                         # ★ WORKFLOW LAYER (core of the base)
│   ├── rules/                      # 11 mandatory steps — SINGLE SOURCE OF TRUTH
│   ├── plugins/                    # DECLARE external plugins + installer (Superpowers, Graphify, GitNexus, Context7, Semgrep, Playwright, GitHub MCP)
│   ├── agents/                     # personas · standard skills in .claude/skills/
│   ├── memory/                     # per-project memory (initialized empty)
│   └── scripts/                    # install / verify / setup-hooks / onboard
├── docs/                           # ★ ENTERPRISE DOCUMENTATION LAYER (templates + storage)
│   ├── client-requirements/ basic-design/ specs/ adr/ discovery/ spec-changes/
│   ├── DEFINITION-OF-DONE.md  traceability-matrix.md
├── plans/  tasks/                  # plans + Jira board
├── workspace/                      # ★ WHERE THE PROJECT SOURCE LIVES (cloned in) — entire contents gitignored
│   └── <project-name>/             # the actual source (new/old) — the base does NOT track it
├── CLAUDE.md AGENTS.md             # ★ multi-agent entry-points (pointers)
├── .cursor/ .github/               # per-tool rules + CI + PR template + CODEOWNERS
└── .githooks/  .mcp.json           # git hooks + MCP config
```

**Done**: `src/` was removed from the base; the README states clearly "the base is an overlay, the target project's source is untouched".

## 3. ROLE SPLIT: SUPERPOWERS (engine) vs VIDE-CODER (enterprise)

Install Superpowers as the engine → it handles the "be a great dev" part. Vide-Coder wraps the enterprise part on top.

| Vide-Coder step | Who handles it | Mechanism |
|---|---|---|
| 1. Discovery | **Superpowers** `brainstorming` | + trace to `docs/discovery/` (Vide-Coder) |
| 2. Impact Analysis | **Vide-Coder** | calls **Graphify/GitNexus** (external plugins) |
| 3. Architecture (ADR/RFC) | **Vide-Coder** | template `docs/adr/` |
| 4. Specification | **Vide-Coder** | template `docs/specs/` (+ Context7 for docs lookup) |
| 5. Planning | **Superpowers** `writing-plans` | + milestone/sprint |
| 6. Task Breakdown (Jira) | **Vide-Coder** | `tasks/` + traceability |
| 7. Implementation | **Superpowers** `using-git-worktrees` + `subagent-driven-development` | |
| 8. Self Validation | **Superpowers** `test-driven-development` + `verification-before-completion` | + typecheck/E2E |
| 9. AI Review | **Superpowers** `requesting/receiving-code-review` | + **Semgrep** + CodeRabbit (Vide-Coder security gate) |
| 10. Human Review | **Vide-Coder** | CODEOWNERS + PR template |
| 11. Knowledge Update | **Vide-Coder** | ADR + memory + re-index graph + changelog |

→ Vide-Coder does **not rewrite** steps 1, 5, 7, 8, 9. It only **orchestrates** and **adds** steps 2, 3, 4, 6, 10, 11.

## 4. "APPLY TO A PROJECT" MECHANISM — 2 MODES

The base must work for both new and old projects → it needs **one install command + mode detection**.

**Mode A — NEW project (greenfield):**
1. Copy the overlay into an empty repo.
2. Run `install` → install plugins (Superpowers/Graphify/…) + enable git hooks.
3. Put requirements into `docs/client-requirements/` → run the workflow from Step 1.

**Mode B — OLD project (brownfield / maintain):**
1. Copy the overlay into an existing repo (**don't touch the source**).
2. Run `install` + **Step 0 Onboarding**: index the old code with **Graphify/GitNexus**, generate a **baseline** (spec/ADR summarizing the current state into `docs/specs/_baseline/`).
3. Each change (bug/feature) = an entry point at Step 1 as a *change request* → Impact Analysis on the old code graph → continue the workflow.

**Done:**
- ✅ `.agent/scripts/onboard-existing.sh` exists (index + generate baseline).
- ✅ Step 1 in `00-ai-workflow.md` has the flexible entry point (new BRD **or** change request).
- ✅ `install-all-plugins.sh` detects new/old repos.

## 5. EXTERNAL PLUGIN CATALOG (declare dependencies, install per-agent)

| Plugin | Role in the workflow | How to install |
|---|---|---|
| **Superpowers** | Skill engine (brainstorm→plan→impl→test→review) | plugin marketplace / repo, install **per agent** |
| **Graphify** | Step 2 impact + Step 11 re-index | CLI/MCP |
| **GitNexus** | Step 2 blast radius / execution flow | CLI/MCP |
| **Context7** | Step 4 version-correct framework docs lookup | MCP |
| **Semgrep** | Step 9 security gate (OWASP) | CLI + CI |
| **Playwright MCP** | Step 8 E2E | MCP |
| **GitHub MCP** | Step 7/10 PR/branch | MCP |

**Done:**
- ✅ `.agent/plugins/` moved from "descriptions" → clear dependency declarations (name, per-agent install, MCP config) — see the per-plugin `.md` files + `.agent/plugins/installer/`.
- ✅ `superpowers.md` added, clearly separated from the unrelated "Superpower (code-graph)" entry.
- Token budgeting already exists — keep it.

## 6. CONCRETE EDIT CHECKLIST (vs. current state)

- [x] **Delete `src/`** + fix the README (overlay, doesn't touch the target project's source).
- [x] Amend `00-ai-workflow.md`: flexible Step 1 entry point (new/old); state clearly which steps Superpowers handles.
- [x] Add `.agent/scripts/onboard-existing.sh` (Mode B).
- [x] Upgrade `install-all-plugins.sh`: install **Superpowers per-agent** + detect mode; `verify-plugins.sh` checks plugins actually exist.
- [x] Clarify the plugin catalog: separate/identify **Superpowers** (methodology) vs "superpower code-graph".
- [x] `docs/specs/_baseline/` for brownfield (destination scaffolded; `onboard-existing.sh` populates it per-project on demand).
- [ ] (Optional) one concise command `vide-coder apply` wrapping the whole install.

## 7. DO NOT DO (to avoid drifting off course again)
- ❌ Don't rebuild skills in the superpowers format (use Superpowers directly).
- ❌ Don't create custom skills/plugins for a specific project (the team adds them later).
- ❌ Don't force a `src/` structure.

## 8. RISKS / OPEN ITEMS
- Confirm **how to install Superpowers** for each agent (marketplace vs repo) — differs per agent.
- Verify the `graphify`/`gitnexus` CLIs (+ actual package names) before Step 2 depends on them.
- Brownfield: generating baseline specs can be token-heavy on large repos → the index scope needs limiting.
