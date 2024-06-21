-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para crear un mantenimiento
-- =============================================
CREATE OR ALTER PROCEDURE PaCrearMantenimiento
	-- Add the parameters for the stored procedure here
	@idAsset int,
	@idPerson int, 
	@fecha date,
	@detalle text
AS
BEGIN
	DECLARE @idPaperwork int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO TbPaperwork (idAsset,idPerson, tipo) VALUES (@idAsset,@idPerson,'A');
	SELECT @idPaperwork = SCOPE_IDENTITY();

	INSERT INTO TbMaintenance(
			idPaperwork
			,fechaRegistro
			,detalle
	) VALUES (
			@idPaperwork
			,@fecha
			,@detalle
	)

END
GO
