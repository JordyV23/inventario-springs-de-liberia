/**
 * @module PublicidadController
 * @description Controlador para manejar operaciones relacionadas con publicidad
 */

import { genealError } from "../helpers/index.js";
import {
  paBorrarAdvertisement,
  paCrearAdvertisement,
  paEditarAdvertisement,
  paListarAdvertisement,
} from "../models/publicidad.model.js";

/**
 * Crea una nueva publicidad
 * @async
 * @function crearPublicidad
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const crearPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paCrearAdvertisement(publicidad);
    return res
      .status(201)
      .json({ success: true, data: "Publicidad creada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Obtiene la lista de todas las publicidades
 * @async
 * @function listarPublicidad
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y lista de publicidades
 */
export const listarPublicidad = async (req, res) => {
  try {
    let data = await paListarAdvertisement();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Edita una publicidad existente
 * @async
 * @function editarPublicidad
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const editarPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paEditarAdvertisement(publicidad);
    return res
      .status(201)
      .json({ success: true, data: "Publicidad editada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * Borra una publicidad
 * @async
 * @function borrarPublicidad
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con estado de éxito y mensaje
 */
export const borrarPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paBorrarAdvertisement(publicidad);
    return res
      .status(201)
      .json({ success: true, data: "Publicidad eliminada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};
