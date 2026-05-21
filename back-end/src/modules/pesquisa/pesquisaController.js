//importação
import { detalheTermo } from "../models/seachModel.js";
import { guardaHistorico, validaPesquisa } from "../services/seachService.js";
import { vericivaTop } from "../topBusca/TopBuscasService.js";

export async function pesquisa(req, res, next) {
  try{
    const query = req.query.q;

    console.log("no controler");
    
    const resultados = await validaPesquisa(query.toLowerCase());
    
    res.json(resultados);

    Promise.all([
      guardaHistorico(query),
      vericivaTop(query, resultados)
    ]).catch(err => "erro em guardar o historico")
  }catch(err){
    //em caso de erro no meio da execução manda um next com erro
    next(err);
  }
}

export async function termoCompleto(req, res, next) {
  const termo = req.params.termo;
  console.log(`completo`);
  console.log(req.params.termo);

  try {
    const resultado = await detalheTermo(termo);
    res.json(resultado);
  } catch (err) {
    next(err)
  }
}

export async function recomentacao(req, res, next) {
  const termo = req.params.termo;

  try {
    const resultado = await detalheTermo(termo);
    res.json(resultado.remissivas);
  } catch (err) {
    next(err)
  }
}
