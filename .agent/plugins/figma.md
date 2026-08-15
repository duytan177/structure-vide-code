# FIGMA + SHADCN — FE DESIGN MCP (figma.md)

**Mức ưu tiên**: ⭐⭐⭐⭐⭐ (pha FE/UI)
**Vai trò**: Nguồn thiết kế cho **design-to-code** và registry component đẹp — phục vụ skill
[`ui-ux-promax`](.claude/skills/ui-ux-promax/SKILL.md).

---

## 🧩 CÁC MCP

### 1. Figma MCP (design source)
Trích design context, screenshot, variables, Code Connect từ file Figma.

**Cách A — Framelink (headless, cần API key)** — đang cấu hình sẵn trong `.mcp.json`:
```json
"figma": {
  "command": "npx",
  "args": ["-y", "figma-developer-mcp", "--stdio"],
  "env": { "FIGMA_API_KEY": "<YOUR_FIGMA_API_KEY>" }
}
```
Lấy API key: Figma → Settings → Security → Personal access tokens.

**Cách B — Figma Dev Mode MCP chính chủ (cần Figma Desktop chạy)**:
Bật trong Figma Desktop (Preferences → Enable Dev Mode MCP Server), rồi trỏ MCP tới `http://127.0.0.1:3845/mcp`.
Mạnh hơn (get_design_context, get_variable_defs, Code Connect) nhưng cần app desktop mở.

### 2. shadcn/ui MCP (component registry đẹp)
Duyệt & thêm component chuẩn đẹp, a11y tốt vào dự án.
```json
"shadcn": { "command": "npx", "args": ["-y", "shadcn@latest", "mcp"] }
```

### 3. Magic MCP — 21st.dev (sinh UI đẹp bằng mô tả)
Sinh nhanh component/section đẹp từ ngôn ngữ tự nhiên → nguồn cảm hứng cho skill `ui-ux-promax`.
```json
"magic": {
  "command": "npx",
  "args": ["-y", "@21st-dev/magic@latest"],
  "env": { "API_KEY": "<YOUR_21ST_DEV_API_KEY>" }
}
```
Lấy API key tại 21st.dev. ⚠️ Luôn **map component sinh ra về design tokens & a11y của dự án**, không dán nguyên.

## 🔧 TÍNH NĂNG CHÍNH (Figma MCP)
- `get_design_context` / `get_metadata`: cấu trúc + thuộc tính node đang chọn.
- `get_screenshot`: ảnh render để đối chiếu.
- `get_variable_defs`: **design tokens** (màu/spacing/typography) → map sang Tailwind/CSS variables.
- `get_code_connect_map`: component Figma ↔ component code có sẵn (tái dùng, không dựng lại).

## 🪄 PROMPT MẪU
- "Lấy design context của frame [link Figma] rồi dựng component theo shadcn + Tailwind, map tokens từ Figma variables."
- "So sánh screenshot Figma với trang đang render (Playwright) và sửa lệch spacing/màu."

## ⚖️ TOKEN BUDGETING (theo plugins/README.md)
- Figma + shadcn chỉ bật ở **pha FE/UI**; tắt khi làm BE để tiết kiệm context.
- Không bật cùng lúc quá nhiều MCP (giữ < 10 active).

## 🔒 LƯU Ý
- `FIGMA_API_KEY` để trong biến môi trường/secret, **không commit** giá trị thật (file config chỉ để placeholder).
