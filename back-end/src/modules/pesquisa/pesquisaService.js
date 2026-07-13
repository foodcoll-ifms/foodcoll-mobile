import { pesquisaDBC } from "../pesquisa/pesquisaModel.js";
import { mostrarHistorico } from "../../modules/historico/historicoModel.js";

// função principal de validação dos dados buscados. Parametro dado buscado
export async function validaPesquisa(query) {
  // if que compara o query se é vazio, se for mostra o historico
  if (!query) return mostrarHistorico();

  console.log("no inicio da funcao validaPesquisa com o query não nulo");

  // constante que armazena os dados retornado da função pesquisaDB
  // usa o dado buscado como parametro
  const resultado = await pesquisaDBC(query);
  // retorna a constante resultado
  return resultado;
}
