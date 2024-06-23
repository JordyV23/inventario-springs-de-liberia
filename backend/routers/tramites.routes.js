import { Router } from "express";
import {
  agregarAlquiler,
  agregarVenta,
  borrarAlquiler,
  borrarVenta,
  listarAlquileres,
  listarVentas,
} from "../controllers/tramites.controller.js";

const tramitesRoutes = Router();

tramitesRoutes.post("/alquilar", agregarAlquiler);
tramitesRoutes.get("/listarAlquileres", listarAlquileres);
tramitesRoutes.post("/borrarAlquiler", borrarAlquiler);
tramitesRoutes.post("/vender", agregarVenta);
tramitesRoutes.get("/listarVentas", listarVentas);
tramitesRoutes.post("/borrarVenta", borrarVenta);
export default tramitesRoutes;
