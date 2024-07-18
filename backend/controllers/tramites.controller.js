/**
 * @module tramitesController
 * @description Controlador para manejar operaciones de alquileres y ventas
 */

// Importación de la función de manejo de errores
import { genealError } from "../helpers/index.js";

// Importación de las funciones del modelo de trámites
import {
  paAlquilar,
  paBorrarAlquiler,
  paBorrarVenta,
  paEditarAlquiler,
  paMostrarAlquileres,
  paMostrarVentas,
  paVender,
} from "../models/tramites.model.js";

/**
 * @function agregarAlquiler
 * @async
 * @description Agrega un nuevo alquiler
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const agregarAlquiler = async (req, res) => {
  try {
    const asset = req.body;
    await paAlquilar(asset);
    let data = await paMostrarAlquileres();

    return res.status(201).json({ success: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

/**
 * @function listarAlquileres
 * @async
 * @description Lista todos los alquileres
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con la lista de alquileres
 */
export const listarAlquileres = async (req, res) => {
  try {
    let data = await paMostrarAlquileres();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const editarAlquiler = async (req, res) => {
  try {
    const alquiler = req.body;
    await paEditarAlquiler(alquiler);
    let data = await paMostrarAlquileres();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

/**
 * @function borrarAlquiler
 * @async
 * @description Elimina un alquiler existente
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const borrarAlquiler = async (req, res) => {
  try {
    const alquiler = req.body;
    await paBorrarAlquiler(alquiler);
    let data = await paMostrarAlquileres();
    return res.status(201).json({ success: true, data: data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

/**
 * @function agregarVenta
 * @async
 * @description Agrega una nueva venta
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const agregarVenta = async (req, res) => {
  try {
    const venta = req.body;
    await paVender(venta);
    let data = await paMostrarVentas();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

/**
 * @function listarVentas
 * @async
 * @description Lista todas las ventas
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con la lista de ventas
 */
export const listarVentas = async (req, res) => {
  try {
    let data = await paMostrarVentas();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

/**
 * @function borrarVenta
 * @async
 * @description Elimina una venta existente
 * @param {Object} req - Objeto de solicitud Express
 * @param {Object} res - Objeto de respuesta Express
 * @returns {Object} Respuesta JSON con el resultado de la operación
 */
export const borrarVenta = async (req, res) => {
  try {
    const asset = req.body;
    await paBorrarVenta(asset);
    let data = await paMostrarVentas();
    return res.status(201).json({ success: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};
