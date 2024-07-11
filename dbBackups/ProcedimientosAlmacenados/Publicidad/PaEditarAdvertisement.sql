-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que editar en TbAdvertisement
-- =============================================
CREATE OR ALTER PROCEDURE PaEditarAdvertisement 
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
