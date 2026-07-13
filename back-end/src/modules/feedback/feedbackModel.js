import { collFeedBack } from "../../config/db.js";

// função parar armazenar feedback, tendo parametros como a informação do feedback e seu tipo
export async function feedBackBD(query, tipo) {
  try {
      console.log(`no modal do top`);

      // insertOne com cada campo da tabela feedback
      await collFeedBack.insertOne({
            informacao: query,
            tipo: tipo,
            data: new Date(),
            status: "aberto",
            frequencia : 1 }
      );
    } catch (err) {
      // em caso de erro
      console.log(`deu erro`);

      // em caso de erro sera feito um update aumentando a frequencia do feedback com a mesma informação
      // isso se deve a informação ser um campo unique, assim dando erro no insertOne
      await collFeedBack.updateOne(
          {informacao: query},
          {$inc : { frequencia : 1 }},
      );
    }
}
