-- =============================================
-- Create date: 19/06/24
-- Description:	Procedimiento almacenado para listar todos los usuarios activos
-- =============================================
CREATE OR ALTER PROCEDURE PaListarUsuarios 
	-- Add the parameters for the stored procedure 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		P.cedula,
		P.nombreCompleto,
		P.telefono,
		P.correoElectronico,
		U.username,
		U.rol,
		P.idPerson,
		U.password
	FROM TbPerson as P
	INNER JOIN TbUser as U ON U.idUser = P.idUsuario
	WHERE P.eliminado = 0
END
GO
