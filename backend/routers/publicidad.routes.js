import { Router } from "express";
import {
  borrarPublicidad,
  crearPublicidad,
  editarPublicidad,
  listarPublicidad,
} from "../controllers/publicidad.controller.js";

const publicidadRoutes = Router();

publicidadRoutes.post("/crearPublicidad", crearPublicidad);
publicidadRoutes.get("/listarPublicidad", listarPublicidad);
publicidadRoutes.post("/editarPublicidad", editarPublicidad);
publicidadRoutes.post("/borrarPublicidad", borrarPublicidad);

export default publicidadRoutes;
