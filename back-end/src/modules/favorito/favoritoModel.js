import { collFavorito } from "../../config/db.js";

export async function inserirFavorito(usuarioID, doc) {
  await collFavorito.updateOne(
    {
      usuarioId: usuarioID,
    },
    {
      $addToSet: {
        colocacoesChave: doc,
      },
    },
  );
}

export async function deleteFavorito(usuarioID, colocacoesChave) {
  const resultado = await collFavorito.updateOne(
    { usuarioId: usuarioID },
    { $pull: { colocacoesChave: colocacoesChave } },
  );
  return resultado;
}


export async function mostarFavorito(usuarioID) {
  const t = collFavorito.find({usuarioId: usuarioID}).project({_id: 0, usuarioId:0});
  const resultado = [];
  for await (const doc of t) {
    doc.colocacoesChave.forEach(item => {
      resultado.push(item);
    })
  }
  return resultado;
}
