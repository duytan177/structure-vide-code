# NGUYÊN TẮC KIẾN TRÚC VÀ THIẾT KẾ (02-architecture-principles.md)

Tài liệu này quy định các nguyên tắc thiết kế kiến trúc hệ thống bắt buộc AI Agent và lập trình viên tuân thủ khi mở rộng mã nguồn trong `src/`.

---

## 🏛️ 1. NGUYÊN TẮC CỐT LÕI (SOLID & CLEAN ARCHITECTURE)

- **S - Single Responsibility**: Mỗi class/module chỉ đảm nhận một trách nhiệm duy nhất.
- **O - Open/Closed**: Mở rộng tính năng bằng kế thừa/interface, hạn chế sửa đổi trực tiếp core logic đã ổn định.
- **L - Liskov Substitution**: Class con phải thay thế được class cha mà không làm hỏng tính đúng đắn của chương trình.
- **I - Interface Segregation**: Thà dùng nhiều interface nhỏ chuyên biệt còn hơn 1 interface lớn ôm đồm.
- **D - Dependency Inversion**: Phụ thuộc vào Abstraction (Interface), không phụ thuộc vào Concretization (Class cụ thể).

---

## 🏗️ 2. MÔ HÌNH PHÂN CẤP THƯ MỤC SOURCE CODE (`src/`)

```text
src/
├── frontend/                   # Frontend Client
│   ├── assets/                 # Images, Fonts, Styles
│   ├── components/             # Reusable UI Components
│   ├── features/               # Feature Modules (Pages, Logic)
│   ├── services/               # API Calls & External Integrations
│   └── store/                  # Global State Management
├── backend/                    # Backend Server
│   ├── controllers/            # Request handling & HTTP Routing
│   ├── services/               # Business Logic execution
│   ├── repositories/           # Database access layer
│   ├── models/                 # Entities / DB Schemas
│   └── config/                 # Environment & Service configs
└── shared/                     # Shared Core
    ├── constants/              # System-wide Enums & Constants
    ├── dtos/                   # Data Transfer Objects
    └── utils/                  # Pure Helper Functions
```

---

## 🛡️ 3. QUY TRÌNH RA QUYẾT ĐỊNH KIẾN TRÚC (ADR - Architecture Decision Records)

Khi có bất kỳ thay đổi lớn nào về mặt kiến trúc (như thay đổi Database, thêm Caching Layer, thay đổi thư viện UI core, đổi Authentication Protocol):
1. **BẮT BUỘC** tạo file ADR mới trong thư mục `docs/adr/yyyy-mm-dd-<decision-title>.md` theo mẫu `docs/adr/adr-template.md`.
2. Ghi rõ: Ngữ cảnh (Context), Các lựa chọn xem xét (Options Considered), Quyết định được chọn (Decision), Hậu quả & Đánh đổi (Consequences).
3. Đăng ký thông tin ADR vào `.agent/memory/decision-log.md`.
