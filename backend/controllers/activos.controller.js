/**
 * @module ActivosController
 * @description Controlador para manejar operaciones relacionadas con activos
 */

import { genealError } from "../helpers/index.js";
import {
  paAgregarActivo,
  paBorrarActivo,
  paEditarActivo,
  paListarActivos,
} from "../models/activos.model.js";

/**
 * Crea un nuevo activo
 * @async
 * @function crearActivo
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const crearActivo = async (req, res) => {
  try {
    const activo = req.body;

    console.log(activo)

    // // Agrega el activo a la base de datos
    // await paAgregarActivo(activo);

    // let data = await paListarActivos();

    // return res.status(201).json({ success: true, data });
    return res.status(201).json({ success: true, data:[] });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Obtiene la lista de todos los activos
 * @async
 * @function obtenerActivos
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y lista de activos
 */
export const obtenerActivos = async (req, res) => {
  try {
    // Obtiene la lista de activos de la base de datos
    let data = await paListarActivos();

    // Envía la lista de activos como respuesta
    res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Edita un activo existente
 * @async
 * @function editarActivo
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const editarActivo = async (req, res) => {
  try {
    const activo = req.body;

    // Edita el activo en la base de datos
    await paEditarActivo(activo);

    let data = await paListarActivos();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Elimina un activo
 * @async
 * @function eliminarActivo
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const eliminarActivo = async (req, res) => {
  try {
    const activo = req.body;

    // Elimina el activo de la base de datos
    await paBorrarActivo(activo);

    let data = await paListarActivos();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};
