import { inserirEdeletarFavorito, mostarFavorito } from "./favoritoModel.js";

// funçãoo de validação do favorito, usando de parametros o id do usuario e a colocação
export async function validaFavorito(usuarioId, colocacaoChave) {
  console.log("no inicio da função validaFavorito");

  // constante que armazena o array retornado da função deleteFavortio
  const resultado = await inserirEdeletarFavorito(usuarioId, colocacaoChave);
  console.log(resultado);

  // return com tipo bolleano
  // caso haja mudançao retornara true
  // caso não haja, insere no banco de dados retornara false
  const t = resultado.colocacoesChave.includes(colocacaoChave);
  return t;
}
