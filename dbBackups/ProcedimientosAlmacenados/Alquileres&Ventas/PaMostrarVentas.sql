-- =============================================
-- Create date: 22/06/2024
-- Description:	Procedimiento almacenado para listar todas las ventas realizadas
-- =============================================
CREATE OR ALTER PROCEDURE PaMostrarVentas
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		S.idSelling,
		S.fechaVenta,
		A.idAsset,
		A.nombre
	FROM TbSelling AS S
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = S.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE S.eliminado = 0
END
GO
