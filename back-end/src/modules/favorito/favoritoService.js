import { inserirFavorito, deleteFavorito, mostarFavorito } from "../models/favoritoModel.js";
import { fecha, conecta } from "../../config/db.js";

export async function validaFavorito(usuarioId, colocacoesChave) {
  console.log("favorito service");

  const resultado = await deleteFavorito(usuarioId, colocacoesChave);
  console.log(resultado);

  if (resultado.modifiedCount === 0) {
    await inserirFavorito(usuarioId, colocacoesChave);
    return false;
  }

  return true;
}

export async function listarfavoritos(usuarioId) {
  const resultado = await mostarFavorito(usuarioId);
  return resultado
}
