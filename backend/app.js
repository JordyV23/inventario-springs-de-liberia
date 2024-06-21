import express from 'express'
import cors from "cors"
import personasRoutes from './routers/personas.route.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));

app.use("/personas",personasRoutes)

export default app;