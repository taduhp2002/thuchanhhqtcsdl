USE [master]
GO
/****** Object:  Database [QLBanHang]    Script Date: 3/29/2023 9:47:05 AM ******/
CREATE DATABASE [QLBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLBanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QLBanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLBanHang] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanHang] SET QUERY_STORE = OFF
GO
USE [QLBanHang]
GO
/****** Object:  Table [dbo].[Hangsx]    Script Date: 3/29/2023 9:47:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsx](
	[mahangsx] [nchar](10) NOT NULL,
	[Tenhang] [nvarchar](20) NULL,
	[Diachi] [nvarchar](30) NULL,
	[Sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[mahangsx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhanvien]    Script Date: 3/29/2023 9:47:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhanvien](
	[Manv] [nchar](10) NOT NULL,
	[Tennv] [nvarchar](20) NULL,
	[Giotinh] [nchar](10) NULL,
	[Diachi] [nvarchar](30) NULL,
	[Sodt] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[Phong] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nhap]    Script Date: 3/29/2023 9:47:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nhap](
	[Sohdn] [nchar](10) NOT NULL,
	[masp] [nchar](10) NOT NULL,
	[Manv] [nchar](10) NULL,
	[Ngaynhap] [date] NULL,
	[soluongN] [int] NULL,
	[dongiaN] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sohdn] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/29/2023 9:47:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[masp] [nchar](10) NOT NULL,
	[mahangsx] [nchar](10) NULL,
	[tensp] [nvarchar](20) NULL,
	[soluong] [int] NULL,
	[mausac] [nvarchar](20) NULL,
	[giaban] [money] NULL,
	[donvitinh] [nchar](10) NULL,
	[mota] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xuat]    Script Date: 3/29/2023 9:47:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xuat](
	[Sohdx] [nchar](10) NOT NULL,
	[masp] [nchar](10) NOT NULL,
	[Manv] [nchar](10) NULL,
	[Ngayxuat] [date] NULL,
	[soluongX] [int] NULL,
 CONSTRAINT [PK__Xuat__1866FE23F73FF57D] PRIMARY KEY CLUSTERED 
(
	[Sohdx] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Hangsx] ([mahangsx], [Tenhang], [Diachi], [Sodt], [email]) VALUES (N'H01       ', N'Samsung', N'Korea', N'011-08271717', N'ss@gmail.com.kr')
INSERT [dbo].[Hangsx] ([mahangsx], [Tenhang], [Diachi], [Sodt], [email]) VALUES (N'H02       ', N'OPPO', N'China', N'081-08626262', N'oppo@gmail.com.cn')
INSERT [dbo].[Hangsx] ([mahangsx], [Tenhang], [Diachi], [Sodt], [email]) VALUES (N'H03       ', N'Vinfone', N'Việt Nam', N'084-098262626', N'vf@gmail.com.vn')
GO
INSERT [dbo].[Nhanvien] ([Manv], [Tennv], [Giotinh], [Diachi], [Sodt], [email], [Phong]) VALUES (N'NV01      ', N'Nguyễ
n
Thị
Thu', N'Nữ        ', N'Hà Nội', N'09826265
21', N'thu@gmail.co
m', N'Kế toán')
INSERT [dbo].[Nhanvien] ([Manv], [Tennv], [Giotinh], [Diachi], [Sodt], [email], [Phong]) VALUES (N'NV02      ', N'Lê
 Văn 
Nam', N'Nam       ', N'Bắc Ninh', N'09725252
52', N'nam@gmail.com', N'Vật tư')
INSERT [dbo].[Nhanvien] ([Manv], [Tennv], [Giotinh], [Diachi], [Sodt], [email], [Phong]) VALUES (N'NV03      ', N'Trần 
Hòa 
Bình', N'Nữ        ', N'Hà Nội', N'0328388388', N'binh@gmail.com', N'Kế toán')
GO
INSERT [dbo].[Nhap] ([Sohdn], [masp], [Manv], [Ngaynhap], [soluongN], [dongiaN]) VALUES (N'N01       ', N'SP02      ', N'NV01      ', CAST(N'2019-02-05' AS Date), 10, 17000000.0000)
INSERT [dbo].[Nhap] ([Sohdn], [masp], [Manv], [Ngaynhap], [soluongN], [dongiaN]) VALUES (N'N02       ', N'SP01      ', N'NV02      ', CAST(N'2020-04-07' AS Date), 30, 6000000.0000)
INSERT [dbo].[Nhap] ([Sohdn], [masp], [Manv], [Ngaynhap], [soluongN], [dongiaN]) VALUES (N'N03       ', N'SP04      ', N'NV02      ', CAST(N'2020-05-17' AS Date), 20, 1200000.0000)
INSERT [dbo].[Nhap] ([Sohdn], [masp], [Manv], [Ngaynhap], [soluongN], [dongiaN]) VALUES (N'N04       ', N'SP01      ', N'NV03      ', CAST(N'2020-03-22' AS Date), 10, 6200000.0000)
INSERT [dbo].[Nhap] ([Sohdn], [masp], [Manv], [Ngaynhap], [soluongN], [dongiaN]) VALUES (N'N05       ', N'SP05      ', N'NV01      ', CAST(N'2020-07-07' AS Date), 20, 7000000.0000)
GO
INSERT [dbo].[SanPham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP01      ', N'H02       ', N'F1 Plus', 100, N'Xám', 7000000.0000, N'Chiếc     ', N'Hàng cận cao cấp')
INSERT [dbo].[SanPham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP02      ', N'H01       ', N'Galaxy 
Note 1
1', 50, N'Đỏ', 19000000.0000, N'Chiếc     ', N'Hàng cao cấp')
INSERT [dbo].[SanPham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP03      ', N'H02       ', N'F3 lite', 200, N'Nâu', 3000000.0000, N'Chiếc     ', N'Hàng phổ thông')
INSERT [dbo].[SanPham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP04      ', N'H03       ', N'Vjoy3', 200, N'Xám', 1500000.0000, N'Chiếc     ', N'Hàng phổ thông')
INSERT [dbo].[SanPham] ([masp], [mahangsx], [tensp], [soluong], [mausac], [giaban], [donvitinh], [mota]) VALUES (N'SP05      ', N'H01       ', N'Galaxy V21', 500, N'Nâu', 8000000.0000, N'Chiếc     ', N'Hàng cận cao cấp')
GO
INSERT [dbo].[Xuat] ([Sohdx], [masp], [Manv], [Ngayxuat], [soluongX]) VALUES (N'X01       ', N'SP03      ', N'NV02      ', CAST(N'2020-06-14' AS Date), 5)
INSERT [dbo].[Xuat] ([Sohdx], [masp], [Manv], [Ngayxuat], [soluongX]) VALUES (N'X02       ', N'SP01      ', N'NV03      ', CAST(N'2019-03-05' AS Date), 3)
INSERT [dbo].[Xuat] ([Sohdx], [masp], [Manv], [Ngayxuat], [soluongX]) VALUES (N'X03       ', N'SP02      ', N'NV01      ', CAST(N'2020-12-12' AS Date), 1)
INSERT [dbo].[Xuat] ([Sohdx], [masp], [Manv], [Ngayxuat], [soluongX]) VALUES (N'X04       ', N'SP03      ', N'NV02      ', CAST(N'2020-06-02' AS Date), 2)
INSERT [dbo].[Xuat] ([Sohdx], [masp], [Manv], [Ngayxuat], [soluongX]) VALUES (N'X05       ', N'SP05      ', N'NV01      ', CAST(N'2020-05-18' AS Date), 1)
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD FOREIGN KEY([Manv])
REFERENCES [dbo].[Nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[Nhap]  WITH CHECK ADD FOREIGN KEY([masp])
REFERENCES [dbo].[SanPham] ([masp])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Hangsx] FOREIGN KEY([mahangsx])
REFERENCES [dbo].[Hangsx] ([mahangsx])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Hangsx]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK__Xuat__Manv__440B1D61] FOREIGN KEY([Manv])
REFERENCES [dbo].[Nhanvien] ([Manv])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK__Xuat__Manv__440B1D61]
GO
ALTER TABLE [dbo].[Xuat]  WITH CHECK ADD  CONSTRAINT [FK__Xuat__masp__4316F928] FOREIGN KEY([masp])
REFERENCES [dbo].[SanPham] ([masp])
GO
ALTER TABLE [dbo].[Xuat] CHECK CONSTRAINT [FK__Xuat__masp__4316F928]
GO
USE [master]
GO
ALTER DATABASE [QLBanHang] SET  READ_WRITE 
GO
