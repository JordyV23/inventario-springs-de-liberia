import { Router } from "express"
import { obtenerPersonas } from "../controllers/personas.controller.js";

const personasRoutes = Router();

personasRoutes.get("/getPersonas", obtenerPersonas)

export default personasRoutes;