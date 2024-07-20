/**
 * Módulo de modelos para reportes.
 * @module reportesModel
 */

import { getConnection } from "../database/connection.js";

/**
 * Genera un reporte de rentas.
 * @async
 * @function paRentalReport
 * @param {Object} reportParams - Parámetros para el reporte.
 * @returns {Promise<Array>} Array con los resultados del reporte.
 * @throws {Error} Si ocurre un error durante la ejecución del procedimiento almacenado.
 */
export const paRentalReport = async (reportParams) => {
  try {
    // Obtener conexión a la base de datos
    const pool = await getConnection();
    // Ejecutar el procedimiento almacenado
    const request = await pool
      .request()
      .input("mes", reportParams.mes)
      .input("year", reportParams.year)
      .execute("PaRentalReport");
    // Retornar los resultados
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

/**
 * Genera un reporte de ventas.
 * @async
 * @function paSellingReport
 * @param {Object} reportParams - Parámetros para el reporte.
 * @returns {Promise<Array>} Array con los resultados del reporte.
 * @throws {Error} Si ocurre un error durante la ejecución del procedimiento almacenado.
 */
export const paSellingReport = async (reportParams) => {
  try {
    // Obtener conexión a la base de datos
    const pool = await getConnection();
    // Ejecutar el procedimiento almacenado
    const request = await pool
      .request()
      .input("mes", reportParams.mes)
      .input("year", reportParams.year)
      .execute("PaSellingReport");
    // Retornar los resultados
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

/**
 * Genera un reporte de rentas por propiedad.
 * @async
 * @function paRentalReportByProperty
 * @param {Object} reportParams - Parámetros para el reporte.
 * @returns {Promise<Array>} Array con los resultados del reporte.
 * @throws {Error} Si ocurre un error durante la ejecución del procedimiento almacenado.
 */
export const paRentalReportByProperty = async (reportParams) => {
  try {
    // Obtener conexión a la base de datos
    const pool = await getConnection();
    // Ejecutar el procedimiento almacenado
    const request = await pool
      .request()
      .input("idAsset", reportParams.idAsset)
      .execute("PaRentalReportByProperty");
    // Retornar los resultados
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};

/**
 * Genera un reporte de mantenimientos no finalizados.
 * @async
 * @function paReportUnfinishedMaintenances
 * @param {Object} reportParams - Parámetros para el reporte.
 * @returns {Promise<Array>} Array con los resultados del reporte.
 * @throws {Error} Si ocurre un error durante la ejecución del procedimiento almacenado.
 */
export const paReportUnfinishedMaintenances = async (reportParams) => {
  try {
    // Obtener conexión a la base de datos
    const pool = await getConnection();
    // Ejecutar el procedimiento almacenado
    const request = await pool
      .request()
      .input("idAsset", reportParams.idAsset)
      .execute("PaReportUnfinishedMaintenances");
    // Retornar los resultados
    return request.recordset;
  } catch (error) {
    console.log(error);
    throw new Error(error.message);
  }
};
