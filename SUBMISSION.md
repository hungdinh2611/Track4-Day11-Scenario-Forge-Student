# Lab 11 — DinhBaoHung — 2A202602524

Thư mục và ZIP nộp bài: `K4-DAY11-DinhBaoHung-2A202602524`.

## Chạy lại trên bản repo sạch

Cài `requirements.txt`, chép `lab11/`, `hazard.json` và `REPORT.md` từ bài nộp vào repo.
MSSV có chữ `A`, trong khi parser dòng đầu của starter chỉ chấp nhận chữ số.
Dùng biến môi trường **có sẵn trong starter**, giữ nguyên toàn bộ MSSV:

```powershell
$env:LAB11_MSSV = '2A202602524'
python -m pytest -q
python run_all.py all
```

Trong workspace đã có môi trường `.venv`, có thể dùng:

```powershell
./run_lab.ps1 all
```

Trên Linux/macOS:

```bash
LAB11_MSSV=2A202602524 python run_all.py all
```

Không bỏ chữ A, không đổi seed và không sửa parser của `run_all.py`.

## Bằng chứng

- Các JSON pipeline lấy từ lần chạy đầy đủ, không `--quick`.
- `REPORT.md` trích các trường JSON và phân biệt ước lượng mẫu với cận trên khi không có hit.
- `inspection.json` là phát lại bổ sung các tham số đã có trong pipeline, không rút thêm mẫu để thay tổng số.
- `evidence/shots/` chứa ảnh render từ trình xem JS gốc; `manifest.json` ghi nguồn tham số và thời điểm.
- `hazard.json: exposure` là giả định minh họa công khai, chưa có khảo sát thực nghiệm. Báo cáo phân tích độ nhạy và không nhận tần suất suy ra là rủi ro đo ngoài đường.
- Không có bản ghi người dùng tự lái; báo cáo không nhận đã làm thử nghiệm đó.

Đây là gói file để nộp; chưa thực hiện tải lên VLearn.
