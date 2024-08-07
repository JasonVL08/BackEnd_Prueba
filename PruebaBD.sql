USE [master]
GO
/****** Object:  Database [WayniBD]    Script Date: 16/07/2024 19:19:31 ******/
CREATE DATABASE [WayniBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WayniBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WayniBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WayniBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WayniBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WayniBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WayniBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WayniBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WayniBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WayniBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WayniBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WayniBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [WayniBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WayniBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WayniBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WayniBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WayniBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WayniBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WayniBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WayniBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WayniBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WayniBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WayniBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WayniBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WayniBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WayniBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WayniBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WayniBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WayniBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WayniBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WayniBD] SET  MULTI_USER 
GO
ALTER DATABASE [WayniBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WayniBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WayniBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WayniBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WayniBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WayniBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WayniBD] SET QUERY_STORE = OFF
GO
USE [WayniBD]
GO
/****** Object:  Table [dbo].[tb_producto]    Script Date: 16/07/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_producto] ON 

INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (1, N'TV', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (2, N'Mouse', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (3, N'Grafica RTX 3060', CAST(1600.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (4, N'Teclado', CAST(100.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (5, N'RTX 2060', CAST(1100.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (6, N'RTX 1660TI', CAST(600.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (7, N'Inten Core i5 11400 2g', CAST(900.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (8, N'Ryzen 5 5600x', CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[tb_producto] ([id_producto], [nombre], [precio]) VALUES (9, N'Nuevo', CAST(150.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[tb_producto] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteProducto]    Script Date: 16/07/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[usp_deleteProducto]
@id_producto int
as
begin
	delete tb_producto where id_producto = @id_producto
end

GO
/****** Object:  StoredProcedure [dbo].[usp_findAllProducto]    Script Date: 16/07/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[usp_findAllProducto]
as
begin
	select * from tb_Producto
end

GO
/****** Object:  StoredProcedure [dbo].[usp_saveProducto]    Script Date: 16/07/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[usp_saveProducto]
@nombre varchar(100),
@precio decimal(10,2)
as
begin
	insert into tb_producto values (@nombre, @precio)
end

GO
/****** Object:  StoredProcedure [dbo].[usp_updateProducto]    Script Date: 16/07/2024 19:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[usp_updateProducto]
@id_producto int,
@nombre varchar(100),
@precio decimal(10,2)
as
begin
	update tb_producto set
	nombre = @nombre, precio = @precio
	where id_producto = @id_producto
end

GO
USE [master]
GO
ALTER DATABASE [WayniBD] SET  READ_WRITE 
GO
