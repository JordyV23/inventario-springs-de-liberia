USE [master]
GO
/****** Object:  Database [DbSpringsDeLiberia]    Script Date: 23/06/2024 22:44:53 ******/
CREATE DATABASE [DbSpringsDeLiberia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbSpringsDeLiberia', FILENAME = N'/var/opt/mssql/data/DbSpringsDeLiberia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbSpringsDeLiberia_log', FILENAME = N'/var/opt/mssql/data/DbSpringsDeLiberia_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DbSpringsDeLiberia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbSpringsDeLiberia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET RECOVERY FULL 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET  MULTI_USER 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbSpringsDeLiberia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbSpringsDeLiberia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbSpringsDeLiberia', N'ON'
GO
ALTER DATABASE [DbSpringsDeLiberia] SET QUERY_STORE = ON
GO
ALTER DATABASE [DbSpringsDeLiberia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DbSpringsDeLiberia]
GO
/****** Object:  Table [dbo].[TbAddresses]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAddresses](
	[idAddress] [int] IDENTITY(1,1) NOT NULL,
	[idProvincia] [int] NOT NULL,
	[idCanton] [int] NOT NULL,
	[distrito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TbAddresses] PRIMARY KEY CLUSTERED 
(
	[idAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAdvertisement]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAdvertisement](
	[idAdvertisement] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [text] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[envioPeriodico] [bit] NOT NULL,
	[intervaloDiasNotificacion] [int] NOT NULL,
	[envioActivo] [bit] NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbAdvertisement] PRIMARY KEY CLUSTERED 
(
	[idAdvertisement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbAssets]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAssets](
	[idAsset] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
	[idAddress] [int] NOT NULL,
	[estado] [char](1) NOT NULL,
	[detalleDireccion] [text] NOT NULL,
	[precioGlobal] [decimal](10, 2) NOT NULL,
	[tipoAsset] [char](1) NOT NULL,
	[precioPorNoche] [decimal](10, 2) NOT NULL,
	[precioPorMes] [decimal](10, 2) NOT NULL,
	[eliminado] [bit] NOT NULL,
	[disponibilidad] [char](1) NOT NULL,
	[imagenSrc] [varchar](50) NOT NULL,
 CONSTRAINT [PkTbAssets] PRIMARY KEY CLUSTERED 
(
	[idAsset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCantones]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCantones](
	[idCanton] [int] IDENTITY(1,1) NOT NULL,
	[canton] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TbCantones] PRIMARY KEY CLUSTERED 
(
	[idCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbFinishedMaintenance]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbFinishedMaintenance](
	[idFinishedMaintenance] [int] IDENTITY(1,1) NOT NULL,
	[idMaintenance] [int] NOT NULL,
	[idOperario] [int] NOT NULL,
	[motivoCierre] [char](1) NOT NULL,
	[detalle] [text] NOT NULL,
	[costoReparacion] [decimal](10, 0) NOT NULL,
	[fechaCierre] [date] NOT NULL,
 CONSTRAINT [PK_TbFinishedMaintenance] PRIMARY KEY CLUSTERED 
(
	[idFinishedMaintenance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbMaintenance]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbMaintenance](
	[idMaintenance] [int] IDENTITY(1,1) NOT NULL,
	[idPaperwork] [int] NOT NULL,
	[detalle] [text] NOT NULL,
	[pendiente] [bit] NOT NULL,
	[eliminado] [bit] NOT NULL,
	[fechaRegistro] [date] NOT NULL,
 CONSTRAINT [PK_TbMaintenance] PRIMARY KEY CLUSTERED 
(
	[idMaintenance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPaperwork]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPaperwork](
	[idPaperwork] [int] IDENTITY(1,1) NOT NULL,
	[idAsset] [int] NOT NULL,
	[idPerson] [int] NOT NULL,
	[tipo] [char](1) NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbPaperwork] PRIMARY KEY CLUSTERED 
(
	[idPaperwork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPerson]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPerson](
	[idPerson] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](9) NOT NULL,
	[nombreCompleto] [varchar](60) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[correoElectronico] [varchar](max) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[eliminado] [bit] NOT NULL,
	[emailHash]  AS (hashbytes('SHA2_256',[correoElectronico])) PERSISTED,
 CONSTRAINT [PkTbPersonIdPerson] PRIMARY KEY CLUSTERED 
(
	[idPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProvincias]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbProvincias](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TbProvincias] PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbRental]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbRental](
	[idRental] [int] IDENTITY(1,1) NOT NULL,
	[idPaperwork] [int] NOT NULL,
	[fechaRegistroAlquiler] [date] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFin] [date] NOT NULL,
	[jsonDetalles] [nvarchar](max) NOT NULL,
	[activo] [bit] NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbRental] PRIMARY KEY CLUSTERED 
(
	[idRental] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbSelling]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbSelling](
	[idSelling] [int] IDENTITY(1,1) NOT NULL,
	[idPaperwork] [int] NOT NULL,
	[fechaVenta] [date] NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbSelling] PRIMARY KEY CLUSTERED 
(
	[idSelling] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbUser]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUser](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](60) NOT NULL,
	[rol] [char](1) NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbUser] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TbAddresses] ON 

INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (1, 1, 1, N'Carmen')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (2, 1, 1, N'Merced')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (3, 1, 1, N'Hospital')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (4, 1, 1, N'Catedral')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (5, 1, 1, N'Zapote')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (6, 1, 1, N'San Francisco de Dos Ríos')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (7, 1, 1, N'Uruca')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (8, 1, 1, N'Mata Redonda')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (9, 1, 1, N'Pavas')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (10, 1, 1, N'Hatillo')
INSERT [dbo].[TbAddresses] ([idAddress], [idProvincia], [idCanton], [distrito]) VALUES (11, 1, 1, N'San Sebastián')
SET IDENTITY_INSERT [dbo].[TbAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[TbAdvertisement] ON 

INSERT [dbo].[TbAdvertisement] ([idAdvertisement], [titulo], [descripcion], [fechaInicio], [fechaFin], [envioPeriodico], [intervaloDiasNotificacion], [envioActivo], [eliminado]) VALUES (1, N'10% de descuento a los primero', N'10% de descuento en las promociones para los nuevos clientes', CAST(N'2024-01-23' AS Date), CAST(N'2024-12-31' AS Date), 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[TbAdvertisement] OFF
GO
SET IDENTITY_INSERT [dbo].[TbAssets] ON 

INSERT [dbo].[TbAssets] ([idAsset], [nombre], [descripcion], [idAddress], [estado], [detalleDireccion], [precioGlobal], [tipoAsset], [precioPorNoche], [precioPorMes], [eliminado], [disponibilidad], [imagenSrc]) VALUES (1, N'La casita preciosa', N'Hermosa casita con vistas a CHEPE', 1, N'D', N'500 mts sur de la pulperia', CAST(1000.00 AS Decimal(10, 2)), N'C', CAST(12000.00 AS Decimal(10, 2)), CAST(36000.00 AS Decimal(10, 2)), 1, N'A', N'/no-img')
SET IDENTITY_INSERT [dbo].[TbAssets] OFF
GO
SET IDENTITY_INSERT [dbo].[TbCantones] ON 

INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (1, N'San José')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (2, N'Escazú')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (3, N'Desamparados')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (4, N'Puriscal')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (5, N'Tarrazú')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (6, N'Aserrí')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (7, N'Mora')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (8, N'Goicoechea')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (9, N'Santa Ana')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (10, N'Alajuelita')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (11, N'Vázquez De Coronado')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (12, N'Acosta')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (13, N'Tibás')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (14, N'Moravia')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (15, N'Montes De Oca')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (16, N'Turrubares')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (17, N'Dota')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (18, N'Curridabat')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (19, N'Pérez Zeledón')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (20, N'León Cortés Castro')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (21, N'Alajuela')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (22, N'San Ramón')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (23, N'Grecia')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (24, N'San Mateo')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (25, N'Atenas')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (26, N'Naranjo')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (27, N'Palmares')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (28, N'Poás')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (29, N'Orotina')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (30, N'San Carlos')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (31, N'Zarcero')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (32, N'Sarchí')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (33, N'Upala')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (34, N'Los Chiles')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (35, N'Guatuso')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (36, N'Río Cuarto')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (37, N'Cartago')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (38, N'Paraíso')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (39, N'La Unión')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (40, N'Jiménez')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (41, N'Turrialba')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (42, N'Alvarado')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (43, N'Oreamuno')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (44, N'El Guarco')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (45, N'Heredia')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (46, N'Barva')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (47, N'Santo Domingo')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (48, N'Santa Barbara')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (49, N'San Rafael')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (50, N'San Isidro')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (51, N'Belén')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (52, N'Flores')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (53, N'San Pablo')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (54, N'Sarapiquí')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (55, N'Liberia')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (56, N'Nicoya')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (57, N'Santa Cruz')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (58, N'Bagaces')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (59, N'Carrillo')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (60, N'Cañas')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (61, N'Abangares')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (62, N'Tilarán')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (63, N'Nandayure')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (64, N'La Cruz')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (65, N'Hojancha')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (66, N'Puntarenas')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (67, N'Esparza')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (68, N'Buenos Aires')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (69, N'Montes De Oro')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (70, N'Osa')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (71, N'Quepos')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (72, N'Golfito')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (73, N'Coto Brus')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (74, N'Parrita')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (75, N'Corredores')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (76, N'Garabito')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (77, N'Monteverde')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (78, N'Limón')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (79, N'Pococí')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (80, N'Siquirres')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (81, N'Talamanca')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (82, N'Matina')
INSERT [dbo].[TbCantones] ([idCanton], [canton]) VALUES (83, N'Guácimo')
SET IDENTITY_INSERT [dbo].[TbCantones] OFF
GO
SET IDENTITY_INSERT [dbo].[TbFinishedMaintenance] ON 

INSERT [dbo].[TbFinishedMaintenance] ([idFinishedMaintenance], [idMaintenance], [idOperario], [motivoCierre], [detalle], [costoReparacion], [fechaCierre]) VALUES (1, 1, 1, N'D', N'No se encontró la averia reportada', CAST(0 AS Decimal(10, 0)), CAST(N'2024-06-23' AS Date))
SET IDENTITY_INSERT [dbo].[TbFinishedMaintenance] OFF
GO
SET IDENTITY_INSERT [dbo].[TbMaintenance] ON 

INSERT [dbo].[TbMaintenance] ([idMaintenance], [idPaperwork], [detalle], [pendiente], [eliminado], [fechaRegistro]) VALUES (1, 1006, N'reparacion de techo', 0, 1, CAST(N'2024-06-20' AS Date))
SET IDENTITY_INSERT [dbo].[TbMaintenance] OFF
GO
SET IDENTITY_INSERT [dbo].[TbPaperwork] ON 

INSERT [dbo].[TbPaperwork] ([idPaperwork], [idAsset], [idPerson], [tipo], [eliminado]) VALUES (1, 1, 1, N'A', 1)
INSERT [dbo].[TbPaperwork] ([idPaperwork], [idAsset], [idPerson], [tipo], [eliminado]) VALUES (1003, 1, 1, N'V', 1)
INSERT [dbo].[TbPaperwork] ([idPaperwork], [idAsset], [idPerson], [tipo], [eliminado]) VALUES (1004, 1, 1, N'A', 0)
INSERT [dbo].[TbPaperwork] ([idPaperwork], [idAsset], [idPerson], [tipo], [eliminado]) VALUES (1005, 1, 1, N'A', 0)
INSERT [dbo].[TbPaperwork] ([idPaperwork], [idAsset], [idPerson], [tipo], [eliminado]) VALUES (1006, 1, 1, N'A', 1)
SET IDENTITY_INSERT [dbo].[TbPaperwork] OFF
GO
SET IDENTITY_INSERT [dbo].[TbPerson] ON 

INSERT [dbo].[TbPerson] ([idPerson], [cedula], [nombreCompleto], [telefono], [correoElectronico], [idUsuario], [eliminado]) VALUES (1, N'118340484', N'Jordy Hernandez Vargas', N'85054393', N'jordyvargas@gmail.com', 0, 0)
INSERT [dbo].[TbPerson] ([idPerson], [cedula], [nombreCompleto], [telefono], [correoElectronico], [idUsuario], [eliminado]) VALUES (2, N'123456789', N'Juan Pérez Mora', N'1234-5678', N'juan.perez@example.com', 1, 1)
SET IDENTITY_INSERT [dbo].[TbPerson] OFF
GO
SET IDENTITY_INSERT [dbo].[TbProvincias] ON 

INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (1, N'San José')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (2, N'Alajuela')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (3, N'Cartago')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (4, N'Heredia')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (5, N'Guanacaste')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (6, N'Puntarenas')
INSERT [dbo].[TbProvincias] ([idProvincia], [provincia]) VALUES (7, N'Limón')
SET IDENTITY_INSERT [dbo].[TbProvincias] OFF
GO
SET IDENTITY_INSERT [dbo].[TbRental] ON 

INSERT [dbo].[TbRental] ([idRental], [idPaperwork], [fechaRegistroAlquiler], [fechaInicio], [fechaFin], [jsonDetalles], [activo], [eliminado]) VALUES (4, 1, CAST(N'2023-06-22' AS Date), CAST(N'2023-06-22' AS Date), CAST(N'2023-06-24' AS Date), N'', 1, 1)
SET IDENTITY_INSERT [dbo].[TbRental] OFF
GO
SET IDENTITY_INSERT [dbo].[TbSelling] ON 

INSERT [dbo].[TbSelling] ([idSelling], [idPaperwork], [fechaVenta], [eliminado]) VALUES (1003, 1003, CAST(N'2024-06-22' AS Date), 1)
SET IDENTITY_INSERT [dbo].[TbSelling] OFF
GO
SET IDENTITY_INSERT [dbo].[TbUser] ON 

INSERT [dbo].[TbUser] ([idUser], [username], [password], [rol], [eliminado]) VALUES (0, N'jhernandez', N'$2a$10$ciYYuhmUDPAGGqGiKJRveOMEWL.4YeFu2unKYtVQvPeiS1Pa5POkO', N'A', 0)
INSERT [dbo].[TbUser] ([idUser], [username], [password], [rol], [eliminado]) VALUES (1, N'juanperez', N'$2a$10$yzuXW62dmGqm9gTJewwTwOFyWvrvq6GcLIahUgTwqpxwt.4FzQ1Fe', N'C', 1)
SET IDENTITY_INSERT [dbo].[TbUser] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UkTbPersonCedula]    Script Date: 23/06/2024 22:44:53 ******/
ALTER TABLE [dbo].[TbPerson] ADD  CONSTRAINT [UkTbPersonCedula] UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UkTbPersonEmail]    Script Date: 23/06/2024 22:44:53 ******/
ALTER TABLE [dbo].[TbPerson] ADD  CONSTRAINT [UkTbPersonEmail] UNIQUE NONCLUSTERED 
(
	[emailHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UkTbPersonIdUsuario]    Script Date: 23/06/2024 22:44:53 ******/
ALTER TABLE [dbo].[TbPerson] ADD  CONSTRAINT [UkTbPersonIdUsuario] UNIQUE NONCLUSTERED 
(
	[idPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbAdvertisement] ADD  CONSTRAINT [DF_TbAdvertisement_envioActivo]  DEFAULT ((1)) FOR [envioActivo]
GO
ALTER TABLE [dbo].[TbAdvertisement] ADD  CONSTRAINT [DF_TbAdvertisement_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbAssets] ADD  CONSTRAINT [DF_TbAssets_estado]  DEFAULT ('D') FOR [estado]
GO
ALTER TABLE [dbo].[TbAssets] ADD  CONSTRAINT [DF_TbAssets_precioPorNoche]  DEFAULT ((0)) FOR [precioPorNoche]
GO
ALTER TABLE [dbo].[TbAssets] ADD  CONSTRAINT [DF_TbAssets_precioPorMes]  DEFAULT ((0)) FOR [precioPorMes]
GO
ALTER TABLE [dbo].[TbAssets] ADD  CONSTRAINT [DF_TbAssets_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbMaintenance] ADD  CONSTRAINT [DF_TbMaintenance_pendiente]  DEFAULT ((1)) FOR [pendiente]
GO
ALTER TABLE [dbo].[TbMaintenance] ADD  CONSTRAINT [DF_TbMaintenance_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbPaperwork] ADD  CONSTRAINT [DF_TbPaperwork_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbPerson] ADD  CONSTRAINT [DF_TbPerson_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbRental] ADD  CONSTRAINT [DF_TbRental_jsonDetalles]  DEFAULT ('{}') FOR [jsonDetalles]
GO
ALTER TABLE [dbo].[TbRental] ADD  CONSTRAINT [DF_TbRental_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[TbRental] ADD  CONSTRAINT [DF_TbRental_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbSelling] ADD  CONSTRAINT [DF_TbSelling_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbUser] ADD  CONSTRAINT [DF_TbUser_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbAddresses]  WITH CHECK ADD  CONSTRAINT [FkTbAddressesIdCantonTbCantonesIdCanton] FOREIGN KEY([idCanton])
REFERENCES [dbo].[TbCantones] ([idCanton])
GO
ALTER TABLE [dbo].[TbAddresses] CHECK CONSTRAINT [FkTbAddressesIdCantonTbCantonesIdCanton]
GO
ALTER TABLE [dbo].[TbAddresses]  WITH CHECK ADD  CONSTRAINT [FkTbAddressesidProvinciaTbProvinciasIdProvincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[TbProvincias] ([idProvincia])
GO
ALTER TABLE [dbo].[TbAddresses] CHECK CONSTRAINT [FkTbAddressesidProvinciaTbProvinciasIdProvincia]
GO
ALTER TABLE [dbo].[TbAssets]  WITH CHECK ADD  CONSTRAINT [FkTbAssetsIdAddressTbAddressesIdAddress] FOREIGN KEY([idAddress])
REFERENCES [dbo].[TbAddresses] ([idAddress])
GO
ALTER TABLE [dbo].[TbAssets] CHECK CONSTRAINT [FkTbAssetsIdAddressTbAddressesIdAddress]
GO
ALTER TABLE [dbo].[TbFinishedMaintenance]  WITH CHECK ADD  CONSTRAINT [FkTbFinishedMaintenanceIdMaintenanceTbMaintenanceIdMaintenance] FOREIGN KEY([idMaintenance])
REFERENCES [dbo].[TbMaintenance] ([idMaintenance])
GO
ALTER TABLE [dbo].[TbFinishedMaintenance] CHECK CONSTRAINT [FkTbFinishedMaintenanceIdMaintenanceTbMaintenanceIdMaintenance]
GO
ALTER TABLE [dbo].[TbMaintenance]  WITH CHECK ADD  CONSTRAINT [FkTbMaintenanceIdPaperworkTbPaperworkIdPaperwork] FOREIGN KEY([idPaperwork])
REFERENCES [dbo].[TbPaperwork] ([idPaperwork])
GO
ALTER TABLE [dbo].[TbMaintenance] CHECK CONSTRAINT [FkTbMaintenanceIdPaperworkTbPaperworkIdPaperwork]
GO
ALTER TABLE [dbo].[TbPaperwork]  WITH CHECK ADD  CONSTRAINT [FkTbPaperworkIdAssetTbAssetsIdAsset] FOREIGN KEY([idAsset])
REFERENCES [dbo].[TbAssets] ([idAsset])
GO
ALTER TABLE [dbo].[TbPaperwork] CHECK CONSTRAINT [FkTbPaperworkIdAssetTbAssetsIdAsset]
GO
ALTER TABLE [dbo].[TbPaperwork]  WITH CHECK ADD  CONSTRAINT [FkTbPaperworkIdPersonTbPersonIdPerson] FOREIGN KEY([idPerson])
REFERENCES [dbo].[TbPerson] ([idPerson])
GO
ALTER TABLE [dbo].[TbPaperwork] CHECK CONSTRAINT [FkTbPaperworkIdPersonTbPersonIdPerson]
GO
ALTER TABLE [dbo].[TbPerson]  WITH CHECK ADD  CONSTRAINT [FkTbPersonIdUsuarioTbUserIdUser] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[TbUser] ([idUser])
GO
ALTER TABLE [dbo].[TbPerson] CHECK CONSTRAINT [FkTbPersonIdUsuarioTbUserIdUser]
GO
ALTER TABLE [dbo].[TbRental]  WITH CHECK ADD  CONSTRAINT [FkTbRentalIdPaperworkTbPaperworkIdPaperwork] FOREIGN KEY([idPaperwork])
REFERENCES [dbo].[TbPaperwork] ([idPaperwork])
GO
ALTER TABLE [dbo].[TbRental] CHECK CONSTRAINT [FkTbRentalIdPaperworkTbPaperworkIdPaperwork]
GO
ALTER TABLE [dbo].[TbSelling]  WITH CHECK ADD  CONSTRAINT [FkTbSellingIdPaperworkTbPaperworkIdPaperwork] FOREIGN KEY([idPaperwork])
REFERENCES [dbo].[TbPaperwork] ([idPaperwork])
GO
ALTER TABLE [dbo].[TbSelling] CHECK CONSTRAINT [FkTbSellingIdPaperworkTbPaperworkIdPaperwork]
GO
ALTER TABLE [dbo].[TbAssets]  WITH CHECK ADD  CONSTRAINT [CkTbAssetsDisponibilidad] CHECK  (([disponibilidad]='A' OR [disponibilidad]='V'))
GO
ALTER TABLE [dbo].[TbAssets] CHECK CONSTRAINT [CkTbAssetsDisponibilidad]
GO
ALTER TABLE [dbo].[TbAssets]  WITH CHECK ADD  CONSTRAINT [CkTbAssetsEstado] CHECK  (([estado]='V' OR [estado]='A' OR [estado]='D'))
GO
ALTER TABLE [dbo].[TbAssets] CHECK CONSTRAINT [CkTbAssetsEstado]
GO
ALTER TABLE [dbo].[TbAssets]  WITH CHECK ADD  CONSTRAINT [CkTbAssetsTipoAsset] CHECK  (([tipoAsset]='E' OR [tipoAsset]='T' OR [tipoAsset]='C' OR [tipoAsset]='A'))
GO
ALTER TABLE [dbo].[TbAssets] CHECK CONSTRAINT [CkTbAssetsTipoAsset]
GO
ALTER TABLE [dbo].[TbFinishedMaintenance]  WITH CHECK ADD  CONSTRAINT [CkTbFinishedMaintenance] CHECK  (([motivoCierre]='D' OR [motivoCierre]='F'))
GO
ALTER TABLE [dbo].[TbFinishedMaintenance] CHECK CONSTRAINT [CkTbFinishedMaintenance]
GO
ALTER TABLE [dbo].[TbPaperwork]  WITH CHECK ADD  CONSTRAINT [CkTbPaperworkTipo] CHECK  (([tipo]='A' OR [tipo]='V' OR [tipo]='M'))
GO
ALTER TABLE [dbo].[TbPaperwork] CHECK CONSTRAINT [CkTbPaperworkTipo]
GO
ALTER TABLE [dbo].[TbUser]  WITH CHECK ADD  CONSTRAINT [CkTbUserRole] CHECK  (([rol]='C' OR [rol]='O' OR [rol]='F' OR [rol]='A'))
GO
ALTER TABLE [dbo].[TbUser] CHECK CONSTRAINT [CkTbUserRole]
GO
/****** Object:  StoredProcedure [dbo].[PaAgregarActivo]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para agregar un activo
-- =============================================
CREATE   PROCEDURE [dbo].[PaAgregarActivo] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@descripcion text,
	@idProvincia int,
	@idCanton int,
	@distrito varchar(50),
	@detalleDireccion text,
	@precioGlobal decimal(10,2),
	@tipoAsset char(1),
	@precioPorNoche decimal(10,2),
	@precioPorMes decimal(10,2),
	@disponibilidad char(1),
	@imagenSrc varchar(50)
AS
BEGIN
	DECLARE @idDireccion int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		@idDireccion = A.idAddress 
	FROM TbAddresses A WHERE idProvincia = @idProvincia 
		AND idCanton = @idCanton 
		AND distrito = @distrito

    -- Insert statements for procedure here
	INSERT INTO TbAssets (
		nombre
		,descripcion
		,idAddress
		,detalleDireccion
		,precioGlobal
		,tipoAsset
		,precioPorMes
		,precioPorNoche
		,disponibilidad
		,imagenSrc
	) VALUES (
		@nombre
		,@descripcion
		,@idDireccion
		,@detalleDireccion
		,@precioGlobal
		,@tipoAsset
		,@precioPorMes
		,@precioPorNoche
		,@disponibilidad
		,@imagenSrc
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PaAlquilar]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para crear un nuevo alquiler
-- =============================================
CREATE   PROCEDURE [dbo].[PaAlquilar]
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fechaRegistroAlquiler date,
	@fechaInicio date,
	@fechaFin date,
	@jsonDetalles nvarchar(MAX)
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'A');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbRental (
			idPaperwork
			,fechaRegistroAlquiler
			,fechaInicio
			,fechaFin
			,jsonDetalles
	) VALUES (
			@idPaperwork
			,@fechaRegistroAlquiler
			,@fechaInicio
			,@fechaFin
			,@jsonDetalles
	)

	UPDATE TbAssets SET estado = 'A' WHERE idAsset = @idAsset

END
GO
/****** Object:  StoredProcedure [dbo].[PaBorrarActivo]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un activo
-- =============================================
CREATE   PROCEDURE [dbo].[PaBorrarActivo]
	-- Add the parameters for the stored procedure here
	@idActivo int
AS
BEGIN
	DECLARE @idPaperwork int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TbAssets
	SET eliminado = 1
	WHERE idAsset = @idActivo
	  AND NOT EXISTS (
		SELECT 1
		FROM TbPaperwork p
		LEFT JOIN TbRental r ON p.idPaperwork = r.idPaperwork AND p.tipo = 'A' AND r.activo = 1 AND r.eliminado = 0
		LEFT JOIN TbSelling s ON p.idPaperwork = s.idPaperwork AND p.tipo = 'V' AND s.eliminado = 0
		LEFT JOIN TbMaintenance m ON p.idPaperwork = m.idPaperwork AND p.tipo = 'M' AND m.pendiente = 1 AND m.eliminado = 0
		WHERE p.idAsset = @idActivo
		  AND (r.idRental IS NOT NULL OR s.idSelling IS NOT NULL OR m.idMaintenance IS NOT NULL)
	);

END
GO
/****** Object:  StoredProcedure [dbo].[PaBorrarAdvertisement]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar una publicidad
-- =============================================
CREATE   PROCEDURE [dbo].[PaBorrarAdvertisement] 
	-- Add the parameters for the stored procedure here
	@idPublicidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TbAdvertisement SET 
		 eliminado = 1 
		,envioActivo = 0
	WHERE idAdvertisement = @idPublicidad

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaBorrarAlquiler]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un alquiler
-- =============================================
CREATE   PROCEDURE [dbo].[PaBorrarAlquiler]
	-- Add the parameters for the stored procedure here
	@idAlquiler int
AS
BEGIN
	DECLARE @idPaperwork int
		   ,@idAsset int

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- Elimina el alquiler
	UPDATE TbRental SET eliminado=1 WHERE idRental = @idAlquiler

	-- Obtiene el id del papeleo
	SELECT @idPaperwork =  A.idPaperwork FROM TbRental  A WHERE idRental = @idAlquiler
	
	-- Elimina el papeleo
	UPDATE TbPaperwork SET eliminado=1 WHERE idPaperwork = @idPaperwork

	-- Obtiene el id del actio
	SELECT @idAsset = idAsset FROM TbPaperwork WHERE idPaperwork = @idPaperwork

	-- Cambia a disponible el activo
	UPDATE TbAssets SET estado = 'D' WHERE idAsset = @idAsset

END
GO
/****** Object:  StoredProcedure [dbo].[PaBorrarMantenimiento]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un mantenimiento
-- =============================================
CREATE   PROCEDURE [dbo].[PaBorrarMantenimiento]
	-- Add the parameters for the stored procedure here
	@idMantenimiento int
AS
BEGIN
	DECLARE @idPaperwork int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- Elimina el mantenimiento
	UPDATE TbMaintenance SET eliminado=1 WHERE idMaintenance = @idMantenimiento

	-- Obtiene el id del papeleo
	SELECT @idPaperwork =  M.idPaperwork FROM TbMaintenance  M WHERE idMaintenance = @idMantenimiento
	
	-- Elimina el papeleo
	UPDATE TbPaperwork SET eliminado=1 WHERE idPaperwork = @idPaperwork

END
GO
/****** Object:  StoredProcedure [dbo].[PaBorrarVenta]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar una venta
-- =============================================
CREATE   PROCEDURE [dbo].[PaBorrarVenta]
	-- Add the parameters for the stored procedure here
	@idVenta int
AS
BEGIN
	DECLARE @idPaperwork int,
			@idAsset int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- Elimina la venta
	UPDATE TbSelling SET eliminado=1 WHERE idSelling = @idVenta

	-- Obtiene el id del papeleo
	SELECT @idPaperwork =  M.idPaperwork FROM TbSelling  M WHERE idSelling = @idVenta
	
	-- Elimina el papeleo
	UPDATE TbPaperwork SET eliminado=1 WHERE idPaperwork = @idPaperwork

	-- Obtiene el id del actio
	SELECT @idAsset = idAsset FROM TbPaperwork WHERE idPaperwork = @idPaperwork

	-- Cambia a disponible el activo
	UPDATE TbAssets SET estado = 'D' WHERE idAsset = @idAsset

END
GO
/****** Object:  StoredProcedure [dbo].[PaCerrarMantenimiento]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para cerrar un mantenimiento
-- =============================================
CREATE   PROCEDURE [dbo].[PaCerrarMantenimiento]
	-- Add the parameters for the stored procedure here
	@idMaintenance int,
	@idOperario int, 
	@motivo char(1),
	@detalle text,
	@costo decimal(10,2),
	@fechaCierre date
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TbMaintenance SET pendiente = 0 WHERE idMaintenance = @idMaintenance

	INSERT INTO TbFinishedMaintenance (
		idMaintenance,
		idOperario,
		motivoCierre,
		detalle,
		costoReparacion,
		fechaCierre
	) VALUES (
		@idMaintenance,
		@idOperario,
		@motivo,
		@detalle,
		@costo,
		@fechaCierre
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PaCrearAdvertisement]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que inserta en TbAdvertisement
-- =============================================
CREATE   PROCEDURE [dbo].[PaCrearAdvertisement] 
	-- Add the parameters for the stored procedure here
	@titulo varchar(100),
	@description text,
	@fechaInicio date,
	@fechaFin date,
	@isPeriodica bit,
	@intervalo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbAdvertisement (
		titulo
		,descripcion
		,fechaInicio
		,fechaFin
		,envioPeriodico
		,intervaloDiasNotificacion
	) values (
		@titulo
		,@description
		,@fechaInicio 
		,@fechaFin
		,@isPeriodica
		,@intervalo
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PaCrearMantenimiento]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para crear un mantenimiento
-- =============================================
CREATE   PROCEDURE [dbo].[PaCrearMantenimiento]
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fecha date,
	@detalle text
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'A');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbMaintenance(
			idPaperwork
			,fechaRegistro
			,detalle
	) VALUES (
			@idPaperwork
			,@fecha
			,@detalle
	)

END
GO
/****** Object:  StoredProcedure [dbo].[PaEditarActivo]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para editar un activo
-- =============================================
CREATE   PROCEDURE [dbo].[PaEditarActivo] 
	-- Add the parameters for the stored procedure here
	@idActivo int,
	@nombre varchar(50),
	@descripcion text,
	@idProvincia int,
	@idCanton int,
	@distrito varchar(50),
	@detalleDireccion text,
	@precioGlobal decimal(10,2),
	@tipoAsset char(1),
	@precioPorNoche decimal(10,2),
	@precioPorMes decimal(10,2),
	@disponibilidad char(1),
	@imagenSrc varchar(50)
AS
BEGIN
	DECLARE @idDireccion int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		@idDireccion = A.idAddress 
	FROM TbAddresses A WHERE idProvincia = @idProvincia 
		AND idCanton = @idCanton 
		AND distrito = @distrito

    -- Insert statements for procedure here
	UPDATE TbAssets SET 
		nombre = @nombre
		,descripcion = @descripcion
		,idAddress = @idDireccion
		,detalleDireccion = @detalleDireccion
		,precioGlobal = @precioGlobal
		,tipoAsset = @tipoAsset
		,precioPorMes = @precioPorMes
		,precioPorNoche = @precioPorNoche
		,disponibilidad = @disponibilidad
		,imagenSrc = @imagenSrc
	WHERE idAsset = @idActivo

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaEditarAdvertisement]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que editar en TbAdvertisement
-- =============================================
CREATE   PROCEDURE [dbo].[PaEditarAdvertisement] 
	-- Add the parameters for the stored procedure here
	@idAvertisement int,
	@titulo varchar(100),
	@description text,
	@fechaInicio date,
	@fechaFin date,
	@isPeriodical bit,
	@intervalo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE TbAdvertisement SET 
		titulo = @titulo
		,descripcion = @description
		,fechaInicio = @fechaInicio
		,fechaFin = @fechaFin
		,envioPeriodico = @isPeriodical
		,intervaloDiasNotificacion = @intervalo
	WHERE idAdvertisement = @idAvertisement
END
GO
/****** Object:  StoredProcedure [dbo].[PaEditPerson]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 18/06/2024
-- Description:	Procedimiento almacenado para editar un usuario
-- =============================================
CREATE   PROCEDURE [dbo].[PaEditPerson]
	-- Add the parameters for the stored procedure here
	@idPerson int,
	--@idUsuario int,
	@cedula varchar(9),
	@nombreCompleto varchar(60),
	@telefono varchar(30),
	@correo varchar(max),
	--@username varchar(30),
	@password varchar(60),
	@rol char(1)

AS
BEGIN
	DECLARE @idUsuario int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TbPerson SET 
		cedula = @cedula
		,nombreCompleto = @nombreCompleto 
		,telefono = @telefono
		,correoElectronico=@correo 
	WHERE idPerson = @idPerson

	SELECT @idUsuario = idUsuario FROM TbPerson WHERE idPerson = @idPerson

    UPDATE TbUser SET 
		--username = @username ,
		password = @password, 
		rol = @rol 
	WHERE idUser = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[PaInhabilitarPerson]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para eliminar de manera logica una persona y su usuario
-- =============================================
CREATE PROCEDURE [dbo].[PaInhabilitarPerson] 
	-- Add the parameters for the stored procedure here
	@idPerson int
AS
BEGIN
	DECLARE @idUsuario int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @idUsuario = idUsuario FROM TbPerson;

	UPDATE TbPerson SET eliminado = 1 WHERE idPerson = @idPerson
	UPDATE TbUser SET eliminado = 1 WHERE idUser = @idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[PaIniciarSesion]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para inicio de sesion
-- =============================================
CREATE   PROCEDURE [dbo].[PaIniciarSesion]
	-- Add the parameters for the stored procedure here
	@username varchar(30)
	--,@password varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		  U.username, 
		  U.password,
		  U.rol
	FROM TbUser AS U 
	WHERE eliminado = 0 
		  AND U.username = @username 
		  --AND U.password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarActivos]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/2024
-- Description:	Lista todos los activos en la base de datos
-- =============================================
CREATE PROCEDURE [dbo].[PaListarActivos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.nombre,
		A.descripcion,
		CONCAT( P.provincia,',',C.canton,',', Ad.distrito, ',',A.detalleDireccion) as 'Direccion',
		CASE 
			WHEN A.estado = 'A' then 'Alquilada'
			WHEN A.estado = 'V' then 'Vendida'
			WHEN A.estado = 'D' then 'Disponible'
			ELSE 'Desconocido'
		END AS 'Estado',
		CASE
			WHEN A.tipoAsset = 'A' THEN 'Activo'
			WHEN A.tipoAsset = 'C' THEN 'Casa'
			WHEN A.tipoAsset = 'T' THEN 'Terreno'
			WHEN A.tipoAsset = 'E' THEN 'Edificio'
			ELSE 'Desconocido'
		END AS 'TipoActivo',
		CASE
			WHEN A.disponibilidad = 'V' THEN 'Venta'
			WHEN A.disponibilidad = 'A' THEN 'Alquiler'
			ELSE 'Desconocido'
		END AS 'Disponibilidad',
		A.precioGlobal,
		A.precioPorMes,
		A.precioPorNoche,
		A.imagenSrc
	FROM TbAssets A
	INNER JOIN TbAddresses AD on A.idAddress = AD.idAddress
	INNER JOIN TbProvincias P on AD.idProvincia = P.idProvincia
	INNER JOIN TbCantones C on AD.idCanton = C.idCanton
	WHERE eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarAdvertisement]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que edia en TbAdvertisement
-- =============================================
CREATE   PROCEDURE [dbo].[PaListarAdvertisement]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		A.idAdvertisement,
		A.titulo,
		A.descripcion,
		A.fechaInicio,
		A.fechaFin,
		A.envioPeriodico,
		A.intervaloDiasNotificacion,
		a.envioActivo
	FROM TbAdvertisement A
	WHERE eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarMantenimientos]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para listar los mantenimientos
-- =============================================
CREATE   PROCEDURE [dbo].[PaListarMantenimientos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.nombre as 'NombreActivo',
		M.detalle,
		M.fechaRegistro
	FROM TbMaintenance M
	INNER JOIN TbPaperwork AS P on P.idPaperwork = M.idPaperwork
	INNER JOIN TbAssets as A on A.idAsset = P.idAsset
	WHERE M.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarUsuarios]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para listar todos los usuarios activos
-- =============================================
CREATE   PROCEDURE [dbo].[PaListarUsuarios] 
	-- Add the parameters for the stored procedure 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		P.cedula,
		P.nombreCompleto,
		P.telefono,
		P.correoElectronico,
		U.username,
		U.rol
	FROM TbPerson as P
	INNER JOIN TbUser as U ON U.idUser = P.idUsuario
	WHERE P.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaMostrarAlquileres]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22/06/2024
-- Description:	Procedimiento almacenado para listar todos los alquileres realizados
-- =============================================
CREATE   PROCEDURE [dbo].[PaMostrarAlquileres]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		R.idRental,
		A.nombre,
		R.fechaRegistroAlquiler,
		R.activo,
		R.fechaInicio,
		R.fechaFin,
		R.jsonDetalles,
		A.idAsset
	FROM TbRental R
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE R.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaMostrarVentas]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22/06/2024
-- Description:	Procedimiento almacenado para listar todas las ventas realizadas
-- =============================================
CREATE   PROCEDURE [dbo].[PaMostrarVentas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		S.idSelling,
		S.fechaVenta,
		A.idAsset,
		A.nombre
	FROM TbSelling AS S
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = S.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE S.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaRegisterPerson]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 18/06/2024
-- Description: Procedimiento almacenado para registrar un usuario
-- =============================================
CREATE   PROCEDURE [dbo].[PaRegisterPerson]
    -- Add the parameters for the stored procedure here
    @cedula varchar(9),
    @nombreCompleto varchar(60),
    @telefono varchar(30),
    @correo varchar(max),
    @username varchar(30),
    @password varchar(60),
    @rol char(1)
AS
BEGIN
    DECLARE @idUsuario int;
    DECLARE @errorMsg nvarchar(255);

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Start a transaction
    BEGIN TRANSACTION;

    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM TbUser WHERE username = @username)
    BEGIN
        SET @errorMsg = 'El nombre de usuario ya existe.';
        RAISERROR (@errorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Check if the cedula already exists
    IF EXISTS (SELECT 1 FROM TbPerson WHERE cedula = @cedula)
    BEGIN
        SET @errorMsg = 'La cédula ya está registrada.';
        RAISERROR (@errorMsg, 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- If both checks pass, insert the user
    BEGIN TRY
        INSERT INTO TbUser (username, password, rol) 
        VALUES (@username, @password, @rol);

        SELECT @idUsuario = SCOPE_IDENTITY();

        -- Insert the person
        INSERT INTO TbPerson (cedula, nombreCompleto, telefono, correoElectronico, idUsuario) 
        VALUES (@cedula, @nombreCompleto, @telefono, @correo, @idUsuario);

        -- Commit the transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if any error occurs
        ROLLBACK TRANSACTION;
        -- Return the error message
        SET @errorMsg = ERROR_MESSAGE();
        RAISERROR (@errorMsg, 16, 1);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[PaVender]    Script Date: 23/06/2024 22:44:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para vender un activo
-- =============================================
CREATE   PROCEDURE [dbo].[PaVender]
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fecha date
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'V');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbSelling (
			idPaperwork
			,fechaVenta
	) VALUES (
			@idPaperwork
			,@fecha
	)

	UPDATE TbAssets SET estado = 'V' WHERE idAsset = @idAsset

END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAddresses por el campo IdCanton con la tabla TbCantones por el campo IdCanton' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAddresses', @level2type=N'CONSTRAINT',@level2name=N'FkTbAddressesIdCantonTbCantonesIdCanton'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAddresses por el campo idProvincia con la tabla TbProvincias por el campo IdProvincia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAddresses', @level2type=N'CONSTRAINT',@level2name=N'FkTbAddressesidProvinciaTbProvinciasIdProvincia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acepta unicamente los valores D-Disponible, A-Alqilada, V-Vendida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'COLUMN',@level2name=N'estado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acepta unicamente los valores A-Activo,C-Casa,T-Terreno,E-Edificio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'COLUMN',@level2name=N'tipoAsset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permite unicamenete V-Venta, A-Alquiler' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'COLUMN',@level2name=N'disponibilidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAssets por el campo IdAddress con la tabla TbAddresses por el campo IdAddress' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'FkTbAssetsIdAddressTbAddressesIdAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo dispobilidad para permitir unicamenete V-Venta, A-Alquiler' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsDisponibilidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo estado en la taba TbAssets para aceptar unicamente los valores D-Disponible, A-Alqilada, V-Vendida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo tipoAsset en la taba TbAssets para aceptar unicamente los valores A-Activo,C-Casa,T-Terreno,E-Edificio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsTipoAsset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permite unicamente el valor F-Finalizado o D-Descartado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbFinishedMaintenance', @level2type=N'COLUMN',@level2name=N'motivoCierre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbFinishedMaintenance por el campo IdMaintenance con la tabla TbMaintenance por el campo IdMaintenance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbFinishedMaintenance', @level2type=N'CONSTRAINT',@level2name=N'FkTbFinishedMaintenanceIdMaintenanceTbMaintenanceIdMaintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo motivo cierre para permitir unicamente el valor F-Finalizado o D-Descartado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbFinishedMaintenance', @level2type=N'CONSTRAINT',@level2name=N'CkTbFinishedMaintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbMaintenance por el campo IdPaperwork con la tabla TbPaperwork por el campo IdPaperwork' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbMaintenance', @level2type=N'CONSTRAINT',@level2name=N'FkTbMaintenanceIdPaperworkTbPaperworkIdPaperwork'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Acepta unicamente los valores  M - Mantenimiento ,V - Venta ,A - Alquiler' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPaperwork', @level2type=N'COLUMN',@level2name=N'tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbPaperwork por el campo IdAsset con la tabla TbAssets por el campo IdAsset' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPaperwork', @level2type=N'CONSTRAINT',@level2name=N'FkTbPaperworkIdAssetTbAssetsIdAsset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbPaperwork por el campo IdPerson con la tabla TbPerson por el campo IdPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPaperwork', @level2type=N'CONSTRAINT',@level2name=N'FkTbPaperworkIdPersonTbPersonIdPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo tipo en la tabla TbPaperwork para aceptar unicamente los valores ,M - Mantenimiento ,V - Venta ,A - Alquiler' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPaperwork', @level2type=N'CONSTRAINT',@level2name=N'CkTbPaperworkTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Campo de Id Unico para la tabla persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'COLUMN',@level2name=N'idPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave primaria en la tabla TbPerson sobre el campo idPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'CONSTRAINT',@level2name=N'PkTbPersonIdPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor unico del camo Cedula en la tabla TbPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'CONSTRAINT',@level2name=N'UkTbPersonCedula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor unico del campo CorreoElectronico en la tabla TbPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'CONSTRAINT',@level2name=N'UkTbPersonEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor unico en la tabla TbPerson sobre el campo de idUsuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'CONSTRAINT',@level2name=N'UkTbPersonIdUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tanla TbPerson por el campo IdUsuario con la tabla TbUser por el campo IdUser' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbPerson', @level2type=N'CONSTRAINT',@level2name=N'FkTbPersonIdUsuarioTbUserIdUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbRental por el campo IdPaperwork con la tabla TbPaperwork con el campo IdPaperwork' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbRental', @level2type=N'CONSTRAINT',@level2name=N'FkTbRentalIdPaperworkTbPaperworkIdPaperwork'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbSelling por el campo IdPaperwork con la tabla TbPaperwork por el campo IdPaperwork' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbSelling', @level2type=N'CONSTRAINT',@level2name=N'FkTbSellingIdPaperworkTbPaperworkIdPaperwork'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se permiten unicamente los valores  A - Administrador, F - Funcionario , O - Operario, C - Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbUser', @level2type=N'COLUMN',@level2name=N'rol'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se permiten unicamente los valores  A - Administrador, F - Funcionario , O - Operario, C - Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo de rol en la tabla TbUser en donde se permiten unicamente los valores  A - Administrador, F - Funcionario , O - Operario, C - Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbUser', @level2type=N'CONSTRAINT',@level2name=N'CkTbUserRole'
GO
USE [master]
GO
ALTER DATABASE [DbSpringsDeLiberia] SET  READ_WRITE 
GO
