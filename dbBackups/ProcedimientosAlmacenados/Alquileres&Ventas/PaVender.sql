-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para vender un activo
-- =============================================
CREATE OR ALTER PROCEDURE PaVender
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fecha date
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'V');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbSelling (
			idPaperwork
			,fechaVenta
	) VALUES (
			@idPaperwork
			,@fecha
	)

	UPDATE TbAssets SET estado = 'V' WHERE idAsset = @idAsset

END
GO
