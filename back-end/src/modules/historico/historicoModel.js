import { collHistorico, conecta, fecha } from "../../config/db.js";
import { ObjectId } from "mongodb";

export async function insererirHistoricoDB(doc) {
  await collHistorico.updateOne(
    {
      usuarioId: new ObjectId("69edfa784d1ef2c789095364"),
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
  console.log("armazena");
}

export async function mostrarHistorico(ID) {
  const resultado = await collHistorico
    .find({ usuarioId: ID })
    .project({ _id: 0, usuarioId: 0 })
    .toArray();
  return resultado;
}

