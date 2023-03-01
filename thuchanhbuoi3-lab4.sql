
use QuanLyDeAn
Create	table NHANVIEN
(
	HONV	nvarchar(15),
	TENLOT	nvarchar(15),
	TENNV	nvarchar(15) not null,
	MANV	char	(9) not null,
	NGSINH	Datetime,
	DCHI	nvarchar(30),
	PHAI	nvarchar(3),
	LUONG	float,
	MA_NQL	char(9),
	PHG	int,
	constraint PK_NHANVIEN primary key(MANV),
	
)

Create	table PHONGBAN
(
	TENPHG	nvarchar(15),
	MAPHG	int not null,
	TRPHG	char(9),
	NG_NHANCHUC Datetime
	constraint PK_PHONGBAN primary key(MAPHG)
)


Create table DIADIEM_PHG
(
	MAPHG	int,
	DIADIEM nvarchar(50)
	constraint PK_DIADIEM_PHG primary key (MAPHG, DIADIEM)
)

Create table DEAN
(
	TENDA	nvarchar(15),
	MADA	int,
	DDIEM_DA nvarchar(50),
	PHONG	int,
	constraint PK_DEAN primary key(MADA)
)

Create table CONGVIEC
(
	MADA int,
	STT  int,
	TEN_CONG_VIEC nvarchar(50),
	constraint PK_CONGVIEC primary key (MADA, STT)
	
)

Create table PHANCONG
(
	MA_NVIEN char(9),
	MADA	 int,
	THOIGIAN float,
	constraint PK_PHANCONG primary key (MA_NVIEN, MADA)
)

Create	table THANNHAN
(
	MA_NVIEN char(9),
	TENTN	 nvarchar(15),
	PHAI	 nvarchar(3),
	NGSINH	Datetime,
	QUANHE 	nvarchar(15),
	constraint PK_THANNHAN primary key (MA_NVIEN, TENTN) 
)

----------------------------------*tao khoa ngoai*---------------------------
--tao khoa ngoai cho bang NHANVIEN
alter table NHANVIEN
add 
constraint FK_NHANVIEN_NHANVIEN foreign key(MA_NQL) references NHANVIEN(MANV),
constraint FK_NHANVIEN_PHONGBAN foreign key(PHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang PHONGBAN
alter table PHONGBAN
add
constraint FK_PHONGBAN_NHANVIEN foreign key(TRPHG) references NHANVIEN(MANV)
--tao khoa ngoai cho bang DIADIEM_PHG
alter table DIADIEM_PHG
add
constraint FK_DIADIEMPHG_PHONGBAN foreign key(MAPHG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho bang DEAN
alter table DEAN
add
constraint FK_DEAN_PHONGBAN foreign key(PHONG) references PHONGBAN(MAPHG)
--tao khoa ngoai cho CONGVIEC
/*alter table CONGVIEC
add
constraint FK_CONGVIEC_DEAN foreign key(MADA) references DEAN(MADA)
--tao khoa ngoai cho PHANCONG
alter table PHANCONG
add
constraint FK_PHANCONG_CONGVIEC foreign key(MADA, STT) references CONGVIEC(MADA, STT)
--tao khoa ngoai cho THANNHAN
alter table THANNHAN
add
*/
alter table PHANCONG
add
constraint FK_PHANCONG_DEAN foreign key(MADA) references DEAN(MADA),
constraint FK_PHANCONG_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
alter table THANNHAN
add constraint FK_THANNHAN_NHANVIEN foreign key(MA_NVIEN) references NHANVIEN(MANV)
--------------------------Chen du lieu -------------------------------------------
insert into NHANVIEN values(N'Vương', N'Ngọc', N'Quyền', 
'006', '01/01/1965', N'45 Trưng Vương Hà Nội', N'Nữ', 5550000, null, null)

insert into NHANVIEN values(N'Nguyễn', N'Thanh', N'Tùng', 
'005', '20/08/1962', N'222 Nguyễn Văn Cừ TPHCM', N'Nam', 7000000, NULL, null) /*006*/

insert into NHANVIEN values(N'Lê', N'Thị', N'Nhàn', 
'001', '01/02/1967', N'291 Hồ Văn Huê TPHCM', N'Nữ', 4300000, NULL, null)/*006*/

insert into NHANVIEN values(N'Cao', N'Thanh', N'Huyền', 
'002', '01/02/1967', N'Quảng Ngãi', N'Nữ', 4300000, NULL, null)/*006*/

insert into NHANVIEN values(N'Nguyễn', N'Mạnh', N'Hùng', 
'004', '04/03/1967', N'95 Bà Rịa Vũng Tàu', N'Nam', 7800000, NULL, null)/*005*/

insert into NHANVIEN values(N'Trần', N'Thanh', N'Tâm', 
'003', '04/05/1957', N'34 Mai Thị Lựu TPHCM', N'Nam', 6250000, NULL, null) /*005*/

insert into NHANVIEN values(N'Bùi', N'Thúy', N'Bư', 
'007', '11/03/1954', N'332 Nguyễn Thái Học TPHCM', N'Nam', 12500000, NULL, null)/*001*/

insert into NHANVIEN values(N'Trần', N'Hồng', N'Quang', 
'008', '01/09/1967', N'80 Lê Hồng Phong TPHCM', N'Nam', 1250000, NULL, null) /*001*/

insert into NHANVIEN values(N'Đinh', N'Bá', N'Tiến', 
'009', '12/01/1960', N'119 Cống Quỳnh TPHCM', N'Nam', 3000000, NULL, null) /*005*/


-- nhap du lieu cho PHONGBAN

insert into PHONGBAN values(N'Nghiên Cứu', 5, '005', '22/05/1987')
insert into PHONGBAN values(N'Điều Hành', 4, '008', '01/01/1985')
insert into PHONGBAN values(N'Kế Toán', 2, '002', '01/01/1985')
insert into PHONGBAN values(N'Quản Lý', 1, '006', '19/06/1971')
SELECT * FROM PHONGBAN


--cap nhat du lieu cho bang DIADIEM_PHG

insert into DIADIEM_PHG values(1, 'TP HCM')
insert into DIADIEM_PHG values(4, 'HA NOI')
insert into DIADIEM_PHG values(5, 'VUNG TAU')



--cap nhat du lieu cho bang DEAN
insert into DEAN values(N'Sản phẩm X', 1, 'VUNG TAU', 5)
insert into DEAN values(N'Sản phẩm Y', 2, 'NHA TRANG', 5)
insert into DEAN values(N'Sản phẩm Z', 3, 'TP HCM', 5)
insert into DEAN values(N'Tin học hóa', 10, 'HA NOI', 4)
insert into DEAN values(N'Cap Quang', 20, 'TP HCM', 1)
insert into DEAN values(N'Đào Tạo', 30, 'HA NOI', 4)



--cap nhat du lieu cho bang CONGVIEC

insert into CONGVIEC values(1, 1, N'Thiết kế sản phẩm X')
insert into CONGVIEC values(1, 2, N'Thử nghiệm sản phẩm X')
insert into CONGVIEC values(2, 1, N'Sản xuất sản phẩm Y')
insert into CONGVIEC values(2, 2, N'Quảng cáo sản phẩm Y')
insert into CONGVIEC values(3, 1, N'Khuyến mãi sản phẩm Z')
insert into CONGVIEC values(10, 1, N'Tin học hóa nhân sự tiền lương')
insert into CONGVIEC values(10, 2, N'Tin học hóa phòng kinh doanh')
insert into CONGVIEC values(20, 1, N'lắp đặt cáp quang')
insert into CONGVIEC values(30, 1, N'Đào tạo nhân viên maketing')
insert into CONGVIEC values(30, 2, N'Đào tạo chuyên viên thiết kế')



--cap nhat du lieu cho bang THANNHAN
insert into THANNHAN values('005', N'Quang', N'Nữ', '05/04/1976', N'Con gái')
insert into THANNHAN values('005', N'Khang', N'Nam', '25/10/1973', N'Con trai')
insert into THANNHAN values('005', N'Dương', N'Nữ', '03/05/1948', N'Vợ chồng')
insert into THANNHAN values('001', N'Đăng', N'Nam', '19/02/1932', N'Vợ chồng')
insert into THANNHAN values('009', N'Duy', N'Nam', '01/01/1978', N'Con trai')
insert into THANNHAN values('009', N'Châu', N'Nữ', '30/12/1978', N'Con gái')
insert into THANNHAN values('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')



--chen du lieu cho bang PHANCONG
insert into PHANCONG values('009', 1, 32)
insert into PHANCONG values('009', 2, 8)
insert into PHANCONG values('004', 3, 40)
insert into PHANCONG values('003', 1, 20)
insert into PHANCONG values('003', 2, 20)
insert into PHANCONG values('008', 10,35)
insert into PHANCONG values('008', 30,5)
insert into PHANCONG values('001', 30,20)
insert into PHANCONG values('001', 20,15)
insert into PHANCONG values('006', 20,30)
insert into PHANCONG values('005', 3, 10)
insert into PHANCONG values('005', 10,10)
insert into PHANCONG values('005', 20,10)
insert into PHANCONG values('007', 30,30)
insert into PHANCONG values('007', 10,10)

--Câu 1:
select *
from NHANVIEN
--Câu 2:
select MANV, HONV, TENLOT, TENNV
from NHANVIEN 
where PHG = 5
--Câu 3:
select MANV, HONV, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6000000
--Câu 4:
select MANV, HONV, TENLOT, TENNV, LUONG, PHG
from NHANVIEN 
where LUONG > 6500000 and PHG = 1 or LUONG > 5000000 and PHG = 4
--câu 5:
select MANV, HONV, TENLOT, TENNV
from NHANVIEN , DIADIEM_PHG
where NHANVIEN.PHG = DIADIEM_PHG.MAPHG and DIADIEM_PHG.DIADIEM = 'QUANG NGAI'

select *
from NHANVIEN
--Câu 6:
select HONV + ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
from NHANVIEN
where NHANVIEN.HONV like N'N%'
--Câu 7
select NGSINH,DCHI
	from NHANVIEN
	where HONV = N'Cao' and TENLOT=N'Thanh' and TENNV=N'Huyền'
--Câu 8:
select *
	from NHANVIEN
	where Year(NGSINH) Between 1955 and 1975
--Câu 9:
select TENNV,Year(NGSINH) as 'Năm sinh'
	from NHANVIEN
--Câu 10
select TENNV,Year(getdate())-Year(NGSINH) as 'Tuổi'
	from NHANVIEN
--Câu 11:
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên Trưởng Phòng'
	from PHONGBAN,NHANVIEN
	where PHONGBAN.TRPHG=NHANVIEN.MANV
--Câu 12:
select TENNV,DCHI
	from PHONGBAN,NHANVIEN
	where PHONGBAN.MAPHG = NHANVIEN.PHG and TENPHG like N'Điều hành'

	select*
	from phongban
--Câu 13:
select TENDA,TENPHG,HONV,TENNV
	from NHANVIEN,PHONGBAN,DEAN
	where NHANVIEN.MANV = PHONGBAN.TRPHG and PHONGBAN.MAPHG = DEAN.PHONG and DEAN.DDIEM_DA like N'Quảng Ngãi'

	select*
	from phongban
	select*
	from DEAN
--Câu 14:
select TENNV,TENTN
	from NHANVIEN,THANNHAN
	where NHANVIEN.MANV = THANNHAN.MA_NVIEN and NHANVIEN.PHAI like N'Nữ'
--Câu 15
select nv.HONV+ ' ' +nv.TENLOT+ ' ' +nv.TENNV as 'Họ Và Tên nv',ql.HONV+ ' ' +ql.TENLOT+ ' ' +ql.TENNV as 'Họ Và Tên Quản Lí'
	from NHANVIEN nv,NHANVIEN ql
	where nv.MA_NQL=ql.MANV
--Câu 16
select HONV+ ' ' + TENLOT + ' ' + TENNV as 'Họ và tên' 
from NHANVIEN inner join DEAN ON NHANVIEN.PHG = DEAN.PHONG
where DEAN.TENDA= 'Xây dựng nhà máy chế biến thủy sản'
--Câu 17
select DEAN.TENDA
	from NHANVIEN,PHANCONG,DEAN
	where NHANVIEN.MANV = PHANCONG.MA_NVIEN and PHANCONG.MADA= DEAN.MADA and HONV = N'Trần' and TENLOT=N'Thanh' and TENNV=N'Tâm'