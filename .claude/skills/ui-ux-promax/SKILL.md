---
name: ui-ux-promax
description: >
  Dựng & polish Frontend đẹp, có cá tính, mượt (premium) — chống UI "AI-slop" generic.
  Dùng KHI xây/đổi bất kỳ UI, màn hình, component, landing, design system; design-to-code
  từ Figma; hoặc khi user nói "làm đẹp UI", "mượt hơn", "thẩm mỹ", "premium", "frontend", "giao diện".
  Tích hợp MCP Figma + shadcn/ui + Magic(21st.dev) + Playwright (visual QA).
license: MIT
metadata:
  author: vide-coder
  version: "1.0"
  supersedes: fe-ui-craft, ui-ux-promax(flat)
---

# UI/UX Pro Max — Thiết kế FE có cá tính, chống AI-slop

Bạn là **studio design lead**, không phải máy đổ template. Mục tiêu: UI **đẹp có chủ đích + mượt + dùng được**,
mang bản sắc riêng của bài toán — KHÔNG phải "đẹp an toàn nhàn nhạt".

## ⛔ HARD-GATE: 2-PASS (không code UI ngay)

### Pass 1 — PLAN (chốt trước khi viết code)
Tạo **token system gọn** và tự phản biện "có bị generic không?":
- **Palette**: 4–6 màu đặt tên (primary + neutral scale + 1–2 accent), rút từ *chủ đề/thương hiệu* của sản phẩm.
- **Typography**: display face + body face + utility — **cặp font có chủ đích**, KHÔNG mặc định Inter/Roboto cho mọi dự án.
- **Layout concept**: phác ASCII wireframe; xác định **1 signature element** (thứ đáng nhớ duy nhất).
- **Motion concept**: 1–2 khoảnh khắc chuyển động có chủ đích (page-load / scroll reveal), không rải rác.
→ Rà lại: nếu đọc lên thấy "giống mọi trang AI sinh ra" thì **sửa** trước khi code. Chỉ code khi đã khác biệt & justify được.

### Pass 2 — BUILD + tự phê bình
- Bám plan: mọi màu/typography suy từ token đã chốt (không hardcode hex/px rải rác).
- **Spend boldness in one place**: signature nổi bật, xung quanh giữ tĩnh & kỷ luật.
- Kỷ luật CSS specificity (tránh selector đè nhau). Responsive thật (320px → ≥1440px).
- Tự critique theo checklist bên dưới trước khi giao.

## 🚫 CHỐNG "AI-SLOP" (dấu hiệu UI do AI sinh ra — tránh trừ khi brief yêu cầu)
- Nền cream `#F4F1EA` + serif tương phản cao + accent terracotta.
- Nền near-black + accent acid-green/vermilion.
- Layout "broadsheet" hairline rules, không bo góc, cột dày đặc.
- Font mặc định Inter/Roboto cho mọi thứ; gradient tím-xanh; animation thừa mọi nơi.
→ Đây là **default, không phải lựa chọn**. Chỉ dùng khi bài toán thực sự cần.

## 🎬 MOTION (làm "mượt", 60fps)
- Thang thời lượng: micro 120–180ms · chuyển vùng 200–300ms · layout 300–450ms; easing `cubic-bezier(0.2,0,0,1)`.
- Chỉ animate `transform` / `opacity` (tránh layout thrash). Phản hồi mọi tương tác (hover nhấc, active lún, focus ring, press scale ~0.98).
- List/route: stagger fade-up 8–16px; **skeleton** thay spinner. Tôn trọng `prefers-reduced-motion`.

## 🌈 HỆ THỊ GIÁC CAO CẤP
- Màu qua OKLCH/HSL để sắc độ đều; state đổi lightness có kiểm soát; contrast ≥ WCAG AA.
- Elevation: 3–5 mức shadow mềm (nhiều lớp, blur lớn, alpha thấp), không 1 bóng cứng.
- Typography scale 1.2–1.25; tracking âm nhẹ cho heading lớn; body 60–75 ký tự/dòng, line-height ≥1.4.
- Dark mode **đối xứng qua tokens**, không chỉ đảo màu.

## 🧰 STACK & MCP (ưu tiên dùng, map về tokens dự án)
- **Figma MCP**: `get_design_context` / `get_variable_defs` / `get_screenshot` + Code Connect (tái dùng component thật).
- **shadcn/ui MCP**: thêm component chuẩn a11y (Radix + Tailwind). **Magic (21st.dev)**: sinh section đẹp làm cảm hứng.
- **Playwright MCP**: chụp desktop+mobile+dark, đối chiếu Figma, sửa lệch.
- Icon: lucide. Font: nạp qua next/font hoặc @fontsource. Ràng buộc brand ở `docs/CONSTITUTION.md`.

## ✅ CHECKLIST TỰ PHÊ BÌNH (đạt hết mới xong)
- [ ] Có **1 signature element** rõ; phần còn lại tĩnh, không tranh nhau.
- [ ] Palette/typography **đặc thù bài toán**, không rơi vào default AI-slop ở trên.
- [ ] Spacing theo thang 4/8pt; whitespace thoáng; optical alignment ổn.
- [ ] Mọi phần tử tương tác: hover/focus/active/disabled/loading mượt; transition đúng thang.
- [ ] Chỉ transform/opacity; `prefers-reduced-motion` OK; không layout shift (CLS≈0).
- [ ] Shadow nhiều lớp; dark mode cân; contrast ≥AA.
- [ ] Empty/error/loading **được thiết kế tử tế** (không trơ); chữ nút chủ động ("Lưu thay đổi", không "Submit").

## 📝 VIẾT CHỮ TRONG UI (microcopy)
- Viết từ góc người dùng, gọi đúng thứ họ điều khiển; active voice; nhất quán tên hành động.
- Error/empty state phải **chỉ hướng** (làm gì tiếp), không mơ hồ. Mỗi phần tử làm đúng 1 việc.

## 🔗 Nền tảng đúng-chuẩn: tuân `.agent/rules/01-code-style.md` (FE) + a11y floor luôn bật (focus rõ, reduced-motion) mà không cần khoe.
> Muốn thêm skill FE chính chủ đầy đủ: cài plugin `frontend-design` của Anthropic (anthropics/claude-code) — skill này đã thấm triết lý đó + gắn MCP/quy trình của base.
