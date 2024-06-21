import { getConnection } from "../database/connection.js";

const genealError = (res, error) => {
  return res.status(500).json({
    succes: false,
    data: error.message,
  });
};

export const paRegisterPerson = async (
  cedula,
  nombreCompleto,
  telefono,
  correo,
  username,
  password,
  rol
) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("cedula", cedula)
      .input("nombreCompleto", nombreCompleto)
      .input("telefono", telefono)
      .input("correo", correo)
      .input("username", username)
      .input("password", password)
      .input("rol", rol)
      .execute("PaRegisterPerson");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paIniciarSesion = async (username) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("username", username)
      .execute(`PaIniciarSesion`);

    return result.recordset[0];
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paEditPerson = async (
  id,
  cedula,
  nombreCompleto,
  telefono,
  correo,
  password,
  rol
) => {
  try {
    const pool = await getConnection();

    const result = await pool
      .request()
      .input("idPerson", id)
      .input("cedula", cedula)
      .input("nombreCompleto", nombreCompleto)
      .input("telefono", telefono)
      .input("correo", correo)
      .input("password", password)
      .input("rol", rol)
      .execute("PaEditPerson");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paListarUsuarios = async () => {
  try {
    const pool = await getConnection();

    const result = await pool.request().execute(`PaListarUsuarios`);

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

export const paInhabilitarPerson = async (id) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idPerson", id)
      .execute("PaInhabilitarPerson");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
