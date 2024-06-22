import { genealError } from "../helpers/index.js";
import {
  paBorrarAdvertisement,
  paCrearAdvertisement,
  paEditarAdvertisement,
  paListarAdvertisement,
} from "../models/publicidad.model.js";

export const crearPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paCrearAdvertisement(publicidad);
    return res
      .status(201)
      .json({ succes: true, data: "Publicidad creada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};

export const listarPublicidad = async (req, res) => {
  try {
    let data = await paListarAdvertisement();
    return res.status(201).json({ succes: true, data });
  } catch (error) {
    return genealError(res, error);
  }
};

export const editarPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paEditarAdvertisement(publicidad);
    return res
      .status(201)
      .json({ succes: true, data: "Publicidad editada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};

export const borrarPublicidad = async (req, res) => {
  try {
    let publicidad = req.body;
    let data = await paBorrarAdvertisement(publicidad);
    return res
      .status(201)
      .json({ succes: true, data: "Publicidad eliminada exitosamente" });
  } catch (error) {
    return genealError(res, error);
  }
};
