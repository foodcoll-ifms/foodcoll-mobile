import { ObjectId } from "mongodb";
import { validaFavorito} from "./favoritoService.js";
import { mostarFavorito } from "./favoritoModel.js";

export async function favoritoArmazena(req, res, next) {
  const userId = new ObjectId('69edfa784d1ef2c789095364');
  const colocacoesChave = req.params.termo;


  try {
    const resultado = await validaFavorito(userId, colocacoesChave);
    res.json(resultado);

  } catch (err) {
    next(err);
  }
}

export async function favoritoMostra(req, res, next) {
  const userId = new ObjectId('69edfa784d1ef2c789095364');
  const colocacoesId = new ObjectId(req.params.ID);


  try {
    const resultado = await mostarFavorito(userId);
    res.json(resultado);

  } catch (err) {
    next(err);
  }
}
