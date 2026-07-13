import { collFavorito } from "../../config/db.js";

//função de inserir na tabela de favorito a colocação favoritada
export async function inserirEdeletarFavorito(usuarioID, colocacoesChave) {
  /* executa um update no tabela de Favorito, usando de paremeto
  o id do usuraio e acrescentando ao campo colocacoesChave o doc,
  ou colocação favoritada*/
  const resultado = await collFavorito.findOneAndUpdate(
    { usuarioId: usuarioID },
    [
      {
        $set: {
          colocacoesChave: {
            $cond: [
              { $in: [colocacoesChave, "$colocacoesChave"] },
              {
                $filter: {
                  input: "$colocacoesChave",
                  as: "item",
                  cond: { $ne: ["$$item", colocacoesChave] }
                }
              },
              {
                $concatArrays: [
                  "$colocacoesChave",
                  [colocacoesChave]
                ]
              }
            ]
          }
        }
      }
    ],
    { returnDocument: "before" }
  );
  return resultado;
}

// função de mostrara o favorito com paramatro o id do usuario
export async function mostarFavorito(usuarioID) {
  // constante que armazena no todas as colocações buscada, com um tratamento
  //pegando somente colocacoesChave
    const doc = await collFavorito.findOne(
        { usuarioId: usuarioID },
        { projection: { _id: 0, colocacoesChave: 1 } }
    );
    // retorna somente as colocações favoritadas se existirem
    // caso não existão ira retornar um array vazio
    return doc?.colocacoesChave ?? [];
}

