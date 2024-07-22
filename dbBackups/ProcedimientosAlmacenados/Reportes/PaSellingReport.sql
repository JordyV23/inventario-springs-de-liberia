
-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE OR ALTER PROCEDURE PaSellingReport 
	-- Add the parameters for the stored procedure here
	@mes int, 
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		S.idSelling,
		A.nombre as 'activo',
		CONVERT(varchar,S.fechaVenta) as 'fechaVenta'
	FROM TbSelling S
	INNER JOIN TbPaperwork AS P ON S.idPaperwork = P.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE MONTH(S.fechaVenta) = @mes AND  YEAR(S.fechaVenta) = @year

END
GO
