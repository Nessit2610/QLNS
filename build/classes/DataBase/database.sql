USE [QLNS]
GO
/****** Object:  Table [dbo].[DangKyLichNghi] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyLichNghi](
	[MaDKNghi] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[MaLoaiCa] [nvarchar](50) NULL,
	[NgayDK] [date] NULL,
	[Duyet] [int] NULL,
	[NguoiDuyet] [nvarchar](50) NULL,
	[LyDo] [text] NULL,
 CONSTRAINT [PK_DangKyLichNghi] PRIMARY KEY CLUSTERED 
(
	[MaDKNghi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinNhanVien]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinNhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[MaCV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[DVCT] [nvarchar](50) NULL,
	[ChucDanh] [nvarchar](50) NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[TrangThaiCongViec] [bit] NULL,
	[Anh] [varchar](255) NULL,
	[NgayVaoLam] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[SoTaiKhoanNhanVien] [varchar](50) NULL,
 CONSTRAINT [PK_ThongTinNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VDangKyLichNghi]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VDangKyLichNghi]
AS
SELECT dbo.DangKyLichNghi.MaDKNghi, dbo.DangKyLichNghi.MaNV, dbo.ThongTinNhanVien.TenNV, dbo.DangKyLichNghi.MaLoaiCa, dbo.DangKyLichNghi.NgayDK, dbo.DangKyLichNghi.Duyet, dbo.DangKyLichNghi.NguoiDuyet, 
                  dbo.DangKyLichNghi.LyDo
FROM     dbo.DangKyLichNghi INNER JOIN
                  dbo.ThongTinNhanVien ON dbo.DangKyLichNghi.MaNV = dbo.ThongTinNhanVien.MaNV
GO
/****** Object:  Table [dbo].[DangKyLichLam]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyLichLam](
	[MaDKLam] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[MaLoaiCa] [nvarchar](50) NULL,
	[NgayDK] [date] NULL,
 CONSTRAINT [PK_DangKyLichLam] PRIMARY KEY CLUSTERED 
(
	[MaDKLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TKeLuongTam]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TKeLuongTam]
(
    @thang INT,
    @nam INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT MaNV,datefromparts(@nam,@thang,1) as ThangNam, SUM(SoCaLam) AS TongSoCaLam, SUM(SoCaNghi) AS TongSoCaNghi
    FROM (
        SELECT dbo.ThongTinNhanVien.MaNV, COUNT(dbo.DangKyLichLam.NgayDK) AS SoCaLam, 0 AS SoCaNghi
        FROM dbo.ThongTinNhanVien
        INNER JOIN dbo.DangKyLichLam ON dbo.ThongTinNhanVien.MaNV = dbo.DangKyLichLam.MaNV
        WHERE MONTH(DangKyLichLam.NgayDK) = @thang AND YEAR(DangKyLichLam.NgayDK) = @nam
        GROUP BY dbo.ThongTinNhanVien.MaNV

        UNION ALL

        SELECT dbo.ThongTinNhanVien.MaNV, 0 AS SoCaLam, COUNT(dbo.DangKyLichNghi.NgayDK) AS SoCaNghi
        FROM dbo.ThongTinNhanVien
        INNER JOIN dbo.DangKyLichNghi ON dbo.ThongTinNhanVien.MaNV = dbo.DangKyLichNghi.MaNV
        WHERE MONTH(DangKyLichNghi.NgayDK) = @thang AND YEAR(DangKyLichNghi.NgayDK) = @nam AND DangKyLichNghi.Duyet = 3
        GROUP BY dbo.ThongTinNhanVien.MaNV
    ) AS SubQuery
    GROUP BY MaNV
);
GO
/****** Object:  UserDefinedFunction [dbo].[TKeLuongTam2]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[TKeLuongTam2]
(
    @thang INT,
    @nam INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT MaNV, 
           DATEFROMPARTS(@nam, @thang, 1) AS ThangNam, 
           TongSoCaLam, 
           SoCaNghiKhongPhep, 
           TongSoCaNghi
    FROM (
        SELECT MaNV, 
               SUM(SoCaLam) AS TongSoCaLam, 
               SUM(SoCaNghiKhongPhep) AS SoCaNghiKhongPhep, 
               SUM(TongSoCaNghi) AS TongSoCaNghi
        FROM (
            -- Truy vấn con để đếm số ca làm việc
            SELECT dbo.ThongTinNhanVien.MaNV, 
                   COUNT(dbo.DangKyLichLam.NgayDK) AS SoCaLam, 
                   0 AS SoCaNghiKhongPhep, 
                   0 AS TongSoCaNghi
            FROM dbo.ThongTinNhanVien
            INNER JOIN dbo.DangKyLichLam 
                    ON dbo.ThongTinNhanVien.MaNV = dbo.DangKyLichLam.MaNV
            WHERE MONTH(dbo.DangKyLichLam.NgayDK) = @thang 
                  AND YEAR(dbo.DangKyLichLam.NgayDK) = @nam
            GROUP BY dbo.ThongTinNhanVien.MaNV

            UNION ALL

            -- Truy vấn con để đếm số ngày nghỉ không phép
            SELECT dbo.ThongTinNhanVien.MaNV, 
                   0 AS SoCaLam, 
                   COUNT(dbo.DangKyLichNghi.NgayDK) AS SoCaNghiKhongPhep, 
                   0 AS TongSoCaNghi
            FROM dbo.ThongTinNhanVien
            INNER JOIN dbo.DangKyLichNghi 
                    ON dbo.ThongTinNhanVien.MaNV = dbo.DangKyLichNghi.MaNV
            WHERE MONTH(dbo.DangKyLichNghi.NgayDK) = @thang 
                  AND YEAR(dbo.DangKyLichNghi.NgayDK) = @nam 
                  AND dbo.DangKyLichNghi.Duyet = 3
            GROUP BY dbo.ThongTinNhanVien.MaNV

            UNION ALL

            -- Truy vấn con để đếm tổng số ngày nghỉ
            SELECT dbo.ThongTinNhanVien.MaNV,  
                   0 AS SoCaLam, 
                   0 AS SoCaNghiKhongPhep, 
                   COUNT(dbo.DangKyLichNghi.NgayDK) AS TongSoCaNghi
            FROM dbo.ThongTinNhanVien
            INNER JOIN dbo.DangKyLichNghi 
                    ON dbo.ThongTinNhanVien.MaNV = dbo.DangKyLichNghi.MaNV
            WHERE MONTH(dbo.DangKyLichNghi.NgayDK) = @thang 
                  AND YEAR(dbo.DangKyLichNghi.NgayDK) = @nam 
                  AND dbo.DangKyLichNghi.Duyet IN (1, 3)
            GROUP BY dbo.ThongTinNhanVien.MaNV
        ) AS SubQuery
        GROUP BY MaNV
    ) AS FinalSubQuery
);
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NULL,
	[avatar] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[fullname] [nvarchar](255) NULL,
	[gender] [bit] NOT NULL,
	[is_admin] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[password] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[is_male] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaCV] [nvarchar](50) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCa]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCa](
	[MaLoaiCa] [nvarchar](50) NOT NULL,
	[TenLoaiCa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiCa] PRIMARY KEY CLUSTERED 
(
	[MaLoaiCa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[total_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[phone] [nvarchar](255) NULL,
	[status] [int] NULL,
	[total_price] [float] NOT NULL,
	[username] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color_hex] [nvarchar](255) NULL,
	[color_name] [nvarchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color_id] [int] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NULL,
	[description] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[slug] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKeLuong]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeLuong](
	[MaThongKe] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[ThangNam] [date] NULL,
	[SoCaLam] [int] NULL,
	[SoCaNghi] [int] NULL,
	[Luong] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ThongKeLuong] PRIMARY KEY CLUSTERED 
(
	[MaThongKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKiThuat]    Script Date: 8/5/2024 9:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKiThuat](
	[Luong] [bigint] NULL,
	[SoCaLamMin] [int] NULL,
	[SoNVMotCaMin] [int] NULL,
	[SoNVMotCaMax] [int] NULL,
	[HSL] [float] NULL,
	[HSLOT] [float] NULL,
	[HSLPhat] [float] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV001', N'Admin')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV002', N'Qu?n l?')
INSERT [dbo].[ChucVu] ([MaCV], [TenCV]) VALUES (N'CV003', N'Nhân viên')
GO
SET IDENTITY_INSERT [dbo].[DangKyLichLam] ON 

INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (2, N'NV002', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (3, N'NV003', N'LC003', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (4, N'NV004', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (5, N'NV005', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (6, N'NV006', N'LC003', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (7, N'NV007', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (8, N'NV008', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (9, N'NV009', N'LC003', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (10, N'NV010', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (11, N'NV011', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (12, N'NV012', N'LC003', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (13, N'NV013', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (14, N'NV014', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (15, N'NV015', N'LC003', CAST(N'2024-04-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (16, N'NV016', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (17, N'NV017', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (18, N'NV018', N'LC003', CAST(N'2024-04-17' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (19, N'NV019', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (20, N'NV020', N'LC002', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (21, N'NV001', N'LC001', CAST(N'2024-04-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (25, N'NV018', N'LC001', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (26, N'NV018', N'LC003', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (27, N'NV018', N'LC002', CAST(N'2024-04-16' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (28, N'NV018', N'LC002', CAST(N'2024-04-18' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (73, N'NV018', N'LC001', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (74, N'NV018', N'LC001', CAST(N'2024-04-23' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (75, N'NV018', N'LC001', CAST(N'2024-04-24' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (76, N'NV018', N'LC001', CAST(N'2024-04-25' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (77, N'NV018', N'LC001', CAST(N'2024-04-26' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (78, N'NV018', N'LC001', CAST(N'2024-04-27' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (79, N'NV018', N'LC002', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (80, N'NV018', N'LC002', CAST(N'2024-04-23' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (81, N'NV018', N'LC002', CAST(N'2024-04-25' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (82, N'NV018', N'LC002', CAST(N'2024-04-26' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (83, N'NV018', N'LC002', CAST(N'2024-04-27' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (84, N'NV018', N'LC003', CAST(N'2024-04-22' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (85, N'NV018', N'LC003', CAST(N'2024-04-26' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (112, N'NV018', N'LC001', CAST(N'2024-05-03' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (113, N'NV018', N'LC001', CAST(N'2024-05-04' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (114, N'NV018', N'LC003', CAST(N'2024-05-02' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (115, N'NV018', N'LC003', CAST(N'2024-05-03' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (116, N'NV018', N'LC003', CAST(N'2024-05-04' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (119, N'NV020', N'LC003', CAST(N'2024-05-02' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (120, N'NV018', N'LC001', CAST(N'2024-05-20' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (121, N'NV018', N'LC001', CAST(N'2024-05-21' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (122, N'NV018', N'LC001', CAST(N'2024-05-22' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (123, N'NV018', N'LC002', CAST(N'2024-05-22' AS Date))
INSERT [dbo].[DangKyLichLam] ([MaDKLam], [MaNV], [MaLoaiCa], [NgayDK]) VALUES (124, N'NV018', N'LC003', CAST(N'2024-05-22' AS Date))
SET IDENTITY_INSERT [dbo].[DangKyLichLam] OFF
GO
SET IDENTITY_INSERT [dbo].[DangKyLichNghi] ON 

INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (1, N'NV001', N'LC001', CAST(N'2024-04-22' AS Date), 1, N'Lê Văn Tiến', N'a')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (2, N'NV002', N'LC002', CAST(N'2024-04-23' AS Date), 1, N'Tr?n Đ?i Quang', N'b')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (3, N'NV003', N'LC003', CAST(N'2024-04-24' AS Date), 0, NULL, N'c')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (4, N'NV004', N'LC001', CAST(N'2024-04-22' AS Date), 1, N'Lê Văn Tiến', N'd')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (5, N'NV005', N'LC002', CAST(N'2024-04-23' AS Date), 0, NULL, N'e')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (6, N'NV006', N'LC002', CAST(N'2024-04-23' AS Date), 0, NULL, N'f')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (7, N'NV007', N'LC002', CAST(N'2024-04-23' AS Date), 1, N'Ngô Tấn', N'g')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (8, N'NV008', N'LC002', CAST(N'2024-04-23' AS Date), 0, NULL, N'h')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (9, N'NV018', N'LC003', CAST(N'2024-04-20' AS Date), 0, N'Nguyen Dinh Tien', N'i')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (11, N'NV018', N'LC003', CAST(N'2024-04-20' AS Date), 0, N'Nguyen Dinh Tien', N'e')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (12, N'NV018', N'LC002', CAST(N'2024-04-23' AS Date), 0, NULL, N'f')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (13, N'NV018', N'LC001', CAST(N'2024-04-22' AS Date), 0, NULL, NULL)
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (14, N'NV018', N'LC001', CAST(N'2024-04-22' AS Date), 0, NULL, N'g')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (15, N'NV018', N'LC001', CAST(N'2024-04-22' AS Date), 0, NULL, N'DTien')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (16, N'NV018', N'LC002', CAST(N'2024-04-25' AS Date), 0, NULL, N'lydoconcac')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (17, N'NV018', N'LC001', CAST(N'2024-04-29' AS Date), 1, N'Ngô Tấn', N'abc')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (22, N'NV018', N'LC001', CAST(N'2024-05-01' AS Date), 3, N'Ngô Tấn', N'V?ng không phép')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (23, N'NV018', N'LC003', CAST(N'2024-05-01' AS Date), 2, N'Ngô Tấn', N'ABC')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (24, N'NV019', N'LC001', CAST(N'2024-04-29' AS Date), 2, N'Ngô Tấn', N'q')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (29, N'NV020', N'LC001', CAST(N'2024-05-01' AS Date), 3, N'Ngô Tấn', N'V?ng không phép')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (30, N'NV017', N'LC001', CAST(N'2024-04-29' AS Date), 3, N'Ngô Tấn', N'V?ng không phép')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (31, N'NV020', N'LC001', CAST(N'2024-04-29' AS Date), 3, N'Ngô Tấn', N'V?ng không phép')
INSERT [dbo].[DangKyLichNghi] ([MaDKNghi], [MaNV], [MaLoaiCa], [NgayDK], [Duyet], [NguoiDuyet], [LyDo]) VALUES (32, N'NV018', N'LC001', CAST(N'2024-05-02' AS Date), 2, N'Lê Văn Tiến', N'V?ng không phép')
SET IDENTITY_INSERT [dbo].[DangKyLichNghi] OFF
GO
INSERT [dbo].[LoaiCa] ([MaLoaiCa], [TenLoaiCa]) VALUES (N'LC001', N'Ca sáng')
INSERT [dbo].[LoaiCa] ([MaLoaiCa], [TenLoaiCa]) VALUES (N'LC002', N'Ca chiều')
INSERT [dbo].[LoaiCa] ([MaLoaiCa], [TenLoaiCa]) VALUES (N'LC003', N'Ca tối')
GO
SET IDENTITY_INSERT [dbo].[ThongKeLuong] ON 

INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (47, N'NV001', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (48, N'NV002', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (49, N'NV003', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (50, N'NV004', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (51, N'NV005', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (52, N'NV006', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (53, N'NV007', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (54, N'NV008', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (55, N'NV009', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (56, N'NV010', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (57, N'NV011', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (58, N'NV012', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (59, N'NV013', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (60, N'NV014', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (61, N'NV015', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (62, N'NV016', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (63, N'NV017', CAST(N'2024-04-01' AS Date), 2, 0, CAST(540000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (64, N'NV018', CAST(N'2024-04-01' AS Date), 18, 0, CAST(4860000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (65, N'NV019', CAST(N'2024-04-01' AS Date), 1, 0, CAST(270000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (66, N'NV020', CAST(N'2024-04-01' AS Date), 2, 0, CAST(540000 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (10067, N'NV018', CAST(N'2024-05-01' AS Date), 5, 2, CAST(3904344 AS Decimal(18, 0)))
INSERT [dbo].[ThongKeLuong] ([MaThongKe], [MaNV], [ThangNam], [SoCaLam], [SoCaNghi], [Luong]) VALUES (10068, N'NV020', CAST(N'2024-05-01' AS Date), 1, 1, CAST(670000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ThongKeLuong] OFF
GO
INSERT [dbo].[ThongSoKiThuat] ([Luong], [SoCaLamMin], [SoNVMotCaMin], [SoNVMotCaMax], [HSL], [HSLOT], [HSLPhat]) VALUES (300000, 24, 3, 5, 3, 3.7, 3.25)
GO
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV001', N'Lê Văn Tiến', N'CV001', CAST(N'1990-05-15' AS Date), 1, N'nva@example.com', N'0987654321', N'TeamDesign', N'Teammate', N'lvt', N'123', 1, N'assets/imgs/ProfileIMG/LeVanTien.JPG', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV002', N'Trần Đại Quang', N'CV001', CAST(N'1995-10-20' AS Date), 0, N'ttb@example.com', N'0123456789', N'TeamDesign', N'Teammate', N'quang', N'123', 1, N'assets/imgs/ProfileIMG/TranDaiQuang.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV003', N'Ngô Tấn', N'CV002', CAST(N'1992-07-08' AS Date), 1, N'lvc@example.com', N'0345678912', N'TeamDesign', N'Teammate', N'tan', N'123', 1, N'assets/imgs/ProfileIMG/NgoTan.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV004', N'Nguyễn Đắc Tịnh Tín', N'CV001', CAST(N'1993-12-25' AS Date), 1, N'ptd@example.com', N'0765432109', N'TeamDesign', N'Teammate', N'tin', N'123', 1, N'assets/imgs/ProfileIMG/NguyenDacTinhTin.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV005', N'Nguyễn Đình Tiến', N'CV003', CAST(N'1988-09-30' AS Date), 1, N'hve@example.com', N'0987654321', N'TeamDesign', N'Teammate', N'tien', N'123', 1, N'assets/imgs/ProfileIMG/NguyenDinhTien.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV006', N'Nguyễn Hoàng Quang Minh Thành', N'CV003', CAST(N'1991-04-18' AS Date), 1, N'dtf@example.com', N'0123456789', N'TeamDesign', N'Teammate', N'thanh', N'123', 1, N'assets/imgs/ProfileIMG/Thanh.JPG', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV007', N'Võ Văn Linh', N'CV003', CAST(N'1987-08-12' AS Date), 1, N'vvg@example.com', N'0345678912', N'TeamDesign', N'Teammate', N'vvg', N'g78910', 1, N'assets/imgs/ProfileIMG/VoVanLinh.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV008', N'Nguyễn Thị Huyền', N'CV003', CAST(N'1994-03-05' AS Date), 0, N'nth@example.com', N'0765432109', N'TeamDesign', N'Teammate', N'nth', N'h45678', 1, N'assets/imgs/ProfileIMG/NguyenThiHuyen.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV009', N'Trần Văn Linh', N'CV003', CAST(N'1989-06-28' AS Date), 1, N'tvi@example.com', N'0987654321', N'TeamDesign', N'Teammate', N'tvi', N'i23456', 0, N'assets/imgs/ProfileIMG/TranVanLinh.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV010', N'Lê Thị Thanh Thảo', N'CV003', CAST(N'1996-01-10' AS Date), 0, N'ltk@example.com', N'0123456789', N'TeamDesign', N'Teammate', N'ltk', N'k78901', 1, N'assets/imgs/ProfileIMG/LeThiThanhThao.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV011', N'Wonhee', N'CV003', CAST(N'1990-07-22' AS Date), 1, N'wonhee@example.com', N'0345678912', N'TeamDesign', N'Teammate', N'wonhee', N'123', 1, N'assets/imgs/ProfileIMG/wonhee.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV012', N'Mai Ăn Đấm', N'CV003', CAST(N'1993-02-17' AS Date), 0, N'mtm@example.com', N'0765432109', N'TeamDesign', N'Teammate', N'mtm', N'm12345', 0, N'assets/imgs/ProfileIMG/MaiAnDam.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV013', N'Đinh Văn Vở', N'CV003', CAST(N'1985-11-29' AS Date), 1, N'dvn@example.com', N'0987654321', N'TeamDesign', N'Teammate', N'dvn', N'n67890', 1, N'assets/imgs/ProfileIMG/DinhVanVo.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV014', N'Phạm Hay Ho', N'CV003', CAST(N'1992-08-03' AS Date), 0, N'pto@example.com', N'0123456789', N'TeamDesign', N'Teammate', N'pto', N'o54321', 1, N'assets/imgs/ProfileIMG/PhamHayHo.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV015', N'Trần Văn Pê', N'CV003', CAST(N'1997-05-27' AS Date), 1, N'tvp@example.com', N'0345678912', N'TeamDesign', N'Teammate', N'tvp', N'p78910', 0, N'assets/imgs/ProfileIMG/TranVanPe.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV016', N'Trần Trọc', N'CV003', CAST(N'1991-09-14' AS Date), 0, N'ltq@example.com', N'0765432109', N'TeamDesign', N'Teammate', N'ltq', N'q23456', 1, N'assets/imgs/ProfileIMG/TranTroc.jpeg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV017', N'Lê Văn Luyện', N'CV003', CAST(N'1986-04-08' AS Date), 1, N'vvr@example.com', N'0987654321', N'TeamDesign', N'Teammate', N'vvr', N'r67890', 1, N'assets/imgs/ProfileIMG/LeVanLuyen.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV018', N'Vũ Như Cẩn', N'CV003', CAST(N'1990-12-31' AS Date), 0, N'nts@example.com', N'0123456789', N'TeamDesign', N'Teammate', N'can', N'123', 1, N'assets/imgs/ProfileIMG/VuNhuCan.jpg', CAST(N'2024-04-01' AS Date), NULL, N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV019', N'Mai Thị Mốt', N'CV003', CAST(N'1988-06-25' AS Date), 1, N'tvt@example.com', N'0345678912', N'TeamDesign', N'Teammate', N'tvt', N't78910', 0, N'assets/imgs/ProfileIMG/MaiThiMot.jpg', CAST(N'2024-04-01' AS Date), CAST(N'2024-05-03' AS Date), N'0123456789')
INSERT [dbo].[ThongTinNhanVien] ([MaNV], [TenNV], [MaCV], [NgaySinh], [GioiTinh], [Email], [SDT], [DVCT], [ChucDanh], [TenDangNhap], [MatKhau], [TrangThaiCongViec], [Anh], [NgayVaoLam], [NgayKetThuc], [SoTaiKhoanNhanVien]) VALUES (N'NV020', N'Ba Thị Hai', N'CV003', CAST(N'1994-02-19' AS Date), 0, N'mtu@example.com', N'0765432109', N'TeamDesign', N'Teammate', N'mtu', N'u12345', 1, N'assets/imgs/ProfileIMG/BaThiHai.jpeg', CAST(N'2024-04-01' AS Date), NULL, NULL)
GO
ALTER TABLE [dbo].[DangKyLichLam]  WITH CHECK ADD  CONSTRAINT [FK_DangKyLichLam_LoaiCa] FOREIGN KEY([MaLoaiCa])
REFERENCES [dbo].[LoaiCa] ([MaLoaiCa])
GO
ALTER TABLE [dbo].[DangKyLichLam] CHECK CONSTRAINT [FK_DangKyLichLam_LoaiCa]
GO
ALTER TABLE [dbo].[DangKyLichLam]  WITH CHECK ADD  CONSTRAINT [FK_DangKyLichLam_ThongTinNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[ThongTinNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DangKyLichLam] CHECK CONSTRAINT [FK_DangKyLichLam_ThongTinNhanVien]
GO
ALTER TABLE [dbo].[DangKyLichNghi]  WITH CHECK ADD  CONSTRAINT [FK_DangKyLichNghi_LoaiCa] FOREIGN KEY([MaLoaiCa])
REFERENCES [dbo].[LoaiCa] ([MaLoaiCa])
GO
ALTER TABLE [dbo].[DangKyLichNghi] CHECK CONSTRAINT [FK_DangKyLichNghi_LoaiCa]
GO
ALTER TABLE [dbo].[DangKyLichNghi]  WITH CHECK ADD  CONSTRAINT [FK_DangKyLichNghi_ThongTinNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[ThongTinNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DangKyLichNghi] CHECK CONSTRAINT [FK_DangKyLichNghi_ThongTinNhanVien]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK4q98utpd73imf4yhttm3w0eax]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4] FOREIGN KEY([username])
REFERENCES [dbo].[accounts] ([username])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKk3cjfcgb621qhahps1tre43e4]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
ALTER TABLE [dbo].[ThongKeLuong]  WITH CHECK ADD  CONSTRAINT [FK_ThongKeLuong_ThongTinNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[ThongTinNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ThongKeLuong] CHECK CONSTRAINT [FK_ThongKeLuong_ThongTinNhanVien]
GO
ALTER TABLE [dbo].[ThongTinNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinNhanVien_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[ThongTinNhanVien] CHECK CONSTRAINT [FK_ThongTinNhanVien_ChucVu]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DangKyLichNghi"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ThongTinNhanVien"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 528
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDangKyLichNghi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDangKyLichNghi'
GO
