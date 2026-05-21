import { pesquisaDBC } from "./pesquisa/pesquisaModel.js";
import { mostrarHistorico, insererirHistoricoDB } from "../../modules/historico/historicoModel.js";

export async function validaPesquisa(query) {
  if (!query) return mostrarHistorico();

  console.log("oia eu  no service");
  try {
    const resultado = await pesquisaDBC(query);
    console.log('penis');

    return resultado;
  } catch (err) {
    const resultado = [];
    console.log(err);
    return resultado;
  }

}

export async function guardaHistorico(query) {
  if (!query) return 0;

  await insererirHistoricoDB(query);
  return 1;
}
