# SKILL CÓ SẴN: QUẢN LÝ GIT WORKTREE CHO ĐA AI AGENT (git-worktree-flow.md)

Skill này hướng dẫn AI Agent (Claude Code, Cursor, Antigravity, Windsurf) tạo và làm việc trên **Git Worktree** để cô lập môi trường lập trình khi thực hiện **Bước 7: IMPLEMENTATION**.

---

## 🎯 MỤC TIÊU SKILL
Cho phép nhiều AI Agent hoạt động song song trên các Jira Task/nhánh khác nhau mà không làm bẩn working directory chính hoặc đè code của nhau.

---

## 📋 HƯỚNG DẪN LỆNH GIT WORKTREE

```bash
# 1. Tạo worktree độc lập cho task mới từ branch main
git worktree add -b feature/PROJECT-101-login ../worktree-PROJECT-101 main

# 2. AI Agent di chuyển vào thư mục worktree đó để sửa code
cd ../worktree-PROJECT-101

# 3. Sau khi hoàn thành và PR được merge, dọn dẹp worktree
git worktree remove ../worktree-PROJECT-101
```
