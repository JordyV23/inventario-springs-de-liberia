/**
 * @module PublicidadRoutes
 * @description Módulo de rutas para operaciones relacionadas con publicidad
 */

import { Router } from "express";
import {
  borrarPublicidad,
  crearPublicidad,
  editarPublicidad,
  listarPublicidad,
} from "../controllers/publicidad.controller.js";

// Crea una nueva instancia del enrutador de Express
const publicidadRoutes = Router();

/**
 * @route POST /crearPublicidad
 * @description Ruta para crear una nueva publicidad
 * @access Private
 */
publicidadRoutes.post("/crearPublicidad", crearPublicidad);

/**
 * @route GET /listarPublicidad
 * @description Ruta para obtener la lista de todas las publicidades
 * @access Private
 */
publicidadRoutes.get("/listarPublicidad", listarPublicidad);

/**
 * @route POST /editarPublicidad
 * @description Ruta para editar una publicidad existente
 * @access Private
 */
publicidadRoutes.post("/editarPublicidad", editarPublicidad);

/**
 * @route POST /borrarPublicidad
 * @description Ruta para borrar una publicidad
 * @access Private
 */
publicidadRoutes.post("/borrarPublicidad", borrarPublicidad);

export default publicidadRoutes;
