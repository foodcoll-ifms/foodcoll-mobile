//IMPORTAÇÃO
import { MongoClient, ObjectId} from "mongodb";
import dotenv from "dotenv";

dotenv.config();

//constantes
const uri =  process.env.URI;
const client = new MongoClient(uri);

//função de ligacão da conecção com o mongodb
export async function conecta() {
  await client.connect();
  console.log(`
    conecto
    `);

}

//função de desligar a conecção com o mongodb
//assim fica mais rapido
export async function fecha() {
  await client.close();
  console.log(`
    fecha
    `);

}

//constante de cada colocação
export const collUser = client.db(process.env.DB_1).collection(process.env.COLL_1);
export const collColocacoes = client.db(process.env.DB_1).collection(process.env.COLL_2);
export const collFavorito = client.db(process.env.DB_1).collection(process.env.COLL_3);
export const collHistorico = client.db(process.env.DB_1).collection(process.env.COLL_4);
export const collTopBusca = client.db(process.env.DB_1).collection(process.env.COLL_5);
