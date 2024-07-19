-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para inicio de sesion
-- =============================================
CREATE OR ALTER PROCEDURE PaIniciarSesion
	-- Add the parameters for the stored procedure here
	@username varchar(30)
	--,@password varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		  P.idPerson,
		  U.username, 
		  U.password,
		  U.rol
	FROM TbUser AS U 
	INNER JOIN TbPerson AS P ON P.idUsuario = U.idUser
	WHERE U.eliminado = 0 
		  AND U.username = @username 
		  --AND U.password = @password
END
GO
