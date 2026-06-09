import { collColocacoes } from "../../config/db.js";

export async function procuraColocacao(id) {
  return collColocacoes
  .find({_id: id})
  .project({colocacao: 1, _id:0})
  .toArray();
}

export async function detalheTermo(colocacao) {
  console.log(`model detalhe`);

  const resultado = collColocacoes.find({colocacao: colocacao}).project({_id: 0, imagem: 0});

  for await (const doc of resultado) {
    return doc;
  }
}
