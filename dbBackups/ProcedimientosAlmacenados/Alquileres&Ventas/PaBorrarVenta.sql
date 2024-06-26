-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar una venta
-- =============================================
CREATE OR ALTER PROCEDURE PaBorrarVenta
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
