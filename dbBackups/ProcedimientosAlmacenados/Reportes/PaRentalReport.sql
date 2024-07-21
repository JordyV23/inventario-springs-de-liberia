
-- =============================================
-- Create date: 20/7/24
-- Description:	Procedimiento almacenado para listar lo resportes de la renta por mes
-- =============================================
CREATE OR ALTER PROCEDURE PaRentalReport 
	-- Add the parameters for the stored procedure here
	@mes int, 
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		R.fechaRegistroAlquiler
		,A.nombre as 'activo'
		,CONVERT(varchar,R.fechaInicio) as 'fechaInicio'
		,CONVERT(varchar,R.fechaFin) as 'fechaFin'
		,DATEDIFF(DAY,R.fechaInicio,R.fechaFin) as 'diasAlquilado'
	FROM TbRental R
	INNER JOIN TbPaperwork AS P on P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE MONTH(R.fechaRegistroAlquiler) = @mes OR  YEAR(R.fechaRegistroAlquiler) = @year
END
GO
