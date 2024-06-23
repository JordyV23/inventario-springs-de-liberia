import { getConnection } from "../database/connection.js";

export const paAlquilar = async (alquiler) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idAsset", alquiler.idAsset)
      .input("idPerson", alquiler.idPerson)
      .input("fechaRegistroAlquiler", alquiler.fechaRegistroAlquiler)
      .input("fechaInicio", alquiler.fechaInicio)
      .input("fechaFin", alquiler.fechaFin)
      .input("jsonDetalles", alquiler.jsonDetalles)
      .execute("PaAlquilar");
    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paMostrarAlquileres = async () => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("PaMostrarAlquileres");
    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paBorrarAlquiler = async (alquiler) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idAlquiler", alquiler.id)
      .execute("PaBorrarAlquiler");
    return result.recordset;
  } catch (error) {
    throw new Error(error.message);
  }
};

export const paVender = async (venta) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idAsset", venta.idAsset)
      .input("idPerson", venta.idPerson)
      .input("fecha", venta.fecha)
      .execute("PaVender");
    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paMostrarVentas = async () => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("PaMostrarVentas");
    return result.recordset;
  } catch (error) {
    throw new Error(error.message);
  }
};

export const paBorrarVenta = async (venta) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idVenta", venta.id)
      .execute("PaBorrarVenta");
    return result.recordset;
  } catch (error) {
    throw new Error(error.message);
  }
};
