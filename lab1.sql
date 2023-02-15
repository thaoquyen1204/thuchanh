--Bai1
Exec sp_addtype 'Mota', 'nvarchar(40)', 'null'
Exec sp_addtype 'IDKH', 'char(10)', ' Not null'
Exec sp_addtype 'DT', 'char(12)' , 'null'
create table dbo.SanPham(
Masp char(6)  NOT NULL,
Tensp varchar(20) NOT NULL,
NgayNhap date,
DVT char(10),
SoLuongTon int,
DonGiaNhap money,
)

CREATE TABLE KhachHang (
MaKH IDKH ,
TenKH NVARCHAR(30),
DiaCHi NVARCHAR(40),
DienThoai DT,
)
create table dbo.HoaDon(
MaHD char (10) ,
NgayLap date,
NgayGiao date,
MaKH IDKH ,
DienGiai Mota,
)

CREATE TABLE ChiTietHD (
MaHD CHAR(10)  NOT NULL,
MaSP CHAR(6)  NOT NULL,
SoLuong INT
)
-- 3. Trong Table HoaDon, sửa cột DienGiai thành nvarchar(100).
ALTER TABLE HoaDon
ALTER COLUMN DienGiai NVARCHAR(100)
-- 4. Thêm vào bảng SanPham cột TyLeHoaHong float
ALTER TABLE SanPham
ADD TyLeHoaHong float
-- 5. Xóa cột NgayNhap trong bảng SanPham
ALTER TABLE SanPham
DROP COLUMN NgayNhap
-----6. Tạo các ràng buộc khoá chính và khoá ngoại 
ALTER TABLE SanPham
ADD
CONSTRAINT pk_sp primary key(Masp)

ALTER TABLE HoaDon
ADD
CONSTRAINT pk_hd primary key(MaHD)

ALTER TABLE KhachHang
ADD
CONSTRAINT pk_khanghang primary key(MaKH)

ALTER TABLE HoaDon
ADD
CONSTRAINT fk_khachhang_hoadon FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH)

ALTER TABLE ChiTietHD
ADD
CONSTRAINT fk_hoadon_chitiethd FOREIGN KEY(MaHD) REFERENCES HoaDon(MaHD)

ALTER TABLE ChiTietHD
ADD
CONSTRAINT fk_sanpham_chitiethd FOREIGN KEY(MaSP) REFERENCES SanPham(Masp)


----- 7.Thêm vào bảng HoaDon các ràng buộc
ALTER TABLE HoaDon
ADD CHECK (NgayGiao > NgayLap)

ALTER TABLE HoaDon
ADD CHECK (MaHD like '[A-Z][A-Z][0-9][0-9][0-9][0-9]')

ALTER TABLE HoaDon
ADD CONSTRAINT df_ngaylap DEFAULT GETDATE() FOR NgayLap
-----8. Thêm vào bảng Sản phẩm các ràng buộc
ALTER TABLE SanPham
ADD CHECK (SoLuongTon > 0 and SoLuongTon < 50)

ALTER TABLE SanPham
ADD CHECK (DonGiaNhap > 0)

ALTER TABLE SanPham
ADD CONSTRAINT df_ngaynhap DEFAULT GETDATE() FOR NgayNhap

ALTER TABLE SanPham
ADD CHECK (DVT like 'KG''Thùng''Hộp''Cái')

-----9. Dùng lệnh T-SQL nhập dữ liệu vào 4 table trên, dữ liệu tùy ý, chú ý các ràng buộc của mỗi table
INSERT INTO SanPham
    (Masp, TenSp, NgayNhap, DVT, SoLuongTon, DonGiaNhap)
VALUES
    ('SP01', 'Bánh gạo', '2023/10/12', 'Cái', 18, 20000),
	 ('SP02', 'Bánh mì', '2023/04/12', 'Thùng', 30, 2),
	  ('SP03', 'Kẹo vinamilk', '2023/01/11', 'Hộp', 10, 55000),
	  ('SP04', 'Mứt dừa', '2023/01/03', 'Kg', 13, 12000);

INSERT INTO KhachHang
    (MaKH, TenKh, DiaCHi, DienThoai)
VALUES
    ('KH01', 'Đặng Văn Tiên', 'Bình Định', '0946234654'),
	 ('KH02', 'Trương Hoàng Đoan Trang', 'Bình Dương', '0946234123'),
	  ('KH03', 'Đổ Huỳnh Phương Trinh', 'Tây Ninh', '0123567890'),
	   ('KH04', 'Nguyễn Lê Thảo Quyên', 'Đăk Nông', '0916789271'),
	    ('KH05', 'Lý Thị Quế Trân', 'Tiền Giang', '0829719271'),
		 ('KH06', 'Nguyễn Yến Như', 'Cà Mau', '0126542671');
Insert into HoaDon
values  ('HD01', '2023/02/15','2023/12/30','KH01','1'),
		('HD02', '2023/03/15','2023/03/30','KH02','2'),
		('HD03', '2023/04/15','2023/04/30','KH03','3'),
		('HD04', '2023/05/15','2023/05/30','KH04','4');


INSERT INTO ChiTietHD
    (MaHD, Masp,SoLuong)
VALUES
    ('HD01', 'SP01', 1),
	 ('HD02', 'SP02', 2),
	('HD03', 'SP02', 3),
	('HD04', 'SP04', 4);

