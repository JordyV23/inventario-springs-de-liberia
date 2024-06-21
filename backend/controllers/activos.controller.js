import { genealError } from "../helpers/index.js";
import {
  paAgregarActivo,
  paBorrarActivo,
  paEditarActivo,
  paListarActivos,
} from "../models/activos.model.js";

export const crearActivo = async (req, res) => {
  try {
    const activo = req.body;

    // Obtiene la lista de activos de la base de datos
    let data = await paAgregarActivo(activo);

    return res
      .status(201)
      .json({ succes: true, data: "Activo agregado con Éxito!" });
  } catch (error) {
    return genealError(res, error);
  }
};

export const obtenerActivos = async (req, res) => {
  try {
    // Obtiene la lista de activos de la base de datos
    let data = await paListarActivos();

    // Envía la lista de activos como respuesta
    res.status(201).json({ succes: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

export const editarActivo = async (req, res) => {
    try {
      const activo = req.body;
  
      // Obtiene la lista de activos de la base de datos
      let data = await paEditarActivo(activo);
  
      return res
        .status(201)
        .json({ succes: true, data: "Activo editado con Éxito!" });
    } catch (error) {
      return genealError(res, error);
    }
  };

  
  export const eliminarActivo = async (req, res) => {
    try {
      const activo = req.body;
  
      // Obtiene la lista de activos de la base de datos
      let data = await paBorrarActivo(activo);
  
      return res
        .status(201)
        .json({ succes: true, data: "Activo eliminado con Éxito!" });
    } catch (error) {
      return genealError(res, error);
    }
  };
  
