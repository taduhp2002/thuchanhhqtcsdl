--Câu 1--
Select * From Hangsx
Select * From Nhanvien
Select * From SanPham
Select * From Nhap
Select * From Xuat

--Câu 2--
Select * From SanPham
order by giaban desc

--Câu 3-- 
Select * From Sanpham
	inner join Hangsx on Hangsx.Mahangsx = Sanpham.mahangsx
	Where Hangsx.Tenhang = 'Samsung'

--Câu 4--
	Select * From Nhanvien
	Where Giotinh = N'Nữ' AND Phong = N'Kế toán'


--Câu 5--
Select a.Sohdn, b.masp,
	b.tensp, c.Tenhang,
	a.soluongN, a.dongiaN,
	a.soluongN * a.dongiaN as tiennhap,
	b.mausac, b.donvitinh, a.Ngaynhap,
	nv.Tennv, nv.Phong
	From Nhap a
	inner join Sanpham b ON a.masp = b.masp
	inner join Hangsx c ON b.mahangsx = c.mahangsx
	inner join Nhanvien nv ON a.Manv = nv.Manv
	order by tiennhap asc


--Câu 6--
	Select x.Sohdx, sp.masp, sp.tensp, hsx.Tenhang, x.soluongX, 
	x.soluongX * sp.giaban as tienxuat, 
	sp.mausac, sp.donvitinh, x.Ngayxuat,
	nv.Tennv, nv.Phong
	From Xuat x
	inner join Sanpham sp ON x.masp = sp.masp
	inner join Hangsx hsx ON sp.mahangsx = hsx.mahangsx
	inner join Nhanvien nv ON x.Manv = nv.Manv
	Where MONTH(x.Ngayxuat) = 10 AND YEAR(x.Ngayxuat) = 2018
	order by x.Sohdx asc


--Câu 7--
	Select np.Sohdn, sp.masp, sp.tensp, np.soluongN, np.dongiaN, np.Ngaynhap,
	nv.Tennv, nv.Phong
	From Nhap np
	inner join Sanpham sp ON np.masp = sp.masp
	inner join Hangsx hsx ON sp.mahangsx = hsx.mahangsx
	inner join Nhanvien nv ON np.Manv = nv.Manv
	Where hsx.Tenhang = 'Samsung' AND YEAR(np.Ngaynhap) = 2017
	order by np.Sohdn asc

 
--Câu 8--
	Select TOP 10* 
	From Xuat
	Where YEAR(Ngayxuat)=2018
	order by soluongX desc

 
--Câu 9--
	Select TOP 10*
	From Sanpham
	order by giaban desc


--Câu 10--
	Select * 
	From Sanpham sp
	inner join Hangsx sx on sx.mahangsx = sp.mahangsx
	Where sx.Tenhang ='Samsung' AND giaban between 100000 and 500000

 
--Câu 11--
	Select SUM(soluongN*dongiaN) as N'Tổng tiền đã nhập'
	From Nhap np
	inner join Sanpham sp on sp.masp = np.masp
	inner join Hangsx sx on sx.mahangsx = sp.mahangsx
	Where YEAR(np.Ngaynhap) = 2020 and sx.Tenhang = 'Samsung'

  
--Câu 12--
	Select SUM(soluongX*giaban) as N'Tổng tiền xuất'
	From Xuat x
	inner join Sanpham sp on sp.masp = x.masp
	Where x.Ngayxuat = '2018-09-02'

  
--Câu 13--
	Select TOP 1 tiennhap = soluongN*dongiaN, Sohdn, Ngaynhap
	From Nhap np
	Where YEAR(np.Ngaynhap) = 2018
	order by tiennhap desc

 
--Cấu 14--
	Select TOP 10  mahangsx, tensp, soluongN
	From Sanpham sp
	inner join Nhap np on sp.masp = np.masp
	order by soluongN desc

  
--Câu 15--
	Select sp.masp, sp.tensp
	From Sanpham sp
	inner join Hangsx sx on sx.mahangsx = sp.mahangsx
	inner join Nhap np on np.masp = sp.masp
	inner join Nhanvien nv on nv.Manv = np.Manv
	Where sx.Tenhang = 'Samsung' AND nv.Manv = 'NV01'

  
--Câu 16--
	Select np.Sohdn, sp.masp, np.soluongN, np.Ngaynhap
	From Nhap np
	inner join Sanpham sp on sp.masp = np.masp
	inner join Xuat x on x.masp = sp.masp
	inner join Nhanvien nv on nv.Manv = x.Manv
	Where sp.masp = 'SP05' AND nv.Manv = 'NV01'

  
--Câu 17--
	Select nv.Manv, nv.Tennv
	From Nhanvien nv
	inner join Xuat x on x.Manv = nv.Manv
	Where x.masp = 'SP02' AND x.Ngayxuat = '2020-02-03'
 