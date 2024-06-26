import express from 'express'
import cors from "cors"
import personasRoutes from './routers/personas.routes.js';
import activosRoutes from './routers/activos.routes.js';
import publicidadRoutes from './routers/publicidad.routes.js';
import tramitesRoutes from './routers/tramites.routes.js';
import mantenimientoRoutes from './routers/mantenimientos.routes.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

app.use("/personas",personasRoutes)
app.use("/activos",activosRoutes)
app.use("/publicidad",publicidadRoutes) 
app.use("/tramites",tramitesRoutes)
app.use("/mantenimientos",mantenimientoRoutes) 

export default app;