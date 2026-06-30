import express from "express";
import cors from "cors";
import { router } from "./routes/Routes.js";
import { errosNaExecucao } from "./middlewares/errosMiddleware.js";

//constantes
const app = express();

//app.use
app.use(cors());
app.use(express.json());
app.get('/health', (req, res) => res.status(200).send('ok'));
app.use(router);
app.use(errosNaExecucao);

export { app };
