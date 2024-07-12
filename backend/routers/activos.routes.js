/**
 * @module ActivosRoutes
 * @description Módulo de rutas para operaciones relacionadas con activos
 */

import { Router } from "express";
import {
  crearActivo,
  editarActivo,
  eliminarActivo,
  obtenerActivos,
} from "../controllers/activos.controller.js";
import fileUpload from "../middlewares/fileSaver.js";

// Crea una nueva instancia del enrutador de Express
const activosRoutes = Router();

/**
 * @route POST /registrarActivo
 * @description Ruta para registrar un nuevo activo
 * @access Private
 */
activosRoutes.post("/registrarActivo", crearActivo);

/**
 * @route GET /listarActivos
 * @description Ruta para obtener la lista de todos los activos
 * @access Private
 */
activosRoutes.get("/listarActivos", obtenerActivos);

/**
 * @route POST /editarActivo
 * @description Ruta para editar un activo existente
 * @access Private
 */
activosRoutes.post("/editarActivo", editarActivo);

/**
 * @route POST /eliminarActivo
 * @description Ruta para eliminar un activo
 * @access Private
 */
activosRoutes.post("/eliminarActivo", eliminarActivo);

activosRoutes.post("/guardarImagen", fileUpload);

export default activosRoutes;
