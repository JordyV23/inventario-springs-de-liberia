/**
 * Módulo de rutas para los reportes.
 * @module reportesRoutes
 */

import { Router } from "express";
import {
  reporteDeMantenimientosNoFinalizados,
  reporteDeRentasPorFecha,
  reporteDeRentasPorPropiedad,
  reporteDeVentasPorFecha,
} from "../controllers/reportes.controller.js";

// Crear una instancia del router de Express
const reportesRoutes = Router();

/**
 * @route POST /rentalReportByDate
 * @description Ruta para generar un reporte de rentas por fecha
 * @access Private
 */
reportesRoutes.post("/rentalReportByDate", reporteDeRentasPorFecha);

/**
 * @route POST /rentalReportByAsset
 * @description Ruta para generar un reporte de rentas por propiedad
 * @access Private
 */
reportesRoutes.post("/rentalReportByAsset", reporteDeRentasPorPropiedad);

/**
 * @route POST /sellingReportByDate
 * @description Ruta para generar un reporte de ventas por fecha
 * @access Private
 */
reportesRoutes.post("/sellingReportByDate", reporteDeVentasPorFecha);

/**
 * @route POST /unfinishedMaintenancesReport
 * @description Ruta para generar un reporte de mantenimientos no finalizados
 * @access Private
 */
reportesRoutes.post(
  "/unfinishedMaintenancesReport",
  reporteDeMantenimientosNoFinalizados
);

// Exportar el router de reportes
export default reportesRoutes;