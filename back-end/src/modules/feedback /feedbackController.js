import { verificaSugestao } from "./sugestão/sugestaoService.js";

export async function feedback(req, res, next) {
  // armazena o query com as informações
  const query = req.query.info;
  // armazena o tipo de feedback
  const tipo = req.params.tipo;

  console.log(`${query}, ${tipo}`);
  try {
    // swith para adiministrar o tipo de feed bakc
    switch (tipo) {
      case "sugestão":
      // armazena a resposta booleano da função verificaSugestão
      // coloca seus parametos em ToLowerCase, para não haver problemas ao armazenar no banco de daos
      const resultado = await verificaSugestao(query.toLowerCase(), tipo.toLowerCase());
      // resposta no formato json e com os dados da constante resultado
      res.json(resultado);
      break;

      default:
        break;
    }


  } catch (err) {
    // com caso de erro
    next(err)
  }
}
