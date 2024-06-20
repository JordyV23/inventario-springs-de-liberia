-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para eliminar de manera logica una persona y su usuario
-- =============================================
CREATE PROCEDURE PaInhabilitarPerson 
	-- Add the parameters for the stored procedure here
	@idPerson int
AS
BEGIN
	DECLARE @idUsuario int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @idUsuario = idUsuario FROM TbPerson;

	UPDATE TbPerson SET eliminado = 1 WHERE idPerson = @idPerson
	UPDATE TbUser SET eliminado = 1 WHERE idUser = @idUsuario

END
GO
