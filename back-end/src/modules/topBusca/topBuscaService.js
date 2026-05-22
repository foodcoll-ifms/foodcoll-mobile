import { armazenaTopBuscas } from "./topBuscaModel.js";

export async function vericivaTop(query, resposta) {
  console.log("top");

  if (!query || query.length <= 2) {
    return 0
  };

  console.log(`vai armazenar no top`);

  for await (const doc of resposta[0].colocacao) {
    if (doc.includes(query)) {
      armazenaTopBuscas(query);
      return 1;
    }
  };
  return 0;
}
