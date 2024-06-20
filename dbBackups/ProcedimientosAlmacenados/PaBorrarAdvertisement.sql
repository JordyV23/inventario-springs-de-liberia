-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para borrar una publicidad
-- =============================================
CREATE OR ALTER PROCEDURE PaBorrarAdvertisement 
	-- Add the parameters for the stored procedure here
	@idPublicidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TbAdvertisement SET 
		 eliminado = 1 
		,envioActivo = 0
	WHERE idAdvertisement = @idPublicidad

	
	
END
GO
