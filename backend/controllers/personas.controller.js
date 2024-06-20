import { paListarUsuarios } from "../models/personas.model.js";

export const obtenerPersonas = async (req, res) => {
  try {
    let data = await paListarUsuarios();

    res.status(201).json({ succes: true, data });
  } catch (error) {
    res.status(500).json({
      succes: false,
      data: error.message,
    });
  }
};
