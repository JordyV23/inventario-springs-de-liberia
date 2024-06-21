import { getConnection } from "../database/connection.js";

export const paAgregarActivo = async (activo) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("nombre", activo.nombre)
      .input("descripcion", activo.descripcion)
      .input("idProvincia", activo.idProvincia)
      .input("idCanton", activo.idCanton)
      .input("distrito", activo.distrito)
      .input("detalleDireccion", activo.detalleDireccion)
      .input("precioGlobal", activo.precioGlobal)
      .input("tipoAsset", activo.tipoAsset)
      .input("precioPorNoche", activo.precioPorNoche)
      .input("precioPorMes", activo.precioPorMes)
      .input("disponibilidad", activo.disponibilidad)
      .input("imagenSrc", activo.imagenSrc)
      .execute("paAgregarActivo");

    return result.recordset;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

export const paListarActivos = async () => {
  try {
    const pool = await getConnection();
    let result = await pool.request().execute("PaListarActivos");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paEditarActivo = async (activo) => {
  try {
    const pool = await getConnection();
    let result = await pool
      .request()
      .input("idActivo", activo.id)
      .input("nombre", activo.nombre)
      .input("descripcion", activo.descripcion)
      .input("idProvincia", activo.idProvincia)
      .input("idCanton", activo.idCanton)
      .input("distrito", activo.distrito)
      .input("detalleDireccion", activo.detalleDireccion)
      .input("precioGlobal", activo.precioGlobal)
      .input("tipoAsset", activo.tipoAsset)
      .input("precioPorNoche", activo.precioPorNoche)
      .input("precioPorMes", activo.precioPorMes)
      .input("disponibilidad", activo.disponibilidad)
      .input("imagenSrc", activo.imagenSrc)
      .execute("PaEditarActivo");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paBorrarActivo = async (activo) => {
  try {
    const pool = await getConnection();
    let result = await pool
      .request()
      .input("idActivo", activo.id)
      .execute("PaBorrarActivo");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
