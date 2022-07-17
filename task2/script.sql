USE [master]
GO
/****** Object:  Database [restaurants]    Script Date: 7/17/2022 11:13:47 PM ******/
CREATE DATABASE [restaurants]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'restaurants', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restaurants.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'restaurants_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\restaurants_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [restaurants] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [restaurants].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [restaurants] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [restaurants] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [restaurants] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [restaurants] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [restaurants] SET ARITHABORT OFF 
GO
ALTER DATABASE [restaurants] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [restaurants] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [restaurants] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [restaurants] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [restaurants] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [restaurants] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [restaurants] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [restaurants] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [restaurants] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [restaurants] SET  ENABLE_BROKER 
GO
ALTER DATABASE [restaurants] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [restaurants] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [restaurants] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [restaurants] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [restaurants] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [restaurants] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [restaurants] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [restaurants] SET RECOVERY FULL 
GO
ALTER DATABASE [restaurants] SET  MULTI_USER 
GO
ALTER DATABASE [restaurants] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [restaurants] SET DB_CHAINING OFF 
GO
ALTER DATABASE [restaurants] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [restaurants] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [restaurants] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [restaurants] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'restaurants', N'ON'
GO
ALTER DATABASE [restaurants] SET QUERY_STORE = OFF
GO
USE [restaurants]
GO
/****** Object:  Table [dbo].[cat_item]    Script Date: 7/17/2022 11:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cat_item](
	[C_id] [int] NULL,
	[I_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/17/2022 11:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[C_id] [int] NOT NULL,
	[C_name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[C_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 7/17/2022 11:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[I_id] [int] NOT NULL,
	[I_name] [varchar](30) NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[I_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rest_Cat]    Script Date: 7/17/2022 11:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rest_Cat](
	[R_id] [int] NULL,
	[C_id] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 7/17/2022 11:13:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[R_id] [int] NOT NULL,
	[name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[R_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([C_id], [C_name]) VALUES (1, N'breakfast')
INSERT [dbo].[category] ([C_id], [C_name]) VALUES (2, N'meals')
INSERT [dbo].[category] ([C_id], [C_name]) VALUES (3, N'sandwiches')
INSERT [dbo].[category] ([C_id], [C_name]) VALUES (4, N'desserts')
GO
SET IDENTITY_INSERT [dbo].[Rest_Cat] ON 

INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (1, 1, 1)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (1, 2, 2)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (1, 3, 3)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (1, 4, 4)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (2, 1, 5)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (2, 2, 6)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (3, 1, 7)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (3, 2, 8)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (3, 3, 9)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (4, 1, 10)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (4, 2, 11)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (4, 3, 12)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (4, 4, 13)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (5, 1, 14)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (1, 3, 15)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (5, 4, 16)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (6, 1, 17)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (6, 2, 18)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (7, 1, 19)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (7, 2, 20)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (7, 3, 21)
INSERT [dbo].[Rest_Cat] ([R_id], [C_id], [id]) VALUES (7, 4, 22)
SET IDENTITY_INSERT [dbo].[Rest_Cat] OFF
GO
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (1, N'rest_1')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (2, N'rest_2')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (3, N'rest_3')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (4, N'rest_4')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (5, N'rest_5')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (6, N'rest_6')
INSERT [dbo].[restaurant] ([R_id], [name]) VALUES (7, N'rest_7')
GO
ALTER TABLE [dbo].[cat_item]  WITH CHECK ADD FOREIGN KEY([C_id])
REFERENCES [dbo].[category] ([C_id])
GO
ALTER TABLE [dbo].[cat_item]  WITH CHECK ADD FOREIGN KEY([I_id])
REFERENCES [dbo].[item] ([I_id])
GO
ALTER TABLE [dbo].[Rest_Cat]  WITH CHECK ADD FOREIGN KEY([C_id])
REFERENCES [dbo].[category] ([C_id])
GO
ALTER TABLE [dbo].[Rest_Cat]  WITH CHECK ADD FOREIGN KEY([R_id])
REFERENCES [dbo].[restaurant] ([R_id])
GO
USE [master]
GO
ALTER DATABASE [restaurants] SET  READ_WRITE 
GO
