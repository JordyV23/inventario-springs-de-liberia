
-- =============================================
-- Create date: 22/07/2024
-- Description:	Procedimiento para listar los correos y los nombres de los clientes para el envio de promociones
-- =============================================
CREATE OR ALTER PROCEDURE PaListarUsuariosCorreos
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		P.nombreCompleto,
		P.correoElectronico
	FROM TbPerson P
	INNER JOIN TbUser U ON P.idUsuario = U.idUser
	WHERE U.rol = 'C'
END
GO
