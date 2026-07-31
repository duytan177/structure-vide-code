<!-- Bước 10: HUMAN REVIEW — điền đầy đủ trước khi xin duyệt -->

## 🎫 Jira / Task
- Ticket: `PROJECT-XXX`
- Task file: `tasks/in-progress/PROJECT-XXX.md`
- Spec liên quan: `docs/specs/SPEC-XXX.md`
- ADR/RFC (nếu có): `docs/adr/...`

## 📝 Mô tả thay đổi
<!-- Tóm tắt WHAT + WHY. -->

## 🔗 Traceability
> REQ → SPEC → PLAN → TASK → PR (xem `docs/traceability-matrix.md`)

## ✅ Definition of Done (xem `docs/DEFINITION-OF-DONE.md`)
- [ ] Bước 1-2: Discovery + Impact Analysis đã ghi vết (`docs/discovery/`)
- [ ] Bước 8: Lint sạch, Typecheck pass
- [ ] Bước 8: Unit tests pass (coverage ≥ 80%) + E2E pass (nếu có UI)
- [ ] Bước 9: Semgrep không còn High/Critical
- [ ] Bước 9: AI review (CodeRabbit) đã xử lý comment
- [ ] Bước 11: Cập nhật spec/ADR/`.agent/memory/decision-log.md`/changelog
- [ ] Commit theo Conventional Commits + Jira ID

## 🧪 Cách kiểm thử
<!-- Các bước reviewer chạy để verify. -->

## 📸 Screenshots / logs (nếu có)
