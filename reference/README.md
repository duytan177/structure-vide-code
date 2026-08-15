# REFERENCE — Read-only snapshots of OLD source code (customize projects only)

> 📍 **Purpose.** For **customize / brownfield** projects, this folder keeps a **read-only snapshot of the
> original (old) source code** so the AI Agent can **trace back to the old behavior before changing anything**
> and avoid regressions. This is NOT the working copy — the live source stays in `workspace/<name>/`.

## Layout
```text
reference/
├── README.md              # this file (tracked)
├── .gitignore             # ignores all snapshots (tracked)
└── <project-name>/        # read-only snapshot of the OLD code (gitignored)
    ├── .snapshot-info.md  # source, git ref, commit hash, date
    └── ... (old source at that commit)
```

## When it is created
- **Only for customize projects** (an existing git repo with commit history).
- `workspace-setup.sh` auto-creates a snapshot right after cloning such a project.
- Greenfield (new) projects get **no** reference snapshot.

## Create / refresh manually
```bash
# Snapshot the current HEAD of workspace/<name> (customize only)
bash .agent/scripts/reference-snapshot.sh <name>

# Snapshot a specific baseline commit/tag/branch
bash .agent/scripts/reference-snapshot.sh <name> v1.2.0

# Overwrite an existing snapshot
bash .agent/scripts/reference-snapshot.sh <name> --force
```

## How the AI Agent should use it
- Before modifying `workspace/<name>/...`, read the matching file under `reference/<name>/...` to see the
  **original implementation** and preserve intended behavior / contracts.
- Diff old vs current to understand what a change actually alters:
  `diff -ru reference/<name>/path workspace/<name>/path`
- The snapshot is **read-only** (chmod a-w) — never edit it; re-run the script to refresh.
