---
name: code-traceability
description: >
  Gắn liên kết truy vết REQ→SPEC→TASK→commit→PR trong code & cập nhật traceability matrix. Dùng KHI
  đang implement/hoàn tất task; hoặc user nói "traceability", "truy vết", "liên kết task".
license: MIT
metadata: { author: vide-coder, version: "1.0" }
---

# Code Traceability

Đảm bảo mọi code truy được về Jira + spec.

## Quy trình
1. **Trích ID**: Jira Ticket (vd `PROJECT-102`) + mục spec tương ứng trong `docs/specs/`.
2. **Comment traceability** ở module/function quan trọng:
   ```ts
   /**
    * @JiraTicket PROJECT-102
    * @SpecRef docs/specs/auth-spec.md#FR-1
    * @Description JWT tokens with refresh rotation
    */
   ```
3. **Ghi vết trong task** `tasks/in-progress/PROJECT-XXX.md`: link file + line range khi xong sub-task.
4. Giữ `docs/traceability-matrix.md` khớp (REQ→SPEC→PLAN→TASK→commit→PR).
