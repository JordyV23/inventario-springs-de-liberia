
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
		CONVERT(varchar,R.fechaRegistroAlquiler) as 'Fecha de Registro'
		,A.nombre as 'Activo Alquilado'
		,CONVERT(varchar,R.fechaInicio) as 'Fecha de Inicio'
		,CONVERT(varchar,R.fechaFin) as 'Fecha de Fin'
		,DATEDIFF(DAY,R.fechaInicio,R.fechaFin) as 'Dias Alquilado'
	FROM TbRental R
	INNER JOIN TbPaperwork AS P on P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	WHERE MONTH(R.fechaRegistroAlquiler) = @mes AND  YEAR(R.fechaRegistroAlquiler) = @year
END
GO
