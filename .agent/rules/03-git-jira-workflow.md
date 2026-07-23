# QUY ĐỊNH WORKFLOW GIT VÀ JIRA INTEGRATION (03-git-jira-workflow.md)

Tài liệu này hướng dẫn AI Agent và lập trình viên quy trình làm việc với Git, tên branch, commit message và đồng bộ công việc với Jira Backlog.

---

## 🌿 1. QUY TẮC ĐẶT TÊN BRANCH (GIT BRANCHING MODEL)

Mọi branch làm việc phải gắn liền với **Jira Ticket ID**:

- **Feature Branch**: `feature/PROJECT-XXX-short-description` (Thêm tính năng mới)
- **Bugfix Branch**: `fix/PROJECT-XXX-short-description` (Sửa lỗi Bug)
- **Refactor Branch**: `refactor/PROJECT-XXX-short-description` (Tái cấu trúc code)
- **Hotfix Branch**: `hotfix/PROJECT-XXX-short-description` (Sửa lỗi khẩn cấp trên Production)

---

## 📝 2. CHUẨN COMMIT MESSAGE (CONVENTIONAL COMMITS)

Cú pháp commit bắt buộc tuân theo:

```text
<type>(<scope>): <Jira Issue ID> - <Short Summary>

[Optional Body detailing changes]
[Optional Footer]
```

### Các loại Types:
- `feat`: Thêm tính năng mới
- `fix`: Sửa lỗi bug
- `docs`: Sửa/thêm tài liệu
- `style`: Định dạng code (whitespace, format - không đổi logic)
- `refactor`: Sửa code không đổi tính năng, không sửa bug
- `test`: Thêm hoặc sửa test case
- `chore`: Thay đổi build script, package dependency

### Ví dụ chuẩn:
```text
feat(auth): PROJECT-102 - Implement JWT refresh token rotation mechanism

- Add refresh token model to database schema
- Create middleware for token verification and automatic renewal
- Update auth service tests
```

---

## 🔄 3. QUY TRÌNH ĐỒNG BỘ JIRA TASKS IN LOCAL REPOSITORY

1. Khi bắt đầu task mới trên Jira:
   - Đọc file task tương ứng trong `tasks/backlog/PROJECT-XXX.md`.
   - Di chuyển file sang `tasks/in-progress/PROJECT-XXX.md`.
2. Khi hoàn thành và tạo PR:
   - Sử dụng **GitHub MCP** để đẩy branch và mở PR.
   - Di chuyển file sang `tasks/completed/PROJECT-XXX.md`.
