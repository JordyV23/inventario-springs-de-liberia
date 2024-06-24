import { Router } from "express";
import {
  borrarMantenimiento,
  crearMantenimiento,
  listarMantenimientos,
  terminarMantenimiento,
} from "../controllers/mantenimientos.controller.js";

const mantenimientoRoutes = Router();

mantenimientoRoutes.post("/crearMantenimiento", crearMantenimiento);
mantenimientoRoutes.post("/terminarMantenimiento", terminarMantenimiento);
mantenimientoRoutes.get("/listarMantenimientos", listarMantenimientos);
mantenimientoRoutes.post("/borrarMantenimientos", borrarMantenimiento);

export default mantenimientoRoutes;
