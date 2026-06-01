//importação
import { guardaHistorico, validaPesquisa } from "./pesquisaService.js";
import { vericivaTop } from "../topBusca/topBuscaService.js";

export async function pesquisa(req, res, next) {
  try{
    const query = req.query.q;

    console.log("no controler");
    const resultados = await validaPesquisa(query.toLowerCase());
    res.json(resultados);

    console.log(`mandou resposta`);

    Promise.all([
      guardaHistorico(query),
      vericivaTop(query, resultados)
    ]).catch(err => "erro em guardar o historico")
  }catch(err){
    //em caso de erro no meio da execução manda um next com erro
    next(err);
  }
}
