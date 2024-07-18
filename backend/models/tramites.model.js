/**
 * @module tramitesModel
 * @description Modelo para operaciones de alquileres y ventas en la base de datos
 */

// Importación de la función para obtener la conexión a la base de datos
import { getConnection } from "../database/connection.js";

/**
 * @function paAlquilar
 * @async
 * @description Registra un nuevo alquiler en la base de datos
 * @param {Object} alquiler - Objeto con los datos del alquiler
 * @param {number} alquiler.idAsset - ID del activo alquilado
 * @param {number} alquiler.idPerson - ID de la persona que alquila
 * @param {Date} alquiler.fechaRegistroAlquiler - Fecha de registro del alquiler
 * @param {Date} alquiler.fechaInicio - Fecha de inicio del alquiler
 * @param {Date} alquiler.fechaFin - Fecha de finalización del alquiler
 * @param {string} alquiler.jsonDetalles - Detalles adicionales en formato JSON
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

/**
 * @function paMostrarAlquileres
 * @async
 * @description Obtiene todos los alquileres de la base de datos
 * @returns {Array} Lista de alquileres
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

export const paEditarAlquiler = async (alquiler) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idAlquiler", alquiler.id)
      .input("fechaFin", alquiler.fechaFin)
      .input("alquilerActivo", alquiler.alquilerActivo)
      .execute("PaEditarAlquiler");

    return result.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

/**
 * @function paBorrarAlquiler
 * @async
 * @description Elimina un alquiler de la base de datos
 * @param {Object} alquiler - Objeto con el ID del alquiler a borrar
 * @param {number} alquiler.id - ID del alquiler a borrar
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

/**
 * @function paVender
 * @async
 * @description Registra una nueva venta en la base de datos
 * @param {Object} venta - Objeto con los datos de la venta
 * @param {number} venta.idAsset - ID del activo vendido
 * @param {number} venta.idPerson - ID de la persona que compra
 * @param {Date} venta.fecha - Fecha de la venta
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

/**
 * @function paMostrarVentas
 * @async
 * @description Obtiene todas las ventas de la base de datos
 * @returns {Array} Lista de ventas
 * @throws {Error} Si ocurre un error durante la ejecución
 */
export const paMostrarVentas = async () => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("PaMostrarVentas");
    return result.recordset;
  } catch (error) {
    throw new Error(error.message);
  }
};

/**
 * @function paBorrarVenta
 * @async
 * @description Elimina una venta de la base de datos
 * @param {Object} venta - Objeto con el ID de la venta a borrar
 * @param {number} venta.id - ID de la venta a borrar
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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
