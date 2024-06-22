import { getConnection } from "../database/connection.js";

export const paCrearAdvertisement = async (publicidad) => {
  try {
    const pool = await getConnection();
    const request = await pool
      .request()
      .input("titulo", publicidad.titulo)
      .input("description", publicidad.description)
      .input("fechaInicio", publicidad.fechaInicio)
      .input("fechaFin", publicidad.fechaFin)
      .input("isPeriodica", publicidad.isPeriodica)
      .input("intervalo", publicidad.intervalo)
      .execute("PaCrearAdvertisement");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paEditarAdvertisement = async (publicidad) => {
  try {
    const pool = await getConnection();
    const request = await pool
      .request()
      .input("idAvertisement", publicidad.id)
      .input("titulo", publicidad.titulo)
      .input("description", publicidad.description)
      .input("fechaInicio", publicidad.fechaInicio)
      .input("fechaFin", publicidad.fechaFin)
      .input("isPeriodical", publicidad.isPeriodica)
      .input("intervalo", publicidad.intervalo)
      .execute("PaEditarAdvertisement");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paListarAdvertisement = async () => {
  try {
    const pool = await getConnection();
    const request = await pool.request().execute("PaListarAdvertisement");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paBorrarAdvertisement = async (publicidad) => {
  try {
    const pool = await getConnection();
    const request = await pool
      .request()
      .input("idPublicidad", publicidad.id)
      .execute("PaBorrarAdvertisement");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
