import { detalheTermo} from "../../termo/termoModel.js";
import { feedBackBD } from "../feedbackModel.js";

// função princiapl do service de sugestão, com os parametros de query a info, e o tipo
export async function verificaSugestao(query, tipo) {
  // verifica se o query é nulo, ou ser é uma unica palavra já que não a collocações de uma unica palavra
  // é usado split para separara as palavras, e length para verificar se é 1 unica;
  if (!query || query.split(' ').length <= 1) return query.split(' ').length;

  console.log(query.split(' ').length);
  // armazena dos dados retornados da função detalheTermo, que sera usado de parametos o query
  const existe = await detalheTermo(query);
  /* verifica se a dados no constante existe, pois se houver,
  significa que o query do usuario já existe, logo não pode ser armazenado */
  if (existe != null) {
    // termo já existe no glossário: não deve ser salvo como sugestão nova
    return false;
  }
  // termo não existe ainda: é uma sugestão nova de verdade, deve ser salva
  await feedBackBD(query, tipo);
  return true;
}