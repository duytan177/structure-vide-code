# PROJECT CONSTITUTION — <TÊN DỰ ÁN>

> **Hiến pháp dự án** = các **nguyên tắc BẤT BIẾN** riêng của dự án này (khác với `.agent/rules/` là luật chung mọi dự án).
> Điền khi Onboarding/Discovery. Mọi Spec/Plan/Code phải tuân thủ; `/analyze` sẽ chặn nếu vi phạm.
> Học từ concept `constitution` của GitHub spec-kit.
>
> Nhiều dự án trong `workspace/`? Tạo bản riêng: `docs/specs/<ten-du-an>/CONSTITUTION.md`.

- **Phiên bản**: 1.0.0 · **Cập nhật**: <yyyy-mm-dd> · **Chủ sở hữu**: <PO/Tech Lead>

---

## 1. TECH STACK (chốt cứng)
- Ngôn ngữ / framework FE: <...>
- Ngôn ngữ / framework BE: <...>
- Database / hạ tầng: <...>
- Không dùng: <thư viện/pattern bị cấm và lý do>

## 2. RÀNG BUỘC KIẾN TRÚC (non-negotiable)
- <VD: mọi call DB qua repository layer, cấm query trực tiếp ở controller>
- <VD: không thêm dependency mới nếu chưa có ADR>

## 3. CHẤT LƯỢNG & BẢO MẬT (ngưỡng bắt buộc)
- Test coverage tối thiểu: <80%>
- Semgrep: không được có High/Critical.
- <VD: mọi input người dùng phải validate ở BE>

## 4. RÀNG BUỘC NGHIỆP VỤ / DOMAIN
- <VD: tiền tệ luôn lưu bằng integer (cents), không dùng float>
- <VD: dữ liệu cá nhân phải tuân thủ quy định X>

## 5. QUY ƯỚC KHÔNG ĐƯỢC PHÁ
- Commit theo `.agent/skills/core/semantic-commit-render.md`.
- Branch/PR theo `.agent/rules/03-git-jira-workflow.md`.
- <bổ sung quy ước riêng dự án>

---

> ⚖️ Khi một yêu cầu mâu thuẫn với Constitution: **DỪNG**, nêu xung đột, xin quyết định (sửa Constitution qua ADR hoặc đổi yêu cầu). Không tự ý vi phạm.
