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

    const data = await paCrearMantenimiento(mantenimiento);

    return res
      .status(201)
      .json({ succes: true, data: "Mantenimiento agregado con Éxito!" });
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
    return res.status(201).json({ succes: true, data });
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

    const data = await paCerrarMantenimiento(mantenimiento);

    return res
      .status(201)
      .json({ succes: true, data: "Mantenimiento Finalizado" });
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
    const data = await paBorrarMantenimiento(mantenimiento);

    return res
      .status(201)
      .json({ succes: true, data: "Mantenimiento eliminado con Éxito!" });
  } catch (error) {
    return genealError(res, error);
  }
};
