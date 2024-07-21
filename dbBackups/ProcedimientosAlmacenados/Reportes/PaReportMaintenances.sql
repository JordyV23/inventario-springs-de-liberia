-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE OR ALTER PROCEDURE PaReportUnfinishedMaintenances
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
