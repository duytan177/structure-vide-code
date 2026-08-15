---
name: task-breakdown
description: >
  Chia việc Epic→Story→Task→Subtask chuẩn Jira backlog + gắn traceability. Dùng SAU Planning, TRƯỚC
  Analyze; hoặc khi user nói "breakdown", "chia task", "tạo task", "backlog", "Jira".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Task Breakdown (Bước 6)

Chia việc thành bước 15–30 phút, AC rõ ràng.

## Quy trình
1. **File task**: `tasks/backlog/PROJECT-XXX.md` theo `tasks/backlog/jira-task-template.md`; backlink SPEC/PLAN.
2. **Acceptance Criteria (Gherkin)**: Given [tiền đề] · When [hành động] · Then [kết quả kỳ vọng].
3. **AI Technical Checklist** theo tầng:
   - `[ ]` Data Layer / Migration / Models
   - `[ ]` Business Logic / Service
   - `[ ]` API Controller / Routes
   - `[ ]` Frontend UI + State
   - `[ ]` Unit Tests + Playwright E2E
4. Cập nhật `docs/traceability-matrix.md`.

Command `/breakdown`. Next: `/analyze`.
