import { Router } from "express";
import { crearActivo, editarActivo, eliminarActivo, obtenerActivos } from "../controllers/activos.controller.js";

// Crea una nueva instancia del enrutador de Express
const activosRoutes = Router();

activosRoutes.post("/registrarActivo",crearActivo)


activosRoutes.get("/listarActivos",obtenerActivos)

activosRoutes.post("/editarActivo",editarActivo)

activosRoutes.post("/eliminarActivo",eliminarActivo)

export default activosRoutes;

