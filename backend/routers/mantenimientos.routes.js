/**
 * @module mantenimientoRoutes
 * @description Módulo que define las rutas para las operaciones de mantenimiento
 */

// Importación de la clase Router de express
import { Router } from "express";

// Importación de los controladores de mantenimiento
import {
  borrarMantenimiento,
  crearMantenimiento,
  listarMantenimientos,
  terminarMantenimiento,
} from "../controllers/mantenimientos.controller.js";

/**
 * @type {import('express').Router}
 * @description Instancia del enrutador de Express para los mantenimientos
 */
const mantenimientoRoutes = Router();

/**
 * @name POST /crearMantenimiento
 * @description Ruta para crear un nuevo mantenimiento
 */
mantenimientoRoutes.post("/crearMantenimiento", crearMantenimiento);

/**
 * @name POST /terminarMantenimiento
 * @description Ruta para marcar un mantenimiento como terminado
 */
mantenimientoRoutes.post("/terminarMantenimiento", terminarMantenimiento);

/**
 * @name GET /listarMantenimientos
 * @description Ruta para obtener la lista de mantenimientos
 */
mantenimientoRoutes.get("/listarMantenimientos", listarMantenimientos);

/**
 * @name POST /borrarMantenimientos
 * @description Ruta para eliminar un mantenimiento existente
 */
mantenimientoRoutes.post("/borrarMantenimientos", borrarMantenimiento);

// Exportación del enrutador de mantenimientos
export default mantenimientoRoutes;
