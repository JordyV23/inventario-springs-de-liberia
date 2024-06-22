-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que inserta en TbAdvertisement
-- =============================================
CREATE OR ALTER PROCEDURE PaCrearAdvertisement 
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
