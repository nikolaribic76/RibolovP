USE [master]
GO
/****** Object:  Database [Ribolov]    Script Date: 12/15/2022 12:20:04 PM ******/
CREATE DATABASE [Ribolov] ON  PRIMARY 
( NAME = N'Ribolov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ribolov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ribolov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ribolov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ribolov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ribolov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ribolov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ribolov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ribolov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ribolov] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ribolov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ribolov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ribolov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ribolov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ribolov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ribolov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ribolov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ribolov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ribolov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ribolov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ribolov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ribolov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ribolov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ribolov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ribolov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ribolov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ribolov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ribolov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ribolov] SET  MULTI_USER 
GO
ALTER DATABASE [Ribolov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ribolov] SET DB_CHAINING OFF 
GO
USE [Ribolov]
GO
/****** Object:  Table [dbo].[Grad]    Script Date: 12/15/2022 12:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grad](
	[GradID] [int] IDENTITY(1,1) NOT NULL,
	[Grad] [varchar](50) NOT NULL,
	[PozivniBroj] [varchar](50) NOT NULL,
	[PostanskiBroj] [varchar](50) NOT NULL,
	[BrojStanovnika] [int] NOT NULL,
 CONSTRAINT [PK_Grad] PRIMARY KEY CLUSTERED 
(
	[GradID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ribolovac]    Script Date: 12/15/2022 12:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ribolovac](
	[RibolovacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Adresa] [varchar](50) NOT NULL,
	[Telefon] [varchar](50) NOT NULL,
	[GradID] [int] NOT NULL,
 CONSTRAINT [PK_Ribolovac] PRIMARY KEY CLUSTERED 
(
	[RibolovacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ulov]    Script Date: 12/15/2022 12:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ulov](
	[RibolovacID] [int] NOT NULL,
	[RbrUlova] [int] IDENTITY(1,1) NOT NULL,
	[DatumUlova] [date] NOT NULL,
	[VrstaID] [int] NOT NULL,
	[Gramaza] [int] NOT NULL,
 CONSTRAINT [PK_Ulov] PRIMARY KEY CLUSTERED 
(
	[RbrUlova] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vrsta_Ribe]    Script Date: 12/15/2022 12:20:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vrsta_Ribe](
	[VrstaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Opis] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vrsta_Ribe] PRIMARY KEY CLUSTERED 
(
	[VrstaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grad] ON 

INSERT [dbo].[Grad] ([GradID], [Grad], [PozivniBroj], [PostanskiBroj], [BrojStanovnika]) VALUES (1, N'Novi Sad', N'021', N'21000', 350000)
INSERT [dbo].[Grad] ([GradID], [Grad], [PozivniBroj], [PostanskiBroj], [BrojStanovnika]) VALUES (2, N'Beograd', N'011', N'11000', 1200000)
INSERT [dbo].[Grad] ([GradID], [Grad], [PozivniBroj], [PostanskiBroj], [BrojStanovnika]) VALUES (3, N'Kragujevac', N'034', N'34000', 200000)
SET IDENTITY_INSERT [dbo].[Grad] OFF
GO
SET IDENTITY_INSERT [dbo].[Ribolovac] ON 

INSERT [dbo].[Ribolovac] ([RibolovacID], [Ime], [Prezime], [Adresa], [Telefon], [GradID]) VALUES (1, N'Milos', N'Radic', N'Novosadska 120', N'062424023', 1)
INSERT [dbo].[Ribolovac] ([RibolovacID], [Ime], [Prezime], [Adresa], [Telefon], [GradID]) VALUES (3, N'Luka', N'Malesevic', N'Durmitorska 2', N'0614417105', 2)
INSERT [dbo].[Ribolovac] ([RibolovacID], [Ime], [Prezime], [Adresa], [Telefon], [GradID]) VALUES (4, N'Stefan', N'Karac', N'Ritska 27', N'0616373417', 3)
INSERT [dbo].[Ribolovac] ([RibolovacID], [Ime], [Prezime], [Adresa], [Telefon], [GradID]) VALUES (5, N'Miroslav', N'Beric', N'Cara Lazara 120', N'020102010', 3)
INSERT [dbo].[Ribolovac] ([RibolovacID], [Ime], [Prezime], [Adresa], [Telefon], [GradID]) VALUES (7, N'Aleksandar', N'Knezevic', N'Vase Stajica', N'06412353', 1)
SET IDENTITY_INSERT [dbo].[Ribolovac] OFF
GO
SET IDENTITY_INSERT [dbo].[Ulov] ON 

INSERT [dbo].[Ulov] ([RibolovacID], [RbrUlova], [DatumUlova], [VrstaID], [Gramaza]) VALUES (1, 1, CAST(N'2022-01-01' AS Date), 1, 2)
INSERT [dbo].[Ulov] ([RibolovacID], [RbrUlova], [DatumUlova], [VrstaID], [Gramaza]) VALUES (3, 2, CAST(N'2022-02-02' AS Date), 2, 10)
INSERT [dbo].[Ulov] ([RibolovacID], [RbrUlova], [DatumUlova], [VrstaID], [Gramaza]) VALUES (4, 3, CAST(N'2022-03-03' AS Date), 3, 50)
INSERT [dbo].[Ulov] ([RibolovacID], [RbrUlova], [DatumUlova], [VrstaID], [Gramaza]) VALUES (4, 5, CAST(N'2012-02-01' AS Date), 3, 21312)
INSERT [dbo].[Ulov] ([RibolovacID], [RbrUlova], [DatumUlova], [VrstaID], [Gramaza]) VALUES (7, 6, CAST(N'2022-05-05' AS Date), 2, 3000)
SET IDENTITY_INSERT [dbo].[Ulov] OFF
GO
SET IDENTITY_INSERT [dbo].[Vrsta_Ribe] ON 

INSERT [dbo].[Vrsta_Ribe] ([VrstaID], [Naziv], [Opis]) VALUES (1, N'Saran', N'Pljosnat')
INSERT [dbo].[Vrsta_Ribe] ([VrstaID], [Naziv], [Opis]) VALUES (2, N'Som', N'Brkati')
INSERT [dbo].[Vrsta_Ribe] ([VrstaID], [Naziv], [Opis]) VALUES (3, N'Ajkula', N'Cekicarka')
SET IDENTITY_INSERT [dbo].[Vrsta_Ribe] OFF
GO
ALTER TABLE [dbo].[Ribolovac]  WITH CHECK ADD  CONSTRAINT [FK_Ribolovac_Grad] FOREIGN KEY([GradID])
REFERENCES [dbo].[Grad] ([GradID])
GO
ALTER TABLE [dbo].[Ribolovac] CHECK CONSTRAINT [FK_Ribolovac_Grad]
GO
ALTER TABLE [dbo].[Ulov]  WITH CHECK ADD  CONSTRAINT [FK_Ulov_Ribolovac] FOREIGN KEY([RibolovacID])
REFERENCES [dbo].[Ribolovac] ([RibolovacID])
GO
ALTER TABLE [dbo].[Ulov] CHECK CONSTRAINT [FK_Ulov_Ribolovac]
GO
ALTER TABLE [dbo].[Ulov]  WITH CHECK ADD  CONSTRAINT [FK_Ulov_Vrsta_Ribe] FOREIGN KEY([VrstaID])
REFERENCES [dbo].[Vrsta_Ribe] ([VrstaID])
GO
ALTER TABLE [dbo].[Ulov] CHECK CONSTRAINT [FK_Ulov_Vrsta_Ribe]
GO
USE [master]
GO
ALTER DATABASE [Ribolov] SET  READ_WRITE 
GO
