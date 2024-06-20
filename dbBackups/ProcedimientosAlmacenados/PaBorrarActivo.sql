-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar un activo
-- =============================================
CREATE OR ALTER PROCEDURE PaBorrarActivo
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
