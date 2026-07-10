import { inserirHistoricoDB } from "./historicoModel.js";
//função principa para fazer a logia do service 
export async function guardaHistorico(query) {
  // caso o query pesquisafo seja null retorna 0
  if (!query) return 0;
  // caso não seja faz o serviço se inserir o query ao historico 
  await inserirHistoricoDB(query);
}
