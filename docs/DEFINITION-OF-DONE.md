# DEFINITION OF DONE (DoD)

Một task/PR chỉ được coi là **DONE** khi thỏa **tất cả** tiêu chí dưới đây. Dùng chung cho mọi AI Agent và người.

## 1. Yêu cầu & thiết kế
- [ ] Discovery đã ghi vết trong `docs/discovery/` (Bước 1).
- [ ] Impact Analysis (blast radius) đã đánh giá (Bước 2).
- [ ] Nếu có thay đổi kiến trúc lớn → có ADR/RFC trong `docs/adr/` (Bước 3).
- [ ] Có Spec tương ứng `docs/specs/SPEC-XXX.md` (Bước 4).

## 2. Code
- [ ] Tuân thủ `01-code-style.md` và `02-architecture-principles.md`.
- [ ] Không hardcode secret/magic number.
- [ ] Code chạy trong Git Worktree riêng, branch đúng chuẩn rule 03.

## 3. Chất lượng (Bước 8 — Self Validation)
- [ ] Linter sạch (0 error/warning).
- [ ] Typecheck pass.
- [ ] Unit test pass, coverage ≥ 80%.
- [ ] E2E (Playwright) pass cho phần có UI, cover đủ Acceptance Criteria.

## 4. Bảo mật & review (Bước 9)
- [ ] Semgrep không còn lỗi High/Critical (OWASP Top 10).
- [ ] AI review (CodeRabbit) đã xử lý hết comment quan trọng.

## 5. Tri thức (Bước 11)
- [ ] Cập nhật spec/ADR nếu logic đổi.
- [ ] Cập nhật `.agent/memory/decision-log.md`.
- [ ] Cập nhật `docs/traceability-matrix.md` (REQ→SPEC→TASK→PR).
- [ ] Cập nhật changelog (`docs/spec-changes/`) nếu đổi spec.
- [ ] Re-index Graphify/GitNexus/Superpower.

## 6. Bàn giao
- [ ] PR mở với `pull_request_template.md` điền đầy đủ.
- [ ] Commit theo Conventional Commits + Jira ID.
- [ ] Được CODEOWNER duyệt (Bước 10).
