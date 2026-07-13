import { validaFavorito} from "./favoritoService.js";
import { mostarFavorito } from "./favoritoModel.js";
import { USER_ID } from "../../config/db.js";

//função principal do favorito, ela armazena
export async function favoritoArmazena(req, res, next) {
  // constante que armazena o termo, que esta como parametro na URL
  const colocacoesChave = req.params.termo;

  console.log("no inicio da função principal de favorito controller com colocaçãochave: " + colocacoesChave );

  try {
    // constante que armazena a resposata da função valida favorito
    const resultado = await validaFavorito(USER_ID, colocacoesChave);
    // manda uma resposta do tipo json
    res.json(resultado);

  } catch (err) {
    // em caso de erro é retornado um next
    next(err);
  }
}

// função do serviço de Mostrara favorito
export async function favoritoMostra(req, res, next) {
  console.log("no favorito controller de mostrar todas os favoritos apartir de um ID de usuario" );

  try {
    // constante que armazena a resposata da função mostrar favorito
    const resultado = await mostarFavorito(USER_ID);
    // manda uma resposta do tipo json
    res.json(resultado);

  } catch (err) {
    // em caso de erro é retornado um next
    next(err);
  }
}
