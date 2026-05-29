import { collColocacoes } from '../../config/db.js';

export async function listarTodas() {
  return await collColocacoes
    .find({})
    .project({ _id: 0, colocacao: 1, traducao: 1 })
    .sort({ colocacao: 1 })
    .toArray();
}