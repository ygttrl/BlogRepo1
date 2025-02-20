USE [master]
GO
/****** Object:  Database [BlogDb]    Script Date: 12.03.2020 22:15:40 ******/
CREATE DATABASE [BlogDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BlogDb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BlogDb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BlogDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BlogDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BlogDb] SET  MULTI_USER 
GO
ALTER DATABASE [BlogDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlogDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BlogDb] SET QUERY_STORE = OFF
GO
USE [BlogDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BlogDb]
GO
/****** Object:  Table [dbo].[Etiket]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EtiketAd] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Etiket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtiketMakale]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtiketMakale](
	[MakaleId] [int] NOT NULL,
	[EtiketId] [int] NOT NULL,
 CONSTRAINT [PK_EtiketMakale] PRIMARY KEY CLUSTERED 
(
	[MakaleId] ASC,
	[EtiketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](10) NOT NULL,
	[Sifre] [nvarchar](10) NOT NULL,
	[isim] [nvarchar](50) NULL,
	[Soyisim] [nvarchar](50) NULL,
	[YetkiId] [int] NOT NULL,
	[KayitTarihi] [datetime] NOT NULL,
	[email] [nvarchar](150) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makale]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](150) NOT NULL,
	[icerik] [nvarchar](max) NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[KategoriId] [int] NOT NULL,
 CONSTRAINT [PK_Makale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetki]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetki](
	[YetkiId] [int] IDENTITY(1,1) NOT NULL,
	[YetkiAdi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Yetki] PRIMARY KEY CLUSTERED 
(
	[YetkiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorum]    Script Date: 12.03.2020 22:15:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[YorumIcerik] [nvarchar](max) NOT NULL,
	[KullaniciId] [int] NOT NULL,
	[MakaleId] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
 CONSTRAINT [PK_Yorum] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Etiket] ON 

INSERT [dbo].[Etiket] ([id], [EtiketAd]) VALUES (1, N'turev')
INSERT [dbo].[Etiket] ([id], [EtiketAd]) VALUES (2, N' limit')
INSERT [dbo].[Etiket] ([id], [EtiketAd]) VALUES (3, N' foksiyonlar')
INSERT [dbo].[Etiket] ([id], [EtiketAd]) VALUES (5, N'vvv')
INSERT [dbo].[Etiket] ([id], [EtiketAd]) VALUES (6, N' yyyy')
SET IDENTITY_INSERT [dbo].[Etiket] OFF
INSERT [dbo].[EtiketMakale] ([MakaleId], [EtiketId]) VALUES (2, 1)
INSERT [dbo].[EtiketMakale] ([MakaleId], [EtiketId]) VALUES (2, 2)
INSERT [dbo].[EtiketMakale] ([MakaleId], [EtiketId]) VALUES (2, 3)
INSERT [dbo].[EtiketMakale] ([MakaleId], [EtiketId]) VALUES (9, 5)
INSERT [dbo].[EtiketMakale] ([MakaleId], [EtiketId]) VALUES (9, 6)
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (1, N'Bilim')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (2, N'Sanat')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (3, N'Oyun')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (4, N'Eğitim')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (5, N'Siyaset')
INSERT [dbo].[Kategori] ([KategoriId], [KategoriAdi]) VALUES (6, N'Tarih')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([id], [KullaniciAdi], [Sifre], [isim], [Soyisim], [YetkiId], [KayitTarihi], [email]) VALUES (2, N'Yigit', N'123', N'Yigit', N'Tirali', 4, CAST(N'2017-07-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Kullanici] ([id], [KullaniciAdi], [Sifre], [isim], [Soyisim], [YetkiId], [KayitTarihi], [email]) VALUES (3, N'Ayse', N'000', N'Ayse', N'Mutlu', 3, CAST(N'2017-07-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Kullanici] ([id], [KullaniciAdi], [Sifre], [isim], [Soyisim], [YetkiId], [KayitTarihi], [email]) VALUES (4, N'Ahmet', N'000', N'Ahmet', N'Soyisim', 2, CAST(N'2020-03-12T21:47:49.997' AS DateTime), NULL)
INSERT [dbo].[Kullanici] ([id], [KullaniciAdi], [Sifre], [isim], [Soyisim], [YetkiId], [KayitTarihi], [email]) VALUES (5, N'Fatma', N'000', N'Fatma', N'Soyisim', 1, CAST(N'2020-03-12T21:48:13.400' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[Makale] ON 

INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (1, N'Blog Sitesi Yapımı', N'ViewBag1', 2, CAST(N'2017-07-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (2, N'Matematik', N'Türev  İntegral', 2, CAST(N'2017-07-12T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (4, N'Deneme', N'İçerik Deneme', 2, CAST(N'2020-03-10T00:13:11.880' AS DateTime), 1)
INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (8, N'Deneme', N'ViewBag45', 2, CAST(N'2020-03-12T21:37:14.390' AS DateTime), 1)
INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (9, N'aaa', N'bbbbbbbbbaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2, CAST(N'2020-03-12T21:38:27.927' AS DateTime), 3)
INSERT [dbo].[Makale] ([id], [Baslik], [icerik], [KullaniciId], [Tarih], [KategoriId]) VALUES (11, N'Deneme', N'Deneme içerik', 5, CAST(N'2020-03-12T21:50:51.270' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Makale] OFF
SET IDENTITY_INSERT [dbo].[Yetki] ON 

INSERT [dbo].[Yetki] ([YetkiId], [YetkiAdi]) VALUES (1, N'Kullanıcı')
INSERT [dbo].[Yetki] ([YetkiId], [YetkiAdi]) VALUES (2, N'Moderatör')
INSERT [dbo].[Yetki] ([YetkiId], [YetkiAdi]) VALUES (3, N'Admin')
INSERT [dbo].[Yetki] ([YetkiId], [YetkiAdi]) VALUES (4, N'SuperAdmin')
SET IDENTITY_INSERT [dbo].[Yetki] OFF
SET IDENTITY_INSERT [dbo].[Yorum] ON 

INSERT [dbo].[Yorum] ([id], [YorumIcerik], [KullaniciId], [MakaleId], [Tarih]) VALUES (7, N'Yorum ', 3, 1, CAST(N'2020-03-12T21:42:06.620' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yorum] OFF
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_Kullanici_YetkiId]  DEFAULT ((1)) FOR [YetkiId]
GO
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_Kullanici_KayitTarihi]  DEFAULT (getdate()) FOR [KayitTarihi]
GO
ALTER TABLE [dbo].[EtiketMakale]  WITH CHECK ADD  CONSTRAINT [FK_EtiketMakale_Etiket] FOREIGN KEY([EtiketId])
REFERENCES [dbo].[Etiket] ([id])
GO
ALTER TABLE [dbo].[EtiketMakale] CHECK CONSTRAINT [FK_EtiketMakale_Etiket]
GO
ALTER TABLE [dbo].[EtiketMakale]  WITH CHECK ADD  CONSTRAINT [FK_EtiketMakale_Makale] FOREIGN KEY([MakaleId])
REFERENCES [dbo].[Makale] ([id])
GO
ALTER TABLE [dbo].[EtiketMakale] CHECK CONSTRAINT [FK_EtiketMakale_Makale]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Yetki] FOREIGN KEY([YetkiId])
REFERENCES [dbo].[Yetki] ([YetkiId])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Yetki]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kategori] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategori] ([KategoriId])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kategori]
GO
ALTER TABLE [dbo].[Makale]  WITH CHECK ADD  CONSTRAINT [FK_Makale_Kullanici1] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([id])
GO
ALTER TABLE [dbo].[Makale] CHECK CONSTRAINT [FK_Makale_Kullanici1]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Kullanici] FOREIGN KEY([KullaniciId])
REFERENCES [dbo].[Kullanici] ([id])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Kullanici]
GO
ALTER TABLE [dbo].[Yorum]  WITH CHECK ADD  CONSTRAINT [FK_Yorum_Makale] FOREIGN KEY([MakaleId])
REFERENCES [dbo].[Makale] ([id])
GO
ALTER TABLE [dbo].[Yorum] CHECK CONSTRAINT [FK_Yorum_Makale]
GO
USE [master]
GO
ALTER DATABASE [BlogDb] SET  READ_WRITE 
GO
