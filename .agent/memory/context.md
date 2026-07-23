# BỘ NHỚ NGỮ CẢNH DỰ ÁN (context.md)

Tài liệu này lưu trữ toàn bộ ngữ cảnh tổng quan về dự án Vide-coder để AI Agent có thể truy cập tức thì khi bắt đầu làm việc.

---

## 📌 1. TỔNG QUAN DỰ ÁN (PROJECT OVERVIEW)

- **Tên dự án**: Vide-coder Core Workspace
- **Mục tiêu**: Xây dựng ứng dụng/hệ thống chuẩn hóa theo quy trình hợp tác giữa con người và AI Agent.
- **Kiến trúc Tổng thể**: Fullstack (Frontend UI + Backend Services + Shared Modules).

---

## 🛠️ 2. CONG NGHỆ VÀ THƯ VIỆN (TECH STACK)

- **Frontend (`src/frontend`)**: Flex theo dự án (React / Vue / Next.js / Vanilla JS).
- **Backend (`src/backend`)**: Flex theo dự án (Node.js / Laravel / Go / Python / Ruby).
- **Shared Code (`src/shared`)**: Shared Types, DTOs, Helper Utilities.
- **Database**: PostgreSQL / MySQL / MongoDB.

---

## 📖 3. THUẬT NGỮ CHUYÊN NGÀNH (GLOSSARY)

| Thuật ngữ | Ý nghĩa |
| :--- | :--- |
| **ADR** | Architecture Decision Record - Hồ sơ ghi lại quyết định kiến trúc lớn |
| **Blast Radius** | Phạm vi mã nguồn bị ảnh hưởng trực tiếp/gián tiếp khi chỉnh sửa |
| **AC** | Acceptance Criteria - Tiêu chuẩn nghiệm thu của Jira task |
| **MCP** | Model Context Protocol - Các plugin mở rộng công cụ cho AI Agent |
