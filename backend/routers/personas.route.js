import { Router } from "express";
import {
    editarPersona,
  eliminarPerson,
  iniciarSesion,
  obtenerPersonas,
  registrarPersona,
} from "../controllers/personas.controller.js";

const personasRoutes = Router();

personasRoutes.post("/registrarPersona", registrarPersona);

personasRoutes.post("/iniciarSesion", iniciarSesion);

personasRoutes.get("/getPersonas", obtenerPersonas);

personasRoutes.post("/editarPersona", editarPersona);

personasRoutes.post("/eliminarPersona", eliminarPerson);

export default personasRoutes;
