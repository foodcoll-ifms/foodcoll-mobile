import { armazenaTopBuscas } from "./topBuscaModel.js";

// função para verifar o dado que será (ou não) armazenado no top buscas
// Usa de parametro o query, dado buscado, e resposta, a resposta o serviço Pesquisa
export async function verificaTop(query, resposta) {
  // if para ver se o query é pequeno ou nulo
  if (!query || query.length <= 2) {
    return 0
  }
  console.log("no inico da função verificaTop");
  // if para saber se o query está na resposta ou não
  if (resposta[0].colocacao.includes(query)) {
    // armazeno a busca no top buscas
    armazenaTopBuscas(query);
    return 1;
  }
  return 0;
}
