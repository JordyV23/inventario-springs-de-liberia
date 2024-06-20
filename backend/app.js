import express from 'express'
import personasRoutes from './routers/personas.route.js';

const app = express();

app.use("/personas",personasRoutes)

export default app;