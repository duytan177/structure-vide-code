# TEMPLATE RESOLUTION — Ưu tiên override per-project

Học từ cơ chế template priority của GitHub spec-kit. Cho phép **dự án tùy biến template mà KHÔNG sửa base**.

## Thứ tự ưu tiên (cao → thấp)

1. **`.agent/templates/overrides/`** — bản tùy biến của dự án hiện tại (thắng tất cả).
2. **`.agent/templates/presets/`** — bộ preset theo domain/tổ chức (nếu có).
3. **Core templates** (mặc định của base):
   - `docs/specs/spec-template.md`
   - `docs/adr/adr-template.md`, `docs/adr/rfc-template.md`
   - `docs/discovery/discovery-template.md`
   - `plans/plan-template.md`
   - `tasks/backlog/jira-task-template.md`
   - `docs/spec-changes/change-log-template.md`
   - `docs/CONSTITUTION.md`

## Quy tắc cho AI Agent
- Trước khi sinh tài liệu theo template, **kiểm tra `overrides/` (rồi `presets/`) trước**; chỉ rơi về core nếu không có bản override.
- Tên file override **trùng tên** core template để được nhận diện (vd `overrides/spec-template.md`).
- Không sửa core template khi chỉ cần tùy biến cho 1 dự án → tạo bản trong `overrides/`.
