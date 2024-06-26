USE [master]
GO
/****** Object:  Database [DbSpringsDeLiberia]    Script Date: 18/06/2024 18:23:21 ******/
CREATE DATABASE [DbSpringsDeLiberia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbSpringsDeLiberia', FILENAME = N'/var/opt/mssql/data/DbSpringsDeLiberia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbSpringsDeLiberia_log', FILENAME = N'/var/opt/mssql/data/DbSpringsDeLiberia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[TbAddresses]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbAdvertisement]    Script Date: 18/06/2024 18:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbAdvertisement](
	[idAdvertisement] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](30) NOT NULL,
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
/****** Object:  Table [dbo].[TbAssets]    Script Date: 18/06/2024 18:23:21 ******/
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
 CONSTRAINT [PkTbAssets] PRIMARY KEY CLUSTERED 
(
	[idAsset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCantones]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbFinishedMaintenance]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbMaintenance]    Script Date: 18/06/2024 18:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbMaintenance](
	[idMaintenance] [int] NOT NULL,
	[idPaperwork] [int] NOT NULL,
	[detalle] [text] NOT NULL,
	[pendiente] [bit] NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbMaintenance] PRIMARY KEY CLUSTERED 
(
	[idMaintenance] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPaperwork]    Script Date: 18/06/2024 18:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPaperwork](
	[idPaperwork] [int] NOT NULL,
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
/****** Object:  Table [dbo].[TbPerson]    Script Date: 18/06/2024 18:23:21 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UkTbPersonCedula] UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UkTbPersonEmail] UNIQUE NONCLUSTERED 
(
	[emailHash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UkTbPersonIdUsuario] UNIQUE NONCLUSTERED 
(
	[idPerson] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProvincias]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbRental]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbSelling]    Script Date: 18/06/2024 18:23:21 ******/
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
/****** Object:  Table [dbo].[TbUser]    Script Date: 18/06/2024 18:23:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUser](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varbinary](max) NOT NULL,
	[rol] [char](1) NOT NULL,
	[eliminado] [bit] NOT NULL,
 CONSTRAINT [PK_TbUser] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbMaintenance] ADD  CONSTRAINT [DF_TbMaintenance_pendiente]  DEFAULT ((1)) FOR [pendiente]
GO
ALTER TABLE [dbo].[TbMaintenance] ADD  CONSTRAINT [DF_TbMaintenance_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbPaperwork] ADD  CONSTRAINT [DF_TbPaperwork_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbPerson] ADD  CONSTRAINT [DF_TbPerson_eliminado]  DEFAULT ((0)) FOR [eliminado]
GO
ALTER TABLE [dbo].[TbRental] ADD  CONSTRAINT [DF_TbRental_activo]  DEFAULT ((0)) FOR [activo]
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
ALTER TABLE [dbo].[TbPaperwork]  WITH CHECK ADD  CONSTRAINT [CkTbPaperworkTipo] CHECK  (([tipo]='A' OR [tipo]='V' OR [tipo]='M'))
GO
ALTER TABLE [dbo].[TbPaperwork] CHECK CONSTRAINT [CkTbPaperworkTipo]
GO
ALTER TABLE [dbo].[TbUser]  WITH CHECK ADD  CONSTRAINT [CkTbUserRole] CHECK  (([rol]='C' OR [rol]='O' OR [rol]='F' OR [rol]='A'))
GO
ALTER TABLE [dbo].[TbUser] CHECK CONSTRAINT [CkTbUserRole]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAddresses por el campo IdCanton con la tabla TbCantones por el campo IdCanton' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAddresses', @level2type=N'CONSTRAINT',@level2name=N'FkTbAddressesIdCantonTbCantonesIdCanton'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAddresses por el campo idProvincia con la tabla TbProvincias por el campo IdProvincia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAddresses', @level2type=N'CONSTRAINT',@level2name=N'FkTbAddressesidProvinciaTbProvinciasIdProvincia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbAssets por el campo IdAddress con la tabla TbAddresses por el campo IdAddress' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'FkTbAssetsIdAddressTbAddressesIdAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo dispobilidad para permitir unicamenete V-Venta, A-Alquiler' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsDisponibilidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo estado en la taba TbAssets para aceptar unicamente los valores D-Disponible, A-Alqilada, V-Vendida' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo tipoAsset en la taba TbAssets para aceptar unicamente los valores A-Activo,C-Casa,T-Terreno,E-Edificio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbAssets', @level2type=N'CONSTRAINT',@level2name=N'CkTbAssetsTipoAsset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbFinishedMaintenance por el campo IdMaintenance con la tabla TbMaintenance por el campo IdMaintenance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbFinishedMaintenance', @level2type=N'CONSTRAINT',@level2name=N'FkTbFinishedMaintenanceIdMaintenanceTbMaintenanceIdMaintenance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Relacion entre la tabla TbMaintenance por el campo IdPaperwork con la tabla TbPaperwork por el campo IdPaperwork' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbMaintenance', @level2type=N'CONSTRAINT',@level2name=N'FkTbMaintenanceIdPaperworkTbPaperworkIdPaperwork'
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se permiten unicamente los valores  A - Administrador, F - Funcionario , O - Operario, C - Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Restriccion sobre el campo de rol en la tabla TbUser en donde se permiten unicamente los valores  A - Administrador, F - Funcionario , O - Operario, C - Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TbUser', @level2type=N'CONSTRAINT',@level2name=N'CkTbUserRole'
GO
USE [master]
GO
ALTER DATABASE [DbSpringsDeLiberia] SET  READ_WRITE 
GO
