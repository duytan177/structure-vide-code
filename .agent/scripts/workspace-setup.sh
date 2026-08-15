#!/usr/bin/env bash
# ==============================================================================
# VIDE-CODER — WORKSPACE AUTO-SETUP
# Clone related project(s) into workspace/ and auto-configure MCP + skills per repo.
#
# Usage:
#   bash .agent/scripts/workspace-setup.sh <repo-url|local-path> [name] [branch]
#   bash .agent/scripts/workspace-setup.sh --manifest workspace/projects.txt
#   bash .agent/scripts/workspace-setup.sh --detect-only          # only re-scan existing workspace projects
#
# For each project it:
#   1) Clones (or copies) the source into workspace/<name>/  (skips if it already exists)
#   2) Detects the stack (languages, frontend, database, web/e2e)
#   3) Recommends the relevant MCP servers + skills for that repo
#   4) Writes docs/specs/<name>/SETUP.md (tracked) + workspace/<name>/.mcp.suggested.json
#   5) Runs brownfield onboarding (index + baseline) when a manifest is detected
#
# It NEVER edits the target project's source. It NEVER commits anything.
# ==============================================================================
set -u

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT" || exit 1
WS="$ROOT/workspace"
mkdir -p "$WS"

# ------------------------------------------------------------------ helpers ---
info()  { printf '  %s\n' "$*"; }
step()  { printf '\n▶ %s\n' "$*"; }
warn()  { printf '  ⚠️ %s\n' "$*"; }

has() { command -v "$1" >/dev/null 2>&1; }

# derive a folder name from a git URL or path
derive_name() {
  local src="$1" n
  n="$(basename "$src")"
  n="${n%.git}"
  printf '%s' "$n"
}

# clone (git url) or copy (local path) SRC into workspace/NAME on BRANCH
fetch_project() {
  local src="$1" name="$2" branch="${3:-}"
  local dst="$WS/$name"
  if [ -e "$dst" ]; then
    info "exists → workspace/$name (skip fetch)"
    return 0
  fi
  if [ -d "$src" ]; then
    info "copy local  $src → workspace/$name"
    cp -r "$src" "$dst" || { warn "copy failed"; return 1; }
  else
    if ! has git; then warn "git not found — cannot clone $src"; return 1; fi
    info "git clone   $src → workspace/$name${branch:+ (branch $branch)}"
    if [ -n "$branch" ]; then
      git clone --branch "$branch" "$src" "$dst" 2>&1 | sed 's/^/    /' || { warn "clone failed"; return 1; }
    else
      git clone "$src" "$dst" 2>&1 | sed 's/^/    /' || { warn "clone failed"; return 1; }
    fi
  fi
}

# append a language to LANGS if not already present
add() { case " $LANGS " in *" $1 "*) ;; *) LANGS="$LANGS $1";; esac; }

# ---- stack detection: sets LANGS FE DB WEB MOBILE for a given project dir ----
detect_stack() {
  local d="$1"
  LANGS=""; FE=0; DB=0; WEB=0; MOBILE=0

  # manifests → languages
  [ -f "$d/package.json" ]      && add node
  { [ -f "$d/pyproject.toml" ] || [ -f "$d/requirements.txt" ] || [ -f "$d/setup.py" ]; } && add python
  [ -f "$d/go.mod" ]            && add go
  { [ -f "$d/pom.xml" ] || [ -f "$d/build.gradle" ] || [ -f "$d/build.gradle.kts" ]; }    && add java
  [ -f "$d/composer.json" ]     && add php
  [ -f "$d/Cargo.toml" ]        && add rust
  [ -f "$d/Gemfile" ]           && add ruby
  { ls "$d"/*.csproj "$d"/*.sln >/dev/null 2>&1; } && add dotnet

  # frontend / web frameworks (scan package.json deps if present)
  if [ -f "$d/package.json" ]; then
    if grep -qiE '"(react|next|vue|nuxt|svelte|@angular/core|solid-js|astro|remix)"' "$d/package.json"; then
      FE=1; WEB=1
    fi
    grep -qiE '"(react-native|expo)"' "$d/package.json" && MOBILE=1
    grep -qiE '"(express|koa|fastify|@nestjs/core|next)"' "$d/package.json" && WEB=1
  fi
  # tailwind / shadcn hints
  { [ -f "$d/tailwind.config.js" ] || [ -f "$d/tailwind.config.ts" ] || [ -d "$d/components/ui" ]; } && FE=1

  # database hints
  if grep -rqiE 'postgres|postgresql|mysql|mariadb|mongodb|prisma|typeorm|sequelize|knex|"pg"|mysql2|mongoose|sqlalchemy|psycopg|jpa|hibernate|gorm' \
       "$d/package.json" "$d/pyproject.toml" "$d/requirements.txt" "$d/go.mod" "$d/pom.xml" 2>/dev/null; then
    DB=1
  fi
  { ls "$d"/*.sql >/dev/null 2>&1 || [ -d "$d/migrations" ] || [ -d "$d/prisma" ]; } && DB=1
  { [ -f "$d/docker-compose.yml" ] && grep -qiE 'postgres|mysql|mariadb' "$d/docker-compose.yml"; } && DB=1

  # server / web app → e2e relevant
  { [ -f "$d/Dockerfile" ] || [ -f "$d/docker-compose.yml" ]; } && WEB=1

  LANGS="${LANGS# }"
}

# ---- pick MCP servers relevant to the detected stack -------------------------
# Always: filesystem, github, context7. Conditional: postgres/figma/shadcn/magic/playwright
recommend_mcp() {
  MCP_KEYS="filesystem github context7"
  [ "$DB" = 1 ]  && MCP_KEYS="$MCP_KEYS postgres"
  [ "$FE" = 1 ]  && MCP_KEYS="$MCP_KEYS figma shadcn magic"
  { [ "$WEB" = 1 ] || [ "$FE" = 1 ] || [ "$MOBILE" = 1 ]; } && MCP_KEYS="$MCP_KEYS playwright"
}

# ---- pick skills relevant to the detected stack ------------------------------
recommend_skills() {
  # Core skills always apply (the 11-step workflow)
  SKILLS="discovery-brainstorm clarify-requirements impact-analysis architecture-decision write-spec plan-implementation task-breakdown analyze-consistency git-worktree-flow tdd-workflow code-review semantic-commit code-traceability knowledge-update"
  [ "$FE" = 1 ] && SKILLS="$SKILLS ui-ux-promax"
}

# ---- write the tailored MCP suggestion (filtered from root .mcp.json) --------
write_mcp_suggestion() {
  local name="$1"; local out="$WS/$name/.mcp.suggested.json"
  if has node && [ -f "$ROOT/.mcp.json" ]; then
    node -e '
      const fs=require("fs");
      const all=JSON.parse(fs.readFileSync(process.argv[1],"utf8")).mcpServers||{};
      const keys=process.argv[2].split(" ").filter(Boolean);
      const out={mcpServers:{}};
      for(const k of keys){ if(all[k]) out.mcpServers[k]=all[k]; }
      fs.writeFileSync(process.argv[3], JSON.stringify(out,null,2)+"\n");
    ' "$ROOT/.mcp.json" "$MCP_KEYS" "$out" 2>/dev/null \
      && info "wrote workspace/$name/.mcp.suggested.json (${MCP_KEYS// /, })" \
      || warn "could not generate .mcp.suggested.json"
  else
    warn "node or root .mcp.json missing — skipped MCP suggestion for $name"
  fi
}

# ---- write per-project SETUP.md (tracked knowledge) --------------------------
write_setup_doc() {
  local name="$1"; local d="$WS/$name"
  local docdir="$ROOT/docs/specs/$name"; mkdir -p "$docdir"
  local f="$docdir/SETUP.md"
  {
    echo "# SETUP — $name"
    echo ""
    echo "> Auto-generated by workspace-setup.sh. Source: \`workspace/$name/\`. Do not edit by hand; re-run the script to refresh."
    echo ""
    echo "## Detected stack"
    echo "- Mode: **${MODE:-new}** $( [ "${MODE:-new}" = customize ] && echo '(brownfield — old-code snapshot in `reference/'"$name"'/`)' || echo '(greenfield)' )"
    echo "- Languages: **${LANGS:-unknown}**"
    echo "- Frontend/UI: $( [ "$FE" = 1 ] && echo yes || echo no ) · Web/server: $( [ "$WEB" = 1 ] && echo yes || echo no ) · Mobile: $( [ "$MOBILE" = 1 ] && echo yes || echo no ) · Database: $( [ "$DB" = 1 ] && echo yes || echo no )"
    echo ""
    if [ "${MODE:-new}" = customize ]; then
      echo "## Old-code reference (trace before changing)"
      echo "- Read-only snapshot: \`reference/$name/\` (see \`.snapshot-info.md\`)."
      echo "- Diff old vs current: \`diff -ru reference/$name/<path> workspace/$name/<path>\`."
      echo "- Refresh: \`bash .agent/scripts/reference-snapshot.sh $name --force\`."
      echo ""
    fi
    echo "## Recommended MCP servers"
    for k in $MCP_KEYS; do echo "- \`$k\`"; done
    echo ""
    echo "> A ready-to-use subset is at \`workspace/$name/.mcp.suggested.json\`."
    echo "> To activate for Claude Code / Cursor, merge the wanted servers into root \`.mcp.json\` / \`.cursor/mcp.json\`,"
    echo "> or run: \`bash .agent/scripts/workspace-setup.sh --activate $name\`."
    echo ""
    echo "## Recommended skills"
    for s in $SKILLS; do echo "- \`$s\`"; done
    echo ""
    echo "## Next steps"
    echo "1. Fill in \`docs/specs/$name/CONSTITUTION.md\` (copy from docs/CONSTITUTION.md) with this project's real constraints."
    echo "2. Brownfield: \`bash .agent/scripts/onboard-existing.sh workspace/$name\` to index + baseline."
    echo "3. Start the workflow from \`/discovery\` for the first change request."
  } > "$f"
  info "wrote docs/specs/$name/SETUP.md"
}

# ---- activate a project's suggested MCP into root .mcp.json ------------------
activate_project() {
  local name="$1"; local sug="$WS/$name/.mcp.suggested.json"
  [ -f "$sug" ] || { warn "no suggestion for $name — run setup first"; return 1; }
  if ! has node; then warn "node required to activate"; return 1; fi
  cp "$ROOT/.mcp.json" "$ROOT/.mcp.json.bak.$name" 2>/dev/null || true
  node -e '
    const fs=require("fs");
    const root=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
    const sug=JSON.parse(fs.readFileSync(process.argv[2],"utf8"));
    root.mcpServers=Object.assign({}, root.mcpServers||{}, sug.mcpServers||{});
    fs.writeFileSync(process.argv[1], JSON.stringify(root,null,2)+"\n");
  ' "$ROOT/.mcp.json" "$sug"
  cp "$ROOT/.mcp.json" "$ROOT/.cursor/mcp.json" 2>/dev/null || true
  info "activated MCP for '$name' into .mcp.json + .cursor/mcp.json (backup: .mcp.json.bak.$name)"
}

# a project is "customize" (brownfield) when it is a git repo with commit history
is_customize() { git -C "$1" rev-parse --verify HEAD >/dev/null 2>&1; }

# ---- run full setup for one project dir already present ----------------------
setup_one() {
  local name="$1"; local d="$WS/$name"
  [ -d "$d" ] || { warn "workspace/$name not found"; return 1; }
  step "Configuring '$name'"
  detect_stack "$d"
  recommend_mcp
  recommend_skills
  # customize vs new
  if is_customize "$d"; then MODE="customize"; else MODE="new"; fi
  info "stack: ${LANGS:-unknown} | FE=$FE WEB=$WEB DB=$DB MOBILE=$MOBILE | mode=$MODE"
  info "MCP : ${MCP_KEYS// /, }"
  write_mcp_suggestion "$name"
  # customize projects: auto-snapshot the OLD code for tracing (reference/<name>/)
  if [ "$MODE" = "customize" ] && [ ! -e "$ROOT/reference/$name" ]; then
    info "customize project → creating read-only old-code snapshot in reference/$name ..."
    bash "$ROOT/.agent/scripts/reference-snapshot.sh" "$name" >/dev/null 2>&1 \
      && info "reference/$name ready (trace old code before changing)" \
      || warn "reference snapshot skipped for $name"
  fi
  write_setup_doc "$name"
}

# =============================================================== main =========
echo "════════════════════════════════════════════════════"
echo " VIDE-CODER workspace-setup — base $(cat "$ROOT/VERSION" 2>/dev/null || echo '?')"
echo "════════════════════════════════════════════════════"

MANIFEST=""; DETECT_ONLY=0; ACTIVATE=""
declare -a INLINE=()

# ----- parse args -----
if [ "$#" -eq 0 ]; then DETECT_ONLY=1; fi
while [ "$#" -gt 0 ]; do
  case "$1" in
    --manifest)    MANIFEST="${2:-}"; shift 2 ;;
    --detect-only) DETECT_ONLY=1; shift ;;
    --activate)    ACTIVATE="${2:-}"; shift 2 ;;
    -h|--help)     sed -n '2,20p' "$0"; exit 0 ;;
    *)             INLINE+=("$1"); shift ;;
  esac
done

# ----- activate mode (short-circuit) -----
if [ -n "$ACTIVATE" ]; then
  activate_project "$ACTIVATE"
  exit $?
fi

# ----- ensure hooks + skills mirror are set up once -----
step "Base prerequisites"
bash "$ROOT/.agent/scripts/setup-hooks.sh" >/dev/null 2>&1 && info "git hooks enabled" || warn "setup-hooks failed"
bash "$ROOT/.agent/scripts/sync-skills.sh" >/dev/null 2>&1 && info "skills mirrored to .agents/skills" || warn "sync-skills failed"

CLONED_ANY=0

# ----- detect-only: reconfigure every existing workspace project -----
if [ "$DETECT_ONLY" = 1 ] && [ -z "$MANIFEST" ] && [ "${#INLINE[@]}" -eq 0 ]; then
  step "Scanning existing projects under workspace/"
  found=0
  for d in "$WS"/*/; do
    [ -d "$d" ] || continue
    name="$(basename "$d")"
    case "$name" in .git) continue;; esac
    setup_one "$name"; found=1
  done
  [ "$found" = 0 ] && info "No projects found in workspace/. Pass a repo URL or --manifest."
fi

# ----- manifest mode -----
if [ -n "$MANIFEST" ]; then
  [ -f "$MANIFEST" ] || { warn "manifest not found: $MANIFEST"; exit 1; }
  step "Processing manifest: $MANIFEST"
  while IFS= read -r line; do
    line="${line%%#*}"; line="$(printf '%s' "$line" | xargs 2>/dev/null)"
    [ -z "$line" ] && continue
    # shellcheck disable=SC2086
    set -- $line
    src="$1"; name="${2:-$(derive_name "$src")}"; branch="${3:-}"
    fetch_project "$src" "$name" "$branch" && { setup_one "$name"; CLONED_ANY=1; }
  done < "$MANIFEST"
fi

# ----- inline URL/path mode -----
if [ "${#INLINE[@]}" -gt 0 ]; then
  src="${INLINE[0]}"; name="${INLINE[1]:-$(derive_name "$src")}"; branch="${INLINE[2]:-}"
  step "Processing: $src"
  fetch_project "$src" "$name" "$branch" && { setup_one "$name"; CLONED_ANY=1; }
fi

# ----- summary -----
step "Done"
info "Per-project reports:   docs/specs/<name>/SETUP.md"
info "Per-project MCP:       workspace/<name>/.mcp.suggested.json"
info "Activate one project:  bash .agent/scripts/workspace-setup.sh --activate <name>"
info "Verify tools/MCP:      bash .agent/scripts/verify-plugins.sh"
if [ "$CLONED_ANY" = 1 ]; then
  info "Brownfield onboarding: bash .agent/scripts/onboard-existing.sh workspace/<name>"
fi
echo ""
echo "✅ workspace-setup finished (no commits made — commit manually if desired)."
