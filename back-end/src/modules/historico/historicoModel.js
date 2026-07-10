import { collHistorico, USER_ID } from "../../config/db.js";

// função de armazenar um dado buscado na tabela historico, usando de parametro doc
export async function insererirHistoricoDB(doc) {
  // updateOne com os campos que serão ingrementados no $push
  // ele usa como paramtro o id do usuario
  await collHistorico.updateOne(
    {
      usuarioId: USER_ID,
    },
    {
      $push: {
        dados_busca: {
          dado_buscado: doc,
          data_busca: new Date(),
        },
      },
    },
  );
  console.log("foi armazenado um novo registro no historico do usuario ");
}

// função de mostrar o historico do usuario
export async function mostrarHistorico() {
  console.log("no inicio da funcao do model de historio onde mostra o historico");
  // constante que armazena o resultado da consulta no Historico do ususario
  // armazena tudo que é encontrada com o parametro do id do usuraio
  const resultado = await collHistorico
    .find({ usuarioId: USER_ID })
    .project({ _id: 0, usuarioId: 0 })
    .toArray();
  return resultado;
}

