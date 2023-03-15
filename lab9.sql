
--câu 1
CREATE TRIGGER trg_NHANVIEN_Update_TenNV
ON NHANVIEN
AFTER UPDATE
AS
BEGIN
    IF UPDATE(TenNV)
    BEGIN
        RAISERROR ('Không được phép cập nhật',16,1)
        ROLLBACK TRANSACTION
    END
END
GO
--Câu 2

