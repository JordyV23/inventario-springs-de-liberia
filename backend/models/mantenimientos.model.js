/**
 * @module mantenimientosModel
 * @description Modelo para operaciones de mantenimientos en la base de datos
 */

// Importación de la función para obtener la conexión a la base de datos
import { getConnection } from "../database/connection.js";

/**
 * @function paCrearMantenimiento
 * @async
 * @description Crea un nuevo mantenimiento en la base de datos
 * @param {Object} mantenimiento - Objeto con los datos del mantenimiento
 * @param {number} mantenimiento.idAsset - ID del activo asociado al mantenimiento
 * @param {number} mantenimiento.idPerson - ID de la persona responsable del mantenimiento
 * @param {Date} mantenimiento.fecha - Fecha del mantenimiento
 * @param {string} mantenimiento.detalle - Detalles del mantenimiento
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

/**
 * @function paCerrarMantenimiento
 * @async
 * @description Cierra un mantenimiento existente en la base de datos
 * @param {Object} mantenimiento - Objeto con los datos del cierre de mantenimiento
 * @param {number} mantenimiento.idMaintenance - ID del mantenimiento a cerrar
 * @param {number} mantenimiento.idOperario - ID del operario que cierra el mantenimiento
 * @param {string} mantenimiento.motivo - Motivo del cierre
 * @param {string} mantenimiento.detalle - Detalles del cierre
 * @param {number} mantenimiento.costo - Costo del mantenimiento
 * @param {Date} mantenimiento.fechaCierre - Fecha de cierre del mantenimiento
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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

/**
 * @function paListarMantenimientos
 * @async
 * @description Obtiene todos los mantenimientos de la base de datos
 * @returns {Array} Lista de mantenimientos
 * @throws {Error} Si ocurre un error durante la ejecución
 */
export const paListarMantenimientos = async () => {
  try {
    const pool = await getConnection();
    const result = await pool.request().execute("PaListarMantenimientos");
    return result.recordset;
  } catch (error) {
    throw new Error(error);
  }
};

/**
 * @function paBorrarMantenimiento
 * @async
 * @description Elimina un mantenimiento de la base de datos
 * @param {Object} mantenimiento - Objeto con el ID del mantenimiento a borrar
 * @param {number} mantenimiento.id - ID del mantenimiento a borrar
 * @returns {Array} Resultado de la operación
 * @throws {Error} Si ocurre un error durante la ejecución
 */
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
