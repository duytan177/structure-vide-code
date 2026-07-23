# SKILL CÓ SẴN: LIÊN KẾT MÃ NGUỒN VỚI SPEC VÀ JIRA TASK (code-traceability-linkage.md)

Skill này hướng dẫn AI Agent gắn vết (Traceability Linkage) các đoạn code mới viết hoặc chỉnh sửa trong `src/` về đúng Jira Task ID và mục đặc tả (Spec) liên quan.

---

## 🎯 MỤC TIÊU SKILL
Đảm bảo 100% mã nguồn trong `src/` đều có thể truy xuất nguồn gốc (Traced back) về yêu cầu kinh doanh trên Jira và tài liệu đặc tả hệ thống.

---

## 📋 QUY TRÌNH THỰC THI (PROCEDURE)

1. **Trích xuất Jira Issue Key & Spec Line**:
   - Xác định Jira Ticket ID đang làm việc (ví dụ: `PROJECT-102`).
   - Xác định mục spec tương ứng trong `docs/specs/` hoặc `docs/spec-changes/`.

2. **Ghi chú Traceability trong Comment Code (khi tạo mới module/function quan trọng)**:
   - **TypeScript / JS / PHP / Go**:
     ```typescript
     /**
      * @JiraTicket PROJECT-102
      * @SpecRef docs/specs/auth-spec.md#FR-1
      * @Description Generates JWT tokens with refresh rotation mechanism
      */
     export function generateAuthTokenPair(userId: string) { ... }
     ```

3. **Ghi vết trong File Task Jira (`tasks/in-progress/PROJECT-XXX.md`)**:
   - Khi hoàn thành 1 sub-task, bổ sung liên kết File URI và Line range:
     - `[x] Implement Token Service: [TokenService.ts](file:///home/duytan/Tan/Coder/Vide-code/src/backend/services/TokenService.ts#L15-L45)`
