import { getConnection } from "../database/connection.js";

export const paListarUsuarios = async () => {
  try {
    const pool = await getConnection();

    const result = await pool.request().execute(`PaListarUsuarios`);

    return result.recordset;
  } catch (error) {
    console.log(error);
    return [];
  }
};
