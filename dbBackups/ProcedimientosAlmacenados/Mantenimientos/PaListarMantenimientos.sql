-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para listar los mantenimientos
-- =============================================
CREATE OR ALTER PROCEDURE PaListarMantenimientos
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
