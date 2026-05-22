import { mostraTopCincoBuscas } from "./topBuscaModel.js";

export async function topBuscas(req, res, next) {
  const limite = 5;
  try {
    const resultado = await mostraTopCincoBuscas(limite);
    res.json(resultado);
  } catch (err) {
    next(err);
  }

}
