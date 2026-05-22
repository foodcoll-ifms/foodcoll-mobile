import { collTopBusca } from "../../config/db.js";

export async function mostraTopCincoBuscas(limite) {
  return await collTopBusca.find().sort( {frequencia: -1 }).limit(limite).project({_id:0, termo:1}).toArray();
}

export async function armazenaTopBuscas(termo) {
  try {
    console.log(`no modal do top`);

    await collTopBusca.insertOne({
          termo: termo,
          frequencia : 1 }
    );
  } catch (err) {
    console.log(`deu erro`);

    await collTopBusca.updateOne(
        {termo: termo},
        {$inc : { frequencia : 1 }},
    );
  }
}
