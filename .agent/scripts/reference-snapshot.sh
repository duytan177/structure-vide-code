#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — REFERENCE SNAPSHOT (customize / brownfield projects only)
#
# Saves a READ-ONLY snapshot of the OLD source code of a workspace project into
# reference/<name>/, so the AI Agent can trace back to the original behavior
# before changing anything and avoid regressions.
#
# Usage:
#   bash .agent/scripts/reference-snapshot.sh <name> [git-ref] [--force]
#     <name>    project folder under workspace/
#     git-ref   commit/tag/branch to snapshot (default: HEAD)
#     --force   overwrite an existing snapshot
#
# Only applies to CUSTOMIZE projects (a git repo with commit history).
# Never edits the project source. Never commits anything.
# ==============================================================================
set -u

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1

info() { printf '  %s\n' "$*"; }
warn() { printf '  ⚠️ %s\n' "$*"; }

# ----- parse args -----
NAME=""; REF="HEAD"; FORCE=0
while [ "$#" -gt 0 ]; do
  case "$1" in
    --force) FORCE=1; shift ;;
    -h|--help) sed -n '2,20p' "$0"; exit 0 ;;
    *) if [ -z "$NAME" ]; then NAME="$1"; else REF="$1"; fi; shift ;;
  esac
done

[ -n "$NAME" ] || { warn "Missing <name>. Usage: reference-snapshot.sh <name> [git-ref] [--force]"; exit 1; }

SRC="$ROOT/workspace/$NAME"
DST="$ROOT/reference/$NAME"
[ -d "$SRC" ] || { warn "workspace/$NAME not found — clone it first (workspace-setup.sh)."; exit 1; }

echo "════════════════════════════════════════════════════"
echo " VIDE-CODER reference-snapshot — $NAME @ $REF"
echo "════════════════════════════════════════════════════"

# ----- guard: customize only (git repo with history) -----
if ! git -C "$SRC" rev-parse --verify "$REF" >/dev/null 2>&1; then
  warn "workspace/$NAME is not a git repo with history for ref '$REF'."
  warn "Reference snapshots are for CUSTOMIZE (existing-code) projects only. Nothing to do."
  exit 1
fi
COMMIT="$(git -C "$SRC" rev-parse "$REF" 2>/dev/null)"
COMMIT_SHORT="$(git -C "$SRC" rev-parse --short "$REF" 2>/dev/null)"

# ----- handle existing snapshot -----
if [ -e "$DST" ]; then
  if [ "$FORCE" = 1 ]; then
    chmod -R u+w "$DST" 2>/dev/null || true
    rm -rf "$DST"
    info "removed previous snapshot (--force)."
  else
    warn "reference/$NAME already exists. Re-run with --force to overwrite."
    exit 1
  fi
fi

# ----- create snapshot from the git ref (tracked files at that commit) -----
mkdir -p "$DST"
info "exporting workspace/$NAME @ $COMMIT_SHORT → reference/$NAME ..."
if ! git -C "$SRC" archive --format=tar "$REF" | tar -x -C "$DST" 2>/dev/null; then
  warn "git archive failed — falling back to a plain copy (excluding .git)."
  ( cd "$SRC" && tar --exclude='./.git' --exclude='./node_modules' -cf - . ) | tar -x -C "$DST"
fi

# ----- write snapshot metadata -----
BRANCH="$(git -C "$SRC" rev-parse --abbrev-ref HEAD 2>/dev/null || echo '?')"
ORIGIN="$(git -C "$SRC" config --get remote.origin.url 2>/dev/null || echo 'local')"
STAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ 2>/dev/null || echo 'unknown')"
{
  echo "# Reference snapshot — $NAME"
  echo ""
  echo "> Read-only snapshot of the OLD source code. Do not edit. Refresh via reference-snapshot.sh."
  echo ""
  echo "- Source:  \`workspace/$NAME\`"
  echo "- Origin:  \`$ORIGIN\`"
  echo "- Ref:     \`$REF\`  (branch at snapshot: \`$BRANCH\`)"
  echo "- Commit:  \`$COMMIT\`"
  echo "- Taken:   $STAMP"
  echo ""
  echo "## Usage"
  echo "- Before changing \`workspace/$NAME/<file>\`, read \`reference/$NAME/<file>\` for the original behavior."
  echo "- Diff:  \`diff -ru reference/$NAME/<path> workspace/$NAME/<path>\`"
} > "$DST/.snapshot-info.md"

# ----- make the snapshot read-only -----
chmod -R a-w "$DST" 2>/dev/null || true

FILES="$(find "$DST" -type f 2>/dev/null | wc -l | tr -d ' ')"
echo ""
info "snapshot ready: reference/$NAME  ($FILES files, commit $COMMIT_SHORT, read-only)"
info "trace old code: diff -ru reference/$NAME/<path> workspace/$NAME/<path>"
echo ""
echo "✅ reference-snapshot done (no commits made)."
