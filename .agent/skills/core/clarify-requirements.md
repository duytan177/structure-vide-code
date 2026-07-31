# SKILL: LÀM RÕ YÊU CẦU MƠ HỒ (clarify-requirements.md)

Skill này là **bước 1.5 (giữa Discovery và Specification)**: bóc tách và **hỏi làm rõ** các điểm
mơ hồ/thiếu trước khi viết Spec. Học từ `/speckit.clarify` của GitHub spec-kit.

---

## 🎯 MỤC TIÊU
Giảm rủi ro spec sai do "đoán". Mọi giả định phải được **user xác nhận** hoặc ghi rõ là giả định.

## 🔍 CÁC LOẠI ĐIỂM CẦN LÀM RÕ
1. **Chức năng mơ hồ**: hành vi chưa định nghĩa cho edge case (input rỗng, lỗi mạng, quyền hạn).
2. **Ràng buộc phi chức năng**: hiệu năng, bảo mật, i18n, mobile/desktop, tải đồng thời.
3. **Dữ liệu**: định dạng, validation, nguồn sự thật, vòng đời (tạo/sửa/xóa/soft-delete).
4. **Ranh giới scope**: cái gì KHÔNG làm lần này (out-of-scope) — chống scope creep.
5. **Phụ thuộc**: hệ thống ngoài, API, quyền truy cập, thứ tự triển khai.

## 🧭 QUY TRÌNH
1. Đọc `docs/discovery/` + `docs/client-requirements/` (và `_baseline/` nếu brownfield).
2. Lập danh sách câu hỏi **có cấu trúc**, ưu tiên câu chặn (blocker) trước.
3. Hỏi user theo dạng **trắc nghiệm/đề xuất mặc định** khi có thể (dễ trả lời nhanh).
4. Ghi câu trả lời + giả định còn lại vào `docs/discovery/<feature>-clarifications.md`.
5. Cập nhật những ràng buộc bất biến (nếu phát sinh) vào `docs/CONSTITUTION.md`.

## ✅ ĐIỀU KIỆN RA (exit)
- Không còn câu hỏi mức 🔴 blocker chưa trả lời.
- Mọi giả định chưa xác nhận được đánh dấu `[ASSUMPTION]` để review ở Spec.

## 🚫 CHỐNG LAN MAN
- Không hỏi thứ đã trả lời được từ tài liệu/code.
- Mỗi câu hỏi phải dẫn tới một quyết định cụ thể (không hỏi "cho vui").
