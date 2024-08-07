USE [master]
GO
/****** Object:  Database [DbSpringsDeLiberia]    Script Date: 22/07/2024 22:42:03 ******/
CREATE DATABASE [DbSpringsDeLiberia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbSpringsDeLiberia', FILENAME = N'/var/opt/mssql/data/DbSpringsDeLiberia.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[TbAddresses]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbAdvertisement]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbAssets]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbCantones]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbFinishedMaintenance]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbMaintenance]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbPaperwork]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbPerson]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbProvincias]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbRental]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbSelling]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  Table [dbo].[TbUser]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaAgregarActivo]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaAlquilar]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaBorrarActivo]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaBorrarAdvertisement]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaBorrarAlquiler]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaBorrarMantenimiento]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaBorrarVenta]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaCerrarMantenimiento]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaCrearAdvertisement]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaCrearMantenimiento]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaEditarActivo]    Script Date: 22/07/2024 22:42:04 ******/
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
	@disponibilidad char(1)
	--,@imagenSrc varchar(50)
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
		--,imagenSrc = @imagenSrc
	WHERE idAsset = @idActivo

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[PaEditarAdvertisement]    Script Date: 22/07/2024 22:42:04 ******/
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
	@intervalo int,
	@isActive bit
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
		,envioActivo = @isActive
	WHERE idAdvertisement = @idAvertisement
END
GO
/****** Object:  StoredProcedure [dbo].[PaEditarAlquiler]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 19/06/2024
-- Description:	Procedimiento almacenado para editar un alquiler
-- =============================================
CREATE   PROCEDURE [dbo].[PaEditarAlquiler]
	-- Add the parameters for the stored procedure here
	@idAlquiler int,
	@fechaFin date, 
	@alquilerActivo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
	UPDATE TbRental 
	SET fechaFin = @fechaFin,
	activo = @alquilerActivo
	WHERE idRental = @idAlquiler

	IF @alquilerActivo = 0
	BEGIN
		-- Update statements for TbAssets table
		UPDATE A 
			SET A.estado = 'D'
		FROM TbAssets A
		INNER JOIN TbRental AS R ON R.idRental = @idAlquiler
		INNER JOIN TbPaperwork AS P ON P.idPaperwork = R.idPaperwork
		WHERE A.idAsset = P.idAsset
	END

	
END
GO
/****** Object:  StoredProcedure [dbo].[PaEditPerson]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaInhabilitarPerson]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaIniciarSesion]    Script Date: 22/07/2024 22:42:04 ******/
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
		  P.idPerson,
		  U.username, 
		  U.password,
		  U.rol
	FROM TbUser AS U 
	INNER JOIN TbPerson AS P ON P.idUsuario = U.idUser
	WHERE U.eliminado = 0 
		  AND U.username = @username 
		  --AND U.password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarActivos]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 19/06/2024
-- Description:	Lista todos los activos en la base de datos
-- =============================================
CREATE   PROCEDURE [dbo].[PaListarActivos]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.idAsset,
		A.nombre,
		A.descripcion,
		CONCAT( P.provincia,', ',C.canton,', ', Ad.distrito, ', ',A.detalleDireccion) as 'Direccion',
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
		A.imagenSrc,
		P.idProvincia,
		C.idCanton,
		AD.distrito
	FROM TbAssets A
	INNER JOIN TbAddresses AD on A.idAddress = AD.idAddress
	INNER JOIN TbProvincias P on AD.idProvincia = P.idProvincia
	INNER JOIN TbCantones C on AD.idCanton = C.idCanton
	WHERE eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarAdvertisement]    Script Date: 22/07/2024 22:42:04 ******/
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
		CONVERT(varchar,A.fechaInicio) AS 'fechaInicio',
		CASE A.envioActivo 
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo'
		END AS 'envioActivo',
		A.descripcion,
		CONVERT(varchar,A.fechaFin) AS 'fechaFin',
		A.envioPeriodico ,
		A.intervaloDiasNotificacion
	FROM TbAdvertisement A
	WHERE eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarMantenimientos]    Script Date: 22/07/2024 22:42:04 ******/
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
		M.idMaintenance,
		A.nombre as 'NombreActivo',
		M.detalle,
		CONVERT(varchar, M.fechaRegistro) as fechaRegistro,
		CASE M.pendiente 
			WHEN 1 THEN 'Pendiente'
			WHEN 0 THEN 'Finalizado'
		END AS 'estadoMantenimiento',
		M.pendiente,
		A.idAsset
	FROM TbMaintenance M
	INNER JOIN TbPaperwork AS P on P.idPaperwork = M.idPaperwork
	INNER JOIN TbAssets as A on A.idAsset = P.idAsset
	WHERE M.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarUsuarios]    Script Date: 22/07/2024 22:42:04 ******/
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
		U.rol,
		P.idPerson,
		U.password
	FROM TbPerson as P
	INNER JOIN TbUser as U ON U.idUser = P.idUsuario
	WHERE P.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaListarUsuariosCorreos]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 22/07/2024
-- Description:	Procedimiento para listar los correos y los nombres de los clientes para el envio de promociones
-- =============================================
CREATE   PROCEDURE [dbo].[PaListarUsuariosCorreos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		P.nombreCompleto,
		P.correoElectronico
	FROM TbPerson P
	INNER JOIN TbUser U ON P.idUsuario = U.idUser
	WHERE U.rol = 'C'
END
GO
/****** Object:  StoredProcedure [dbo].[PaMostrarAlquileres]    Script Date: 22/07/2024 22:42:04 ******/
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
		CONVERT(varchar, R.fechaInicio) as 'fechaInicio',
		CONVERT(varchar, R.fechaFin) as 'fechaFin',
		R.activo,
		CONVERT(varchar, R.fechaRegistroAlquiler) as 'fechaRegistroAlquiler',
		R.jsonDetalles,
		P.idPerson,
		Pe.nombreCompleto,
		A.idAsset
	FROM TbRental R
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	INNER JOIN TbPerson as Pe on Pe.idPerson = P.idPerson
	WHERE R.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaMostrarVentas]    Script Date: 22/07/2024 22:42:04 ******/
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
		A.nombre,
		CONVERT(varchar,S.fechaVenta) as 'fechaVenta',
		A.idAsset
	FROM TbSelling AS S
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = S.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE S.eliminado = 0
END
GO
/****** Object:  StoredProcedure [dbo].[PaRegisterPerson]    Script Date: 22/07/2024 22:42:04 ******/
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
/****** Object:  StoredProcedure [dbo].[PaRentalReport]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE   PROCEDURE [dbo].[PaRentalReport] 
	-- Add the parameters for the stored procedure here
	@mes int, 
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		CONVERT(varchar,R.fechaRegistroAlquiler) as 'Fecha de Registro'
		,A.nombre as 'Activo Alquilado'
		,CONVERT(varchar,R.fechaInicio) as 'Fecha de Inicio'
		,CONVERT(varchar,R.fechaFin) as 'Fecha de Fin'
		,DATEDIFF(DAY,R.fechaInicio,R.fechaFin) as 'Dias Alquilado'
	FROM TbRental R
	INNER JOIN TbPaperwork AS P on P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE MONTH(R.fechaRegistroAlquiler) = @mes AND  YEAR(R.fechaRegistroAlquiler) = @year
END
GO
/****** Object:  StoredProcedure [dbo].[PaRentalReportByProperty]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE   PROCEDURE [dbo].[PaRentalReportByProperty]
	-- Add the parameters for the stored procedure here
	@idAsset int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		CONVERT(varchar,R.fechaRegistroAlquiler)  as 'fechaRegistroAlquiler'
		,A.nombre as 'activo'
		,CONVERT(varchar,R.fechaInicio) as 'fechaInicio'
		,CONVERT(varchar,R.fechaFin) as 'fechaFin'
		,DATEDIFF(DAY,R.fechaInicio,R.fechaFin) as 'diasAlquilado'
	FROM TbRental R
	INNER JOIN TbPaperwork AS P on P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE P.idAsset = @idAsset

END
GO
/****** Object:  StoredProcedure [dbo].[PaReportUnfinishedMaintenances]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE   PROCEDURE [dbo].[PaReportUnfinishedMaintenances]
	-- Add the parameters for the stored procedure here
	@idAsset int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		CONVERT(varchar,M.fechaRegistro) as 'fechaRegistro',
		M.detalle,
		M.pendiente,
		A.nombre
	FROM TbMaintenance M
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = M.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE M.pendiente = 1

END
GO
/****** Object:  StoredProcedure [dbo].[PaSellingReport]    Script Date: 22/07/2024 22:42:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE   PROCEDURE [dbo].[PaSellingReport] 
	-- Add the parameters for the stored procedure here
	@mes int, 
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		S.idSelling,
		A.nombre as 'activo',
		CONVERT(varchar,S.fechaVenta) as 'fechaVenta'
	FROM TbSelling S
	INNER JOIN TbPaperwork AS P ON S.idPaperwork = P.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE MONTH(S.fechaVenta) = @mes AND  YEAR(S.fechaVenta) = @year

END
GO
/****** Object:  StoredProcedure [dbo].[PaVender]    Script Date: 22/07/2024 22:42:04 ******/
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
