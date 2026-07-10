import { detalheTermo } from "./termoModel.js";

// função principal do serviço de termo completo
export async function termoCompleto(req, res, next) {
  // constante que armazena o parametro que está no url
  const termo = req.params.termo;
  console.log(`no inicio da funcao de termoCompleto com ${termo} sendo requisitado `);

  try {
    // constante que armazena o valor retornado pela função detalheTermo
    // usa de parametro a constante termo
    const resultado = await detalheTermo(termo);
    // envia resposta no formato json
    res.json(resultado);
  } catch (err) {
    // em caso de erro no meio da execução
    next(err)
  }
}

// função principal do serviço de recomendações
export async function recomendacao(req, res, next) {
  // constante que armazena o parametro que está no url
  const termo = req.params.termo;

  try {
    // constante que armazena o valor retornado pela função detalheTermo
    const resultado = await detalheTermo(termo);
    // envia resposta no formato json, entretando, só envia a remissivas
    res.json(resultado.remissivas);
  } catch (err) {
    // em caso de erro no meio da execução
    next(err)
  }
}
