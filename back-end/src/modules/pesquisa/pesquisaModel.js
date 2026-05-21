import { collColocacoes } from "../config/db.js";

export async function pesquisaDBC(queryServer) {
  const pipeline = [
    {
      $search: {
        index: "default",
        autocomplete: {
          query: queryServer,
          path: "colocacao",
        },
      },
    },
    {
      $project: {
        _id: 0,
        colocacao: 1,
      },
    },
    {
      $sort: {
        colocacao: 1,
      },
    },
  ];

  console.log("na pesquisa");
  return await collColocacoes.aggregate(pipeline).toArray();
}
