/**
 * @module mantenimientosController
 * @description Controlador para manejar operaciones de mantenimientos
 */

// Importación de la función de manejo de errores
import { genealError } from "../helpers/index.js";

// Importación de las funciones del modelo de mantenimientos
import {
  paBorrarMantenimiento,
  paCerrarMantenimiento,
  paCrearMantenimiento,
  paListarMantenimientos,
} from "../models/mantenimientos.model.js";

/**
 * @function crearMantenimiento
 * @async
 * @description Crea un nuevo mantenimiento
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const crearMantenimiento = async (req, res) => {
  try {
    const mantenimiento = req.body;

    await paCrearMantenimiento(mantenimiento);
    let data = await paListarMantenimientos();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * @function listarMantenimientos
 * @async
 * @description Lista todos los mantenimientos
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con la lista de mantenimientos
 */
export const listarMantenimientos = async (req, res) => {
  try {
    let data = await paListarMantenimientos();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * @function terminarMantenimiento
 * @async
 * @description Marca un mantenimiento como terminado
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const terminarMantenimiento = async (req, res) => {
  try {
    const mantenimiento = req.body;

    await paCerrarMantenimiento(mantenimiento);
    let data = await paListarMantenimientos();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * @function borrarMantenimiento
 * @async
 * @description Elimina un mantenimiento existente
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const borrarMantenimiento = async (req, res) => {
  try {
    const mantenimiento = req.body;
    await paBorrarMantenimiento(mantenimiento);
    let data = await paListarMantenimientos();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};
