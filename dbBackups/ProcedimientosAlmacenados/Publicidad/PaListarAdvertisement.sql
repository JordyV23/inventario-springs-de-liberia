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
		A.descripcion,
		A.fechaInicio,
		A.fechaFin,
		A.envioPeriodico,
		A.intervaloDiasNotificacion,
		a.envioActivo
	FROM TbAdvertisement A
	WHERE eliminado = 0
END
GO
