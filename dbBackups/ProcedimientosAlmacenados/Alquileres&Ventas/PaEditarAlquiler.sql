
-- =============================================
-- Create date: 19/06/2024
-- Description:	Procedimiento almacenado para editar un alquiler
-- =============================================
CREATE or ALTER PROCEDURE PaEditarAlquiler
	-- Add the parameters for the stored procedure here
	@idAlquiler int,
	@fechaFin date, 
	@alquilerActivo bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    -- Insert statements for procedure here
	UPDATE TbRental 
	SET fechaFin = @fechaFin,
	activo = @alquilerActivo
	WHERE idRental = @idAlquiler

	IF @alquilerActivo = 0
	BEGIN
		-- Update statements for TbAssets table
		UPDATE A 
			SET A.estado = 'D'
		FROM TbAssets A
		INNER JOIN TbRental AS R ON R.idRental = @idAlquiler
		INNER JOIN TbPaperwork AS P ON P.idPaperwork = R.idPaperwork
		WHERE A.idAsset = P.idAsset
	END

	
END
GO
