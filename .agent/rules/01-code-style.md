# QUY TẮC CODE VÀ PHONG CÁCH LẬP TRÌNH DỰ ÁN (01-code-style.md)

Tài liệu này quy định phong cách viết code (Code Style & Formatting Guidelines). File này tùy chỉnh linh hoạt (flex) theo ngôn ngữ/framework của **dự án đích**.

> ℹ️ Vide-Coder là **overlay** — quy tắc dưới áp cho source trong `workspace/<ten-du-an>/` (dù layout là `src/frontend`, `src/backend` hay bất kỳ cấu trúc nào sẵn có).

---

## 🎨 Quy Tắc Chung Cho Mọi Ngôn Ngữ

1. **Rõ ràng > Ngắn gọn**: Tên biến, tên hàm phải tự giải thích ý nghĩa (self-describing). Tránh viết tắt không rõ nghĩa (dùng `userRegistrationDate` thay vì `usrRegDt`).
2. **Kích thước Hàm/Method**: Mỗi hàm chỉ nên làm đúng 1 việc (Single Responsibility Principle). Độ dài tối đa ~30-50 dòng.
3. **Clean Code & Don't Repeat Yourself (DRY)**: Đưa logic chung vào `src/shared/` hoặc `utils/`. Tránh copy-paste code.
4. **Xử lý Lỗi (Error Handling)**: Luôn catch exception có chọn lọc, trả về error message rõ ràng và log lỗi với context đầy đủ.
5. **Không Dùng Magic Numbers / Hardcoded Strings**: Đưa tất cả constant vào file config hoặc Enum.

---

## 💻 Frontend Guidelines (`src/frontend`)

> 🎨 Dựng FE đẹp/thẩm mỹ, mượt, premium + chống "AI-slop" (design-to-code từ Figma, motion, a11y):
> skill [`ui-ux-promax`](.claude/skills/ui-ux-promax/SKILL.md) — command `/ui` (hoặc `/fe`).
> MCP: [`figma.md`](../plugins/figma.md) (Figma + shadcn/ui + Magic 21st.dev).

- **Component Architecture**: Sử dụng Functional Components, Atomic Design Pattern hoặc Modular Feature Folders.
- **State Management**: Phân định rõ Component Local State (UI state) và Global Application State (Redux, Zustand, Pinia...).
- **CSS / Styling**: 
  - Ưu tiên Vanilla CSS / CSS Modules hoặc Tailwind CSS (khi dự án yêu cầu).
  - Sử dụng CSS Variables cho Theme, Color Palette, Spacing.
  - Áp dụng hiệu ứng mượt mà (smooth transitions, hover states, micro-animations).

---

## ⚙️ Backend Guidelines (`src/backend`)

- **Layered Architecture**: Tách biệt rõ Controllers/Handlers -> Services/UseCases -> Repositories/Models.
- **API Standards**: 
  - RESTful API hoặc GraphQL chuẩn hóa format JSON response:
    ```json
    {
      "success": true,
      "data": { ... },
      "message": "Operation successful",
      "errors": null
    }
    ```
- **Database Querying**: Tránh N+1 query, dùng ORM/Query Builder có Indexing phù hợp.

---

## 🔄 Shared Code Guidelines (`src/shared`)

- Chứa các TypeScript Types/Interfaces, DTO Validation Schemas, Utility Functions dùng chung cho cả FE và BE.
- Không chứa code có side-effect trực tiếp tới môi trường DOM (browser) hoặc Database driver.
