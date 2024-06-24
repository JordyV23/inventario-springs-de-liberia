import { genealError } from "../helpers/index.js";
import {
  paBorrarMantenimiento,
  paCerrarMantenimiento,
  paCrearMantenimiento,
  paListarMantenimientos,
} from "../models/mantenimientos.model.js";

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

export const listarMantenimientos = async (req, res) => {
  try {
    let data = await paListarMantenimientos();
    return res.status(201).json({ succes: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

export const terminarMantenimiento = async (req, res) => {
  try {
    const mantenimiento = req.body;

    const data = await paCerrarMantenimiento(mantenimiento);

    return res
      .status(201)
      .json({ succes: true, data: "Mantenimieto Finalizado" });
  } catch (error) {
    return genealError(res, error);
  }
};

export const borrarMantenimiento = async (req, res) => {
  try {
    const mantenimiento = req.body;
    const data = await paBorrarMantenimiento(mantenimiento);

    return res
      .status(201)
      .json({ succes: true, data: "Matenimiento eliminado con Éxito!" });
  } catch (error) {
    return genealError(res, error);
  }
};
