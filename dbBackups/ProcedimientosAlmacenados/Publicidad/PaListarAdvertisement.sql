-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado que edia en TbAdvertisement
-- =============================================
CREATE OR ALTER PROCEDURE PaListarAdvertisement
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		A.idAdvertisement,
		A.titulo,
		CONVERT(varchar,A.fechaInicio) AS 'fechaInicio',
		CASE A.envioActivo 
			WHEN 1 THEN 'Activo'
			WHEN 0 THEN 'Inactivo'
		END AS 'envioActivo',
		A.descripcion,
		CONVERT(varchar,A.fechaFin) AS 'fechaFin',
		A.envioPeriodico ,
		A.intervaloDiasNotificacion
	FROM TbAdvertisement A
	WHERE eliminado = 0
END
GO
