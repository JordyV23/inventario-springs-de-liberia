/**
 * @module PersonasRoutes
 * @description Módulo de rutas para operaciones relacionadas con personas
 */

import { Router } from "express";
import {
  editarPersona,
  eliminarPerson,
  iniciarSesion,
  obtenerPersonas,
  registrarPersona,
} from "../controllers/personas.controller.js";

// Crea una nueva instancia del enrutador de Express
const personasRoutes = Router();

/**
 * @route POST /registrarPersona
 * @description Ruta para registrar una nueva persona
 * @access Public
 */
personasRoutes.post("/registrarPersona", registrarPersona);

/**
 * @route POST /iniciarSesion
 * @description Ruta para iniciar sesión de un usuario
 * @access Public
 */
personasRoutes.post("/iniciarSesion", iniciarSesion);

/**
 * @route GET /getPersonas
 * @description Ruta para obtener la lista de todas las personas
 * @access Private
 */
personasRoutes.get("/getPersonas", obtenerPersonas);

/**
 * @route POST /editarPersona
 * @description Ruta para editar los datos de una persona
 * @access Private
 */
personasRoutes.post("/editarPersona", editarPersona);

/**
 * @route POST /eliminarPersona
 * @description Ruta para eliminar (inhabilitar) una persona
 * @access Private
 */
personasRoutes.post("/eliminarPersona", eliminarPerson);

export default personasRoutes;
