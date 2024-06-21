-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un mantenimiento
-- =============================================
CREATE OR ALTER PROCEDURE PaBorrarMantenimiento
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
