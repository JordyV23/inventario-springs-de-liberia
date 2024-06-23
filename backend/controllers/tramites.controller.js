import { genealError } from "../helpers/index.js";
import {
  paAlquilar,
  paBorrarAlquiler,
  paBorrarVenta,
  paMostrarAlquileres,
  paMostrarVentas,
  paVender,
} from "../models/tramites.model.js";

export const agregarAlquiler = async (req, res) => {
  try {
    const asset = req.body;
    let data = await paAlquilar(asset);
    return res
      .status(201)
      .json({ succes: true, data: "Alquiler agregado con Éxito!" });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const listarAlquileres = async (req, res) => {
  try {
    let data = await paMostrarAlquileres();
    return res.status(201).json({ succes: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const borrarAlquiler = async (req, res) => {
  try {
    const alquiler = req.body;
    let data = await paBorrarAlquiler(alquiler);
    return res
      .status(201)
      .json({ succes: true, data: "Alquiler eliminado con Éxito!" });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const agregarVenta = async (req, res) => {
  try {
    const venta = req.body;
    let data = await paVender(venta);
    return res
      .status(201)
      .json({ succes: true, data: "Venta agregado con Éxito!" });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const listarVentas = async (req, res) => {
  try {
    let data = await paMostrarVentas();
    return res.status(201).json({ succes: true, data });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};

export const borrarVenta = async (req, res) => {
  try {
    const asset = req.body;
    let data = await paBorrarVenta(asset);
    return res
      .status(201)
      .json({ succes: true, data: "Venta eliminada con Éxito!" });
  } catch (error) {
    console.log(error.message);
    return genealError(res, error);
  }
};
