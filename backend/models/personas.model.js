/**
 * @module PersonaModel
 * @description Módulo para interactuar con la base de datos para operaciones relacionadas con personas
 */

import { getConnection } from "../database/connection.js";

/**
 * Maneja errores generales y envía una respuesta de error
 * @param {Object} res - Objeto de respuesta Express
 * @param {Error} error - Objeto de error
 * @returns {Object} Respuesta JSON con estado 500 y mensaje de error
 */
const genealError = (res, error) => {
  return res.status(500).json({
    succes: false,
    data: error.message,
  });
};

/**
 * Registra una nueva persona en la base de datos
 * @async
 * @function paRegisterPerson
 * @param {string} cedula - Número de identificación
 * @param {string} nombreCompleto - Nombre completo de la persona
 * @param {string} telefono - Número de teléfono
 * @param {string} correo - Correo electrónico
 * @param {string} username - Nombre de usuario
 * @param {string} password - Contraseña (ya encriptada)
 * @param {string} rol - Rol del usuario
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Inicia sesión de un usuario
 * @async
 * @function paIniciarSesion
 * @param {string} username - Nombre de usuario
 * @returns {Promise<Object>} Datos del usuario
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Edita los datos de una persona en la base de datos
 * @async
 * @function paEditPerson
 * @param {number} id - ID de la persona
 * @param {string} cedula - Número de identificación
 * @param {string} nombreCompleto - Nombre completo de la persona
 * @param {string} telefono - Número de teléfono
 * @param {string} correo - Correo electrónico
 * @param {string} password - Contraseña (ya encriptada)
 * @param {string} rol - Rol del usuario
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Obtiene la lista de todos los usuarios
 * @async
 * @function paListarUsuarios
 * @returns {Promise<Array>} Lista de usuarios
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Inhabilita una persona en la base de datos
 * @async
 * @function paInhabilitarPerson
 * @param {number} id - ID de la persona a inhabilitar
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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
