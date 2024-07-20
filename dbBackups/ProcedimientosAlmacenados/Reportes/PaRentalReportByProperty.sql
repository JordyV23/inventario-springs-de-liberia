-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE OR ALTER PROCEDURE PaRentalReportByProperty
	-- Add the parameters for the stored procedure here
	@idAsset int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		R.fechaRegistroAlquiler
		,A.nombre as 'activo'
		,R.fechaInicio
		,R.fechaFin
		,DATEDIFF(DAY,R.fechaInicio,R.fechaFin) as 'diasAlquilado'
	FROM TbRental R
	INNER JOIN TbPaperwork AS P on P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE P.idAsset = @idAsset

END
GO
