import { getConnection } from "../database/connection.js";

export const paCrearMantenimiento = async (mantenimiento) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idAsset", mantenimiento.idAsset)
      .input("idPerson", mantenimiento.idPerson)
      .input("fecha", mantenimiento.fecha)
      .input("detalle", mantenimiento.detalle)
      .execute("PaCrearMantenimiento");

    return result.recordset;
  } catch (error) {
    throw new Error(error);
  }
};

export const paCerrarMantenimiento = async (mantenimiento) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("idMaintenance", mantenimiento.idMaintenance)
      .input("idOperario", mantenimiento.idOperario)
      .input("motivo", mantenimiento.motivo)
      .input("detalle", mantenimiento.detalle)
      .input("costo", mantenimiento.costo)
      .input("fechaCierre", mantenimiento.fechaCierre)
      .execute("PaCerrarMantenimiento");
    return result.recordset;
  } catch (error) {
    throw new Error(error);
  }
};

export const paListarMantenimientos = async () => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("PaListarMantenimientos");
    return result.recordset;
  } catch (error) {
    throw new Error(error);
  }
};

export const paBorrarMantenimiento = async (mantenimiento) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idMantenimiento", mantenimiento.id)
      .execute("PaBorrarMantenimiento");
    return result.recordset;
  } catch (error) {
    throw new Error(error);
  }
};
