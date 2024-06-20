-- =============================================
-- Create date: 19/06/2024
-- Description:	Lista todos los activos en la base de datos
-- =============================================
CREATE PROCEDURE PaListarActivos
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.nombre,
		A.descripcion,
		CONCAT( P.provincia,',',C.canton,',', Ad.distrito, ',',A.detalleDireccion) as 'Direccion',
		CASE 
			WHEN A.estado = 'A' then 'Alquilada'
			WHEN A.estado = 'V' then 'Vendida'
			WHEN A.estado = 'D' then 'Disponible'
			ELSE 'Desconocido'
		END AS 'Estado',
		CASE
			WHEN A.tipoAsset = 'A' THEN 'Activo'
			WHEN A.tipoAsset = 'C' THEN 'Casa'
			WHEN A.tipoAsset = 'T' THEN 'Terreno'
			WHEN A.tipoAsset = 'E' THEN 'Edificio'
			ELSE 'Desconocido'
		END AS 'TipoActivo',
		CASE
			WHEN A.disponibilidad = 'V' THEN 'Venta'
			WHEN A.disponibilidad = 'A' THEN 'Alquiler'
			ELSE 'Desconocido'
		END AS 'Disponibilidad',
		A.precioGlobal,
		A.precioPorMes,
		A.precioPorNoche,
		A.imagenSrc
	FROM TbAssets A
	INNER JOIN TbAddresses AD on A.idAddress = AD.idAddress
	INNER JOIN TbProvincias P on AD.idProvincia = P.idProvincia
	INNER JOIN TbCantones C on AD.idCanton = C.idCanton
	WHERE eliminado = 0
END
GO
