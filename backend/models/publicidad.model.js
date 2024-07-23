/**
 * @module PublicidadModel
 * @description Módulo para interactuar con la base de datos para operaciones relacionadas con publicidad
 */

import { getConnection } from "../database/connection.js";

/**
 * Crea una nueva publicidad en la base de datos
 * @async
 * @function paCrearAdvertisement
 * @param {Object} publicidad - Objeto con los datos de la publicidad a crear
 * @param {string} publicidad.titulo - Título de la publicidad
 * @param {string} publicidad.description - Descripción de la publicidad
 * @param {Date} publicidad.fechaInicio - Fecha de inicio de la publicidad
 * @param {Date} publicidad.fechaFin - Fecha de fin de la publicidad
 * @param {boolean} publicidad.isPeriodica - Indica si la publicidad es periódica
 * @param {number} publicidad.intervalo - Intervalo de repetición (si es periódica)
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Edita una publicidad existente en la base de datos
 * @async
 * @function paEditarAdvertisement
 * @param {Object} publicidad - Objeto con los datos de la publicidad a editar
 * @param {number} publicidad.id - ID de la publicidad a editar
 * @param {string} publicidad.titulo - Título de la publicidad
 * @param {string} publicidad.description - Descripción de la publicidad
 * @param {Date} publicidad.fechaInicio - Fecha de inicio de la publicidad
 * @param {Date} publicidad.fechaFin - Fecha de fin de la publicidad
 * @param {boolean} publicidad.isPeriodica - Indica si la publicidad es periódica
 * @param {number} publicidad.intervalo - Intervalo de repetición (si es periódica)
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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
      .input("isActive", publicidad.activa)
      .execute("PaEditarAdvertisement");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

/**
 * Obtiene la lista de todas las publicidades de la base de datos
 * @async
 * @function paListarAdvertisement
 * @returns {Promise<Array>} Lista de publicidades
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Borra una publicidad de la base de datos
 * @async
 * @function paBorrarAdvertisement
 * @param {Object} publicidad - Objeto con el ID de la publicidad a borrar
 * @param {number} publicidad.id - ID de la publicidad a borrar
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Lista los usuarios y sus correos para el envio de promociones
 * @async
 * @function paListarUsuariosCorreos
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
export const paListarUsuariosCorreos = async () => {
  try {
    const pool = await getConnection();
    const request = await pool.request().execute("PaListarUsuariosCorreos");
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
