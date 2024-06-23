-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un alquiler
-- =============================================
CREATE OR ALTER PROCEDURE PaBorrarAlquiler
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
