-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para crear un nuevo alquiler
-- =============================================
CREATE OR ALTER PROCEDURE PaAlquilar
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fechaRegistroAlquiler date,
	@fechaInicio date,
	@fechaFin date,
	@jsonDetalles nvarchar(MAX)
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'A');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbRental (
			idPaperwork
			,fechaRegistroAlquiler
			,fechaInicio
			,fechaFin
			,jsonDetalles
	) VALUES (
			@idPaperwork
			,@fechaRegistroAlquiler
			,@fechaInicio
			,@fechaFin
			,@jsonDetalles
	)

	UPDATE TbAssets SET estado = 'A' WHERE idAsset = @idAsset

END
GO
