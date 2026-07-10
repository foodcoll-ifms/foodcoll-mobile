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
  console.log(`conecto`);

}

//constante de cada colocação
export const collUser = client.db(process.env.DB_1).collection(process.env.COLL_1);
export const collColocacoes = client.db(process.env.DB_1).collection(process.env.COLL_2);
export const collFavorito = client.db(process.env.DB_1).collection(process.env.COLL_3);
export const collHistorico = client.db(process.env.DB_1).collection(process.env.COLL_4);
export const collTopBusca = client.db(process.env.DB_1).collection(process.env.COLL_5);
export const collFeedBack = client.db(process.env.DB_1).collection(process.env.COLL_6);
export const USER_ID = new ObjectId("69edfa784d1ef2c789095364");
