import { collTopBusca } from "../../config/db.js";

// função para mostrar o top Buscas com parametro de limite
export async function mostraTopBuscas(limite) {
  // return com os resultado da busca na tabela de top Busca
  // sort informa como será ordenado o resultado
  // limit o limite de documentos
  // project com o que não dever ser retornado
  return await collTopBusca.find().sort( {frequencia: -1 }).limit(limite).project({_id:0, termo:1}).toArray();
}

// função para armazenar dados novos as topBuscas
export async function armazenaTopBuscas(termo) {

  console.log(`no modal da função armazenaTopBuscas`);

  // insertOne para inserir novos dados a tabela
  // já possu uma comparação
  // em cassos do termo exister é uma incrementação na parte $inc
  // em caso de não existir ira criar um documento novo com o termo no $setOnInsert
  await collTopBusca.updateOne(
    { termo },
    {
      $inc: { frequencia: 1 },
      $setOnInsert: { termo }
    },
    {
      upsert: true
    }
  );
}
