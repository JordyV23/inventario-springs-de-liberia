-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para agregar un activo
-- =============================================
CREATE OR ALTER PROCEDURE PaAgregarActivo 
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
