import { listarTodas } from './glossarioModel.js';

export async function glossario(req, res, next) {
  try {
    const resultado = await listarTodas();
    res.json(resultado);
  } catch (err) {
    next(err);
  }
}