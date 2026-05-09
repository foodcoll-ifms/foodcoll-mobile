# Back-end

### Descrição:
Back-end do projeto, contruido com arquitetura de pasta MVC, sendo divido cada função do codigo em arquivos e pastas

### Feramentas usadas:
  ![JavaScript](https://img.shields.io/badge/-JavaScript-0D1117?style=for-the-badge&logo=javascript&labelColor=0D1117&textColor=0D1117)&nbsp;
  ![Express](https://img.shields.io/badge/-Express-0D1117?style=for-the-badge&logo=express&labelColor=0D1117&textColor=0D1117)&nbsp;
  ![MongoDB](https://img.shields.io/badge/-MongoDB-0D1117?style=for-the-badge&logo=mongodb&labelColor=0D1117&textColor=0D1117)&nbsp;

## Modelagem do Banco de Dados:
A modelagem do banco de dados foi feita com base na analise de requitos do projeto, sendo construido até o momento 4 collections, sendo "Colocacoes", "Usuario", "Favorito" e "Historico", com as collections "Favorito" e "Historico" oferecendo uma modelagem relacional, onde a IDs das collections Colocacoes" e "Usuario" se relaciondo.
### “Colocacoes”
```json
{
  "_id": id,
  "colocacao": String,
  "componentes": [
    {
      "palavra": String
    }
  ],
  "exemplos_uso": [
    {
      "en": String,
      "pt": String
    }
  ],
  "informacoes_gramaticais": {
    "classe": String,
    "estrutura": String
  },
  "observacao": String
  "remissivas": [
    String
  ],
  "fontes": [
    String
],
  "fonetica": String,
  "pronúncia": arquivo,
  "imagem": arquivo
}
```

### "Usuario"

```json
{
  "_id": id,
  "nome": String,
  "senha": Hash,
  "email": String
}
```

### "Historico"

```json
{
  "_id": id
  "usuarioId": id da collection Usuario
  "dados_busca": [
    {
      "dado_buscado": String
      "data_busca": data
    },
  ]
}
```

### "Favorito"

```json
{
  "_id": id
  "usuarioId": id da collection Usuario
  "colocacoesId": [
    id da collection Colocacoes
  ]
}
```
## SERVIÇOS EXISTENTES

### 1. Pesquisa

#### O que faz e o que é?
Serviço de pesquisa para obter uma lista de informações através da pesquisa realizada pelo usuário em uma barra de pesquisa.

### Parâmetros
| NOME | COMPLEMENTO |
| :--- | :--- |
| **método** | get |
| **url** | /search |
| **q** | **tipo:** String.<br>**descrição:** "q" é o que o usuário irá colocar na barra de pesquisa, sendo todo valor colocado naquele espaço.<br>**exemplo:** "food"; "fooood"; "security". |

### Respostas
| NOME | COMPLEMENTO |
| :--- | :--- |
| **Status** | 220 OK |
| **Tipo do conteúdo** | JSON |
| **Corpo da Resposta** | **descrição:** A resposta retorna um array de objetos contendo os resultados da pesquisa. Sendo os objetos `_id` (nulo) e `colocacao`, um array simples com cada item condizente à pesquisa do usuário. |

**Exemplo de resposta (caso q = food):**
```json
{
  "_id": null,
  "colocacao": [
    "food security",
    "food safety",
    "food science"
  ]
}
```
### Notas
#### Normalização:
Tudo o que for enviado para o parâmetro de pesquisa q será convertido para caixa baixa (lowercase) no backend.
#### Segurança:
Não há tratamento para caracteres especiais ou códigos embutidos.
#### Busca Vazia:
Em caso de busca vazia, o serviço retorna o histórico do usuário.

#

### 2. Histórico

#### O que faz e o que é?
O serviço de histórico utiliza os parâmetros e códigos do **Servicio de Pesquisa**, visto que a pesquisa e o histórico se complementam. O serviço de histórico complementa a busca vazia na pesquisa e armazena tudo o que for pesquisado.

---

#### Parâmetro(s)

| NOME | COMPLEMENTO |
| :--- | :--- |
| **Método** | `GET` |
| **URL** | `/search` |

#### Parâmetros de Query (Query Params)

* **Campo:** `q`
* **Tipo:** `String`
* **Descrição:** O parâmetro `q` é o mesmo utilizado no serviço de pesquisa, entretanto, para consultar o histórico, ele deve ser enviado vazio.
* **Exemplo:** `" "` ou `""`

---

#### Resposta(s)

| NOME | COMPLEMENTO |
| :--- | :--- |
| **Status** | `200 OK` |
| **Tipo do conteúdo** | `JSON` |

#### Corpo da Resposta
**Descrição:** A resposta retorna um array de objetos contendo os resultados da pesquisa. Os objetos contêm a chave `dados_busca` (um array de objetos), que por sua vez contém `dado_buscado` (tipo String) e `data_busca` (tipo Date).

**Exemplo:**
```json
[
  {
    "dados_busca": [
      {
        "dado_buscado": "food",
        "data_busca": "2026-04-26T11:47:18.544Z"
      }
    ]
  }
]
```
### Notas
Tudo o que for enviado para o parâmetro de pesquisa q deve estar vazio para retornar/mostrar o histórico.
####
Caso o parâmetro q seja preenchido com algum valor, este será armazenado no banco de dados como um novo registro de pesquisa.

#

### Favoritos

#### O que faz e o que é?
O serviço de favorito armazena ou retira do banco de dados uma colocação favoritada. Ele realiza a inserção caso a colocação ainda não exista no banco ou a remoção caso ela já esteja presente.

---

#### Parâmetros da Requisição

| Parâmetro | Método | URL | Tipo | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| **id** | `GET` | `/favorito/{id}` | String | **OBRIGATÓRIO.** ID do item/colocação oferecido pelo botão. |

**Exemplo de ID:** `69a88a2fc9d81b000034f8f9` ou `69f3cc5b4616b84cce72ec5f`

---

#### Respostas

* **Status:** `200 OK`
* **Tipo do conteúdo:** `JSON`

#### Corpo da Resposta
A resposta retorna um tipo booleano:
* `false`: A colocação não existia e foi **armazenada** no banco de dados.
* `true`: A colocação já existia e foi **retirada** do banco de dados.

**Exemplo:**
```json
true
```

#### Nota:
Foi escolhida uma resposta do tipo booleano para que o front-end pudesse avisar o usuário se a colocação foi retirada ou armazenada com sucesso.
