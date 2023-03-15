--Câu 1
CREATE PROCEDURE spTangLuong @Phan_tram int
as
  declare @Ty_le decimal(3,1) = 1 +@Phan_tram/100
  update NHANVIEN set LUONG = LUONG*@Ty_le
  go
  --Gọi thực hiện thủ tục
EXEC spTangLuong @Phan_tram = 10
-- câu 2
ALTER TABLE NHANVIEN ADD NgayNghiHuu DATE;
go
CREATE PROCEDURE spNghiHuu
AS 
BEGIN
    UPDATE NHANVIEN
    SET NgayNghiHuu = DATEADD(YEAR, CASE WHEN PHAI = 'Nam' THEN 60 ELSE 55 END, NGSINH)
    WHERE DATEDIFF(YEAR, NgSinh, GETDATE()) >= CASE WHEN PHAI = 'Nam' THEN 60 ELSE 55 END
END
-- câu 3:
go
CREATE PROCEDURE spXemDeAn
    @DiaDiemDeAn nvarchar(50)
AS 
BEGIN
    SELECT *
    FROM DEAN
    WHERE DDIEM_DA = @DiaDiemDeAn
END
go
--câu 4

CREATE PROCEDURE spCapNhatDeAn @diadiem_cu NVARCHAR(255), @diadiem_moi NVARCHAR(255)
AS
BEGIN
    UPDATE DeAn
    SET DDIEM_DA = @diadiem_moi
    WHERE DDIEM_DA = @diadiem_cu
END;

EXEC spCapNhatDeAn @diadiem_cu = N'<địa điểm cũ>', @diadiem_moi = N'<địa điểm mới>';

--câu 5

CREATE PROCEDURE spThemDA
   @TENDA NVARCHAR(15),
    @MADA int,
   @DDIEM_DA NVARCHAR(50),
   @MaPhongBan INT
 
AS
BEGIN
   SET NOCOUNT ON;
   INSERT INTO DEAN (TENDA, MADA,DDIEM_DA)
   VALUES (@TENDA,@MADA,@DDIEM_DA);
END;
--câu 6
    CREATE PROCEDURE spThemDeAn
    @MaDeAn INT,
    @TenDeAn NVARCHAR(50),
    @MoTa NVARCHAR(255),
	@MaPhong INT
AS
BEGIN
    IF EXISTS (SELECT * FROM DEAN WHERE MADA = @MADA)
    BEGIN
        RAISERROR ('Mã đề án đã tồn tại, đề nghị chọn mã đề án khác', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT * FROM PHONGBAN WHERE MAPHG = @MAPHG)
    BEGIN
        RAISERROR ('Mã phòng không tồn tại', 16, 1);
        RETURN;
    END

    INSERT INTO DEAN (MADA, TENDA,DDIEM_DA)
    VALUES (@MADA, @TENDA, @DDIEM_DA)
END
-- Trường hợp hợp lệ:
EXEC spThemDA  'Đề án A', 22, 'châu thành';