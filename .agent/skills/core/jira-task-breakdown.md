# SKILL CÓ SẴN: CHIA NHỎ TASK CHUẨN JIRA BACKLOG (jira-task-breakdown.md)

Skill này hướng dẫn AI Agent chuyển đổi yêu cầu từ người dùng hoặc Jira Story thành các Sub-tasks nhỏ gọn, cụ thể theo tiêu chuẩn Jira Backlog.

---

## 🎯 MỤC TIÊU SKILL
Chia nhỏ công việc phức tạp thành các bước thực thi từ 15-30 phút, có Acceptance Criteria rõ ràng để dễ theo dõi và log task lên Jira về sau.

---

## 📋 CÁC BƯỚC THỰC THI (PROCEDURE)

1. **Định dạng file Task**:
   - Tạo file trong `tasks/backlog/PROJECT-XXX.md` dựa trên template `tasks/backlog/jira-task-template.md`.

2. **Xây dựng Tiêu chuẩn Nghiệm thu (Acceptance Criteria - AC)**:
   - Sử dụng chuẩn **Gherkin**:
     - **Given** [Tiền đề/Trạng thái ban đầu]
     - **When** [Hành động người dùng / API request]
     - **Then** [Kết quả kỳ vọng thu được]

3. **Chia nhỏ danh sách công việc cho AI (AI Technical Checklist)**:
   - Phân chia các bước thực thi theo từng tầng:
     - `[ ]` Data Layer / Migration / Models
     - `[ ]` Business Logic / Service Layer
     - `[ ]` API Controller / Route Handlers
     - `[ ]` Frontend UI Components & State Management
     - `[ ]` Unit Tests & Playwright E2E Tests
