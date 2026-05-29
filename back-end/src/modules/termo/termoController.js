import { detalheTermo } from "./termoModel.js";

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
