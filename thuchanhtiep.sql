--Bài 10
--Không xóa được vì hóa đơn có ràng buộc khóa ngoại với bảng khác. Và đồng thời bảng Hóa đơn là bảng cha mà trong
--nguyên tắc sql bao giờ cũng phải xóa dữ liệu sql trước sau đó mới xóa cha.
--Giải pháp Khi dùng DELETE CASCADE, bạn có thể delete trực tiếp từ table Item. SQL Server sẽ tự động dò tìm và delete các record phụ thuộc trong table OrderDetail.
--Bài 11:
--Không được vì bảng chi tiết hóa đơn có ràng buộc với bảng HoaDon và trong trường hợp này bảng hóa đơn là cha nên muốn tạo phải tạo từ cha
--Bài 12
ALTER DATABASE Sales MODIFY NAME = BanHang;
--Bài 14:
Backup database BanHang to disk = 'D:\BanHang1.bak'
--Bài 15:
Drop database BanHang
--Bài 16
Restore database BanHang from disk = ' D:\BanHang1.bak' with replace