/**
 * @module tramitesRoutes
 * @description Módulo que define las rutas para los trámites de alquileres y ventas.
 */

// Importación de la clase Router de express
import { Router } from "express";

// Importación de los controladores de trámites
import {
  agregarAlquiler,
  agregarVenta,
  borrarAlquiler,
  borrarVenta,
  listarAlquileres,
  listarVentas,
} from "../controllers/tramites.controller.js";

/**
 * @type {import('express').Router}
 * @description Instancia del enrutador de Express para los trámites
 */
const tramitesRoutes = Router();

/**
 * @name POST /alquilar
 * @description Ruta para agregar un nuevo alquiler
 */
tramitesRoutes.post("/alquilar", agregarAlquiler);

/**
 * @name GET /listarAlquileres
 * @description Ruta para obtener la lista de alquileres
 */
tramitesRoutes.get("/listarAlquileres", listarAlquileres);

/**
 * @name POST /borrarAlquiler
 * @description Ruta para eliminar un alquiler existente
 */
tramitesRoutes.post("/borrarAlquiler", borrarAlquiler);

/**
 * @name POST /vender
 * @description Ruta para agregar una nueva venta
 */
tramitesRoutes.post("/vender", agregarVenta);

/**
 * @name GET /listarVentas
 * @description Ruta para obtener la lista de ventas
 */
tramitesRoutes.get("/listarVentas", listarVentas);

/**
 * @name POST /borrarVenta
 * @description Ruta para eliminar una venta existente
 */
tramitesRoutes.post("/borrarVenta", borrarVenta);

// Exportación del enrutador de trámites
export default tramitesRoutes;
