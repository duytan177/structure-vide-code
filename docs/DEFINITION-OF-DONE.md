# DEFINITION OF DONE (DoD)

A task/PR is only considered **DONE** when it satisfies **all** the criteria below. Shared by every AI Agent and human.

## 1. Requirements & design
- [ ] Discovery is traced in `docs/discovery/` (Step 1).
- [ ] Impact Analysis (blast radius) has been assessed (Step 2).
- [ ] If there is a major architecture change → an ADR/RFC exists in `docs/adr/` (Step 3).
- [ ] A corresponding Spec exists `docs/specs/SPEC-XXX.md` (Step 4).

## 2. Code
- [ ] Complies with `01-code-style.md` and `02-architecture-principles.md`.
- [ ] No hardcoded secret/magic number.
- [ ] Code runs in a dedicated Git Worktree, branch per rule 03's standard.

## 3. Quality (Step 8 — Self Validation)
- [ ] Linter clean (0 errors/warnings).
- [ ] Typecheck passes.
- [ ] Unit tests pass, coverage ≥ 80%.
- [ ] E2E (Playwright) passes for parts with UI, covering all Acceptance Criteria.

## 4. Security & review (Step 9)
- [ ] Semgrep has no remaining High/Critical issues (OWASP Top 10).
- [ ] AI review (CodeRabbit) has resolved all important comments.

## 5. Knowledge (Step 11)
- [ ] Update spec/ADR if logic changes.
- [ ] Update `.agent/memory/decision-log.md`.
- [ ] Update `docs/traceability-matrix.md` (REQ→SPEC→TASK→PR).
- [ ] Update the changelog (`docs/spec-changes/`) if the spec changes.
- [ ] Re-index Graphify/GitNexus/Superpower.

## 6. Handover
- [ ] PR opened with `pull_request_template.md` fully filled in.
- [ ] Commit per Conventional Commits + Jira ID.
- [ ] Approved by a CODEOWNER (Step 10).
