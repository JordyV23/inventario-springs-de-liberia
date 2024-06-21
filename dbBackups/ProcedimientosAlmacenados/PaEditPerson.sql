-- =============================================
-- Create date: 18/06/2024
-- Description:	Procedimiento almacenado para editar un usuario
-- =============================================
CREATE OR ALTER PROCEDURE PaEditPerson
	-- Add the parameters for the stored procedure here
	@idPerson int,
	--@idUsuario int,
	@cedula varchar(9),
	@nombreCompleto varchar(60),
	@telefono varchar(30),
	@correo varchar(max),
	--@username varchar(30),
	@password varchar(60),
	@rol char(1)

AS
BEGIN
	DECLARE @idUsuario int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE TbPerson SET 
		cedula = @cedula
		,nombreCompleto = @nombreCompleto 
		,telefono = @telefono
		,correoElectronico=@correo 
	WHERE idPerson = @idPerson

	SELECT @idUsuario = idUsuario FROM TbPerson WHERE idPerson = @idPerson

    UPDATE TbUser SET 
		--username = @username ,
		password = @password, 
		rol = @rol 
	WHERE idUser = @idUsuario
END
GO
