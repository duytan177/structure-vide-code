# TRACEABILITY MATRIX

Bảng truy vết end-to-end đảm bảo mỗi dòng code đều lần ngược được về yêu cầu gốc.
Chuỗi ID chuẩn: **REQ → SPEC → PLAN → TASK(Jira) → COMMIT/PR**.

## Quy ước ID
| Loại | Tiền tố | Vị trí |
| :--- | :--- | :--- |
| Requirement | `REQ-XXX` | `docs/client-requirements/` |
| Specification | `SPEC-XXX` | `docs/specs/SPEC-XXX.md` |
| Architecture Decision | `ADR-XXX` / `RFC-XXX` | `docs/adr/` |
| Plan | `PLAN-XXX` | `plans/` |
| Task (Jira) | `PROJECT-XXX` | `tasks/` |

## Ma trận
| REQ | SPEC | ADR/RFC | PLAN | TASK (Jira) | PR | Trạng thái |
| :-- | :--- | :------ | :--- | :---------- | :- | :--------- |
| REQ-001 | SPEC-001 | — | PLAN-001 | PROJECT-101 | #— | ⬜ Backlog |
<!-- Thêm dòng mới cho mỗi requirement. Cập nhật ở Bước 6 và Bước 11. -->

> Trạng thái: ⬜ Backlog · 🟡 In-progress · 🔵 In-review · ✅ Done
