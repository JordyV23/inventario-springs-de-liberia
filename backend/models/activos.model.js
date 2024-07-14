/**
 * @module ActivosModel
 * @description Módulo para interactuar con la base de datos para operaciones relacionadas con activos
 */

import { getConnection } from "../database/connection.js";

/**
 * Agrega un nuevo activo a la base de datos
 * @async
 * @function paAgregarActivo
 * @param {Object} activo - Objeto con los datos del activo a agregar
 * @param {string} activo.nombre - Nombre del activo
 * @param {string} activo.descripcion - Descripción del activo
 * @param {number} activo.idProvincia - ID de la provincia
 * @param {number} activo.idCanton - ID del cantón
 * @param {string} activo.distrito - Nombre del distrito
 * @param {string} activo.detalleDireccion - Detalle de la dirección
 * @param {number} activo.precioGlobal - Precio global del activo
 * @param {string} activo.tipoAsset - Tipo de activo
 * @param {number} activo.precioPorNoche - Precio por noche
 * @param {number} activo.precioPorMes - Precio por mes
 * @param {boolean} activo.disponibilidad - Disponibilidad del activo
 * @param {string} activo.imagenSrc - URL de la imagen del activo
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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
    console.error(error.message);
    throw error;
  }
};

/**
 * Obtiene la lista de todos los activos de la base de datos
 * @async
 * @function paListarActivos
 * @returns {Promise<Array>} Lista de activos
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Edita un activo existente en la base de datos
 * @async
 * @function paEditarActivo
 * @param {Object} activo - Objeto con los datos del activo a editar
 * @param {number} activo.id - ID del activo a editar
 * @param {string} activo.nombre - Nombre del activo
 * @param {string} activo.descripcion - Descripción del activo
 * @param {number} activo.idProvincia - ID de la provincia
 * @param {number} activo.idCanton - ID del cantón
 * @param {string} activo.distrito - Nombre del distrito
 * @param {string} activo.detalleDireccion - Detalle de la dirección
 * @param {number} activo.precioGlobal - Precio global del activo
 * @param {string} activo.tipoAsset - Tipo de activo
 * @param {number} activo.precioPorNoche - Precio por noche
 * @param {number} activo.precioPorMes - Precio por mes
 * @param {boolean} activo.disponibilidad - Disponibilidad del activo
 * @param {string} activo.imagenSrc - URL de la imagen del activo
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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

/**
 * Borra un activo de la base de datos
 * @async
 * @function paBorrarActivo
 * @param {Object} activo - Objeto con el ID del activo a borrar
 * @param {number} activo.id - ID del activo a borrar
 * @returns {Promise<Array>} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la operación
 */
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
