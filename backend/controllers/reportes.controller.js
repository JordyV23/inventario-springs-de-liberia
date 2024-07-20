/**
 * Módulo de controladores de reportes.
 * @module reportControllers
 */

import { genealError } from "../helpers.js";
import {
  paRentalReport,
  paRentalReportByProperty,
  paReportUnfinishedMaintenances,
  paSellingReport,
} from "../models/reportes.model.js";

/**
 * Genera un reporte de rentas por fecha.
 * @async
 * @function reporteDeRentasPorFecha
 * @param {Object} req - Objeto de solicitud Express.
 * @param {Object} req.body - Propiedades del reporte.
 * @param {Object} res - Objeto de respuesta Express.
 * @returns {Promise<Object>} Respuesta JSON con el reporte generado.
 */
export const reporteDeRentasPorFecha = async (req, res) => {
  try {
    // Obtiene las propiedades del reporte del cuerpo de la solicitud
    let reportProps = req.body;
    // Llama a la función del modelo para generar el reporte
    let data = await paRentalReport(reportProps);
    // Devuelve una respuesta exitosa con los datos del reporte
    return res.status(201).json({ success: true, data });
  } catch (error) {
    // Maneja cualquier error que ocurra durante el proceso
    return genealError(res, error);
  }
};

/**
 * Genera un reporte de rentas por propiedad.
 * @async
 * @function reporteDeRentasPorPropiedad
 * @param {Object} req - Objeto de solicitud Express.
 * @param {Object} req.body - Propiedades del reporte.
 * @param {Object} res - Objeto de respuesta Express.
 * @returns {Promise<Object>} Respuesta JSON con el reporte generado.
 */
export const reporteDeRentasPorPropiedad = async (req, res) => {
  try {
    // Obtiene las propiedades del reporte del cuerpo de la solicitud
    let reportProps = req.body;
    // Llama a la función del modelo para generar el reporte
    let data = await paRentalReportByProperty(reportProps);
    // Devuelve una respuesta exitosa con los datos del reporte
    return res.status(201).json({ success: true, data });
  } catch (error) {
    // Maneja cualquier error que ocurra durante el proceso
    return genealError(res, error);
  }
};

/**
 * Genera un reporte de ventas por fecha.
 * @async
 * @function reporteDeVentasPorFecha
 * @param {Object} req - Objeto de solicitud Express.
 * @param {Object} req.body - Propiedades del reporte.
 * @param {Object} res - Objeto de respuesta Express.
 * @returns {Promise<Object>} Respuesta JSON con el reporte generado.
 */
export const reporteDeVentasPorFecha = async (req, res) => {
  try {
    // Obtiene las propiedades del reporte del cuerpo de la solicitud
    let reportProps = req.body;
    // Llama a la función del modelo para generar el reporte
    let data = await paSellingReport(reportProps);
    // Devuelve una respuesta exitosa con los datos del reporte
    return res.status(201).json({ success: true, data });
  } catch (error) {
    // Maneja cualquier error que ocurra durante el proceso
    return genealError(res, error);
  }
};

/**
 * Genera un reporte de mantenimientos no finalizados.
 * @async
 * @function reporteDeMantenimientosNoFinalizados
 * @param {Object} req - Objeto de solicitud Express.
 * @param {Object} req.body - Propiedades del reporte.
 * @param {Object} res - Objeto de respuesta Express.
 * @returns {Promise<Object>} Respuesta JSON con el reporte generado.
 */
export const reporteDeMantenimientosNoFinalizados = async (req, res) => {
  try {
    // Obtiene las propiedades del reporte del cuerpo de la solicitud
    let reportProps = req.body;
    // Llama a la función del modelo para generar el reporte
    let data = await paReportUnfinishedMaintenances(reportProps);
    // Devuelve una respuesta exitosa con los datos del reporte
    return res.status(201).json({ success: true, data });
  } catch (error) {
    // Maneja cualquier error que ocurra durante el proceso
    return genealError(res, error);
  }
};
