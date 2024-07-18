-- =============================================
-- Create date: 22/06/2024
-- Description:	Procedimiento almacenado para listar todos los alquileres realizados
-- =============================================
CREATE OR ALTER PROCEDURE PaMostrarAlquileres
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		R.idRental,
		A.nombre,
		CONVERT(varchar, R.fechaInicio) as 'fechaInicio',
		CONVERT(varchar, R.fechaFin) as 'fechaFin',
		R.activo,
		CONVERT(varchar, R.fechaRegistroAlquiler) as 'fechaRegistroAlquiler',
		R.jsonDetalles,
		P.idPerson,
		Pe.nombreCompleto,
		A.idAsset
	FROM TbRental R
	INNER JOIN TbPaperwork AS P ON P.idPaperwork = R.idPaperwork
	INNER JOIN TbAssets AS A ON A.idAsset = P.idAsset
	INNER JOIN TbPerson as Pe on Pe.idPerson = P.idPerson
	WHERE R.eliminado = 0
END
GO
