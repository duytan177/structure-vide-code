# WORKSPACE — Where the TARGET project SOURCE lives

> 📍 **The AI Agent reads source code HERE.** All project code (new or existing) lives under `workspace/`.
> Everything inside is **fully gitignored** (see `workspace/.gitignore`) — the Vide-Coder base does NOT track project source.

## Usage

### Option A — Auto-setup (recommended)
Clone one or many related projects and auto-configure MCP/skills per repo:
```bash
# Single repo
bash .agent/scripts/workspace-setup.sh <repo-url> [name] [branch]

# Many repos from a manifest (see workspace/projects.example.txt)
cp workspace/projects.example.txt workspace/projects.txt   # edit it
bash .agent/scripts/workspace-setup.sh --manifest workspace/projects.txt
```
The script clones into `workspace/<name>/`, detects the stack, and writes a per-project
setup report to `docs/specs/<name>/SETUP.md` plus a tailored `workspace/<name>/.mcp.suggested.json`.

### Option B — Manual
**Existing project (clone):**
```bash
git clone <repo-url> workspace/<project-name>
```
**New project (create):**
```bash
mkdir -p workspace/<project-name>
# initialize the source there (npm init, etc.)
```

## Conventions for the AI Agent
- **Source code** → `workspace/<project-name>/` (NOT at the base root).
- **Docs / workflow** → `docs/`, `.agent/`, `plans/`, `tasks/` at the base root (tracked).
- During Impact Analysis / Implementation / Testing: operate inside `workspace/<project-name>/`.
- The brownfield baseline is generated into `docs/specs/_baseline/` (tracked), not inside the workspace.

## Multiple projects
Can hold several projects side by side: `workspace/project-a/`, `workspace/project-b/`. Each is an
independent (nested) git repo; the base only acts as a workflow overlay on top.
