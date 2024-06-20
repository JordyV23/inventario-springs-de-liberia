-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para inicio de sesion
-- =============================================
CREATE OR ALTER PROCEDURE PaIniciarSesion
	-- Add the parameters for the stored procedure here
	@username varchar(30),
	@password varbinary(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		  U.username, 
		  U.password,
		  U.rol
	FROM TbUser AS U 
	WHERE eliminado = 0 
		  AND U.username = @username 
		  AND U.password = @password
END
GO
