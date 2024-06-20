-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para cerrar un mantenimiento
-- =============================================
CREATE OR ALTER PROCEDURE PaCerrarMantenimiento
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
