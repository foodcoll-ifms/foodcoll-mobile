import express from "express";
import { pesquisa } from "../modules/pesquisa/pesquisaController.js";
import { recomentacao, termoCompleto } from "../modules/termo/termoController.js";
import { favoritoArmazena, favoritoMostra } from "../modules/favorito/favoritoController.js";
import { topBuscas } from "../modules/topBusca/topBuscaController.js";

const router= express.Router();

router.get('/search', pesquisa);
router.post('/favorito/:termo', favoritoArmazena);
router.get('/favorito', favoritoMostra);
router.get('/topBuscas', topBuscas);
router.get('/detalheTermos/:termo', termoCompleto);
router.get('/recomendacao/:termo', recomentacao);

export { router };
