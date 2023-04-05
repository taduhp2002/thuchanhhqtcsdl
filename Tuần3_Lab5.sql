GO
USE QLBanhang
GO


--Câu 1--
GO
CREATE FUNCTION FN_1 (@masp VARCHAR(50))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @hangsx VARCHAR(50)
    SELECT @hangsx = h.Tenhang
    FROM Sanpham s
    JOIN Hangsx h ON s.mahangsx = h.mahangsx
    WHERE s.masp = @masp

    RETURN @hangsx
END
GO
GO
SELECT dbo.FN_1('SP01')
GO

--Câu 2--
GO
CREATE FUNCTION FN_2 (@x INT, @y INT)
RETURNS MONEY
AS
BEGIN
    DECLARE @TongGiaTriNhap MONEY
    SELECT @TongGiaTriNhap = SUM(dongiaN * soluongN)
    FROM Nhap
    WHERE YEAR(ngaynhap) BETWEEN @x AND @y
    RETURN @TongGiaTriNhap
END
GO
GO
SELECT dbo.FN_2(2016,2019)
GO


--Câu 3--
GO 
CREATE FUNCTION FN_3(@tenSanPham nvarchar(50), @nam int)
RETURNS int
AS
BEGIN
    DECLARE @soLuongNhap int, @soLuongXuat int, @soLuongThayDoi int;
    SELECT @soLuongNhap = SUM(soluongN) FROM Nhap n JOIN Sanpham sp ON n.masp = sp.masp WHERE sp.tensp = @tenSanPham AND YEAR(n.ngaynhap) = @nam;
    SELECT @soLuongXuat = SUM(soluongX) FROM Xuat x JOIN Sanpham sp ON x.masp = sp.masp WHERE sp.tensp = @tenSanPham AND YEAR(x.ngayxuat) = @nam;
    SET @soLuongThayDoi = @soLuongNhap - @soLuongXuat;
    RETURN @soLuongThayDoi;
END
GO
GO
SELECT dbo.FN_3('Galaxy Note 11',2020)
GO

--Câu 4--
GO
CREATE FUNCTION dbo.FN_4(
    @ngay_bat_dau DATE,
    @ngay_ket_thuc DATE
)
RETURNS MONEY
AS
BEGIN
    DECLARE @tong_gia_tri_nhap MONEY;
    SELECT @tong_gia_tri_nhap = SUM(nhap.soluongN * sanpham.giaban)
    FROM Nhap AS nhap
    INNER JOIN Sanpham AS sanpham ON nhap.masp = sanpham.masp
    WHERE nhap.ngaynhap >= @ngay_bat_dau AND nhap.ngaynhap <= @ngay_ket_thuc;
    RETURN @tong_gia_tri_nhap;
END;
GO
GO
SELECT dbo.FN_4('2018-01-01', '2020-12-31') AS TongGiaTriNhap;
GO

--Câu 5--
GO
CREATE FUNCTION FN_5(@tenHang NVARCHAR(20), @nam INT)
RETURNS MONEY
AS
BEGIN
  DECLARE @tongGiaTriXuat MONEY;
  SELECT @tongGiaTriXuat = SUM(S.giaban * X.soluongX)
  FROM Xuat X
  JOIN Sanpham S ON X.masp = S.masp
  JOIN Hangsx H ON S.mahangsx = H.mahangsx
  WHERE H.tenhang = @tenHang AND YEAR(X.ngayxuat) = @nam;
  RETURN @tongGiaTriXuat;
END;
GO
GO
SELECT dbo.FN_5(N'Samsung', 2020) AS 'TongGiaTriXuat';
GO

--Câu 6--
GO
CREATE FUNCTION FN_6 (@tenPhong NVARCHAR(30))
RETURNS TABLE
AS
RETURN
    SELECT phong, COUNT(manv) AS soLuongNhanVien
    FROM Nhanvien
    WHERE phong = @tenPhong
    GROUP BY phong;
GO
GO
SELECT * FROM FN_6(N'Kế toán')
GO

--Câu 7--
GO
CREATE FUNCTION FN_7(@ten_sp NVARCHAR(20), @ngay_xuat DATE)
RETURNS INT
AS
BEGIN
  DECLARE @so_luong_xuat INT
  SELECT @so_luong_xuat = SUM(soluongX)
  FROM Xuat x JOIN Sanpham sp ON x.masp = sp.masp
  WHERE sp.tensp = @ten_sp AND x.ngayxuat = @ngay_xuat
  RETURN @so_luong_xuat
END
GO
GO
SELECT dbo.FN_7('OPPO', '2020-06-14')
GO

--Câu 8--
GO
CREATE FUNCTION FN_8 (@sohdx NCHAR(10))
RETURNS NVARCHAR(20)
AS
BEGIN
  DECLARE @sdt NVARCHAR(20)
  SELECT @sdt = Nhanvien.sodt
  FROM Nhanvien
  INNER JOIN Xuat ON Nhanvien.manv = Xuat.manv
  WHERE Xuat.sohdx = @sohdx
  RETURN @sdt
END
GO
GO
SELECT dbo.FN_8('X02')
GO

--Câu9--
GO
CREATE FUNCTION FN_9(@tenSP NVARCHAR(20), @nam INT)
RETURNS INT
AS
BEGIN
  DECLARE @tongNhapXuat INT;
  SET @tongNhapXuat = (
  SELECT COALESCE(SUM(nhap.soluongN), 0) + COALESCE(SUM(xuat.soluongX), 0) AS tongSoLuong
    FROM Sanpham sp
    LEFT JOIN Nhap nhap ON sp.masp = nhap.masp
    LEFT JOIN Xuat xuat ON sp.masp = xuat.masp
    WHERE sp.tensp = @tenSP AND YEAR(nhap.ngaynhap) = @nam AND YEAR(xuat.ngayxuat) = @nam
  );
  RETURN @tongNhapXuat;
END;
GO
GO
SELECT dbo.FN_9('Galaxy V21', 2020) AS TongNhapXuat;
GO

--Câu10--
GO
CREATE FUNCTION FN_10(@tenhang NVARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @soluong INT;

    SELECT @soluong = SUM(soluong)
    FROM Sanpham sp JOIN Hangsx hs ON sp.mahangsx = hs.mahangsx
    WHERE hs.tenhang = @tenhang;

    RETURN @soluong;
END;
GO
GO
SELECT dbo.FN_10('OPPO') AS 'Tổng số lượng sản phẩm của hãng'
GO
