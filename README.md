# FoodColl Mobile
[![Status](https://img.shields.io/badge/Status-v1.0.0-brightgreen)](https://shields.io/)

## 📱 Sobre o projeto
O **FoodColl Mobile** é um aplicativo multiplataforma desenvolvido em Flutter com o objetivo de auxiliar no aprendizado de *collocations* (colocações) técnicas da área de Ciência e Tecnologia de Alimentos.

A proposta é funcionar como um glossário bilíngue (português-inglês), oferecendo suporte pedagógico para estudantes do ensino técnico e superior, com foco em compreensão e uso correto de termos técnicos em inglês.

Projeto desenvolvido como iniciação científica no IFMS (Instituto Federal de Mato Grosso do Sul), integrando as áreas de Linguística, Desenvolvimento de Software e Ciência de Alimentos.

**Orientador:** Prof. Dr. Jean Michel Pimentel Rocha

## ✅ Funcionalidades da v1.0.0
- [x] Navegação anônima (sem necessidade de cadastro)
- [x] Busca de collocations técnicas
- [x] Autocomplete e histórico de pesquisa
- [x] Tela de detalhes do termo (tradução, exemplos, pronúncia, imagem ilustrativa)
- [x] Sistema de favoritos com persistência local
- [x] Áudio de pronúncia (inglês nativo)
- [x] Envio de sugestões de novas collocations
- [x] Modo escuro
- [x] Ajuste de tamanho de fonte

## 🗺️ Roadmap (pós-MVP)
- [ ] Sistema de login e sincronização entre dispositivos
- [ ] Modo híbrido (offline completo)
- [ ] Correção de collocations existentes
- [ ] Analytics de uso
- [ ] Publicação nas lojas de aplicativo

## 🛠️ Tecnologias utilizadas
![Flutter](https://img.shields.io/badge/-Flutter-0D1117?style=for-the-badge&logo=flutter&labelColor=0D1117)
![Dart](https://img.shields.io/badge/-Dart-0D1117?style=for-the-badge&logo=dart&labelColor=0D1117)
![Node.js](https://img.shields.io/badge/-Node.js-0D1117?style=for-the-badge&logo=node.js&labelColor=0D1117)
![MongoDB](https://img.shields.io/badge/-MongoDB-0D1117?style=for-the-badge&logo=mongodb&labelColor=0D1117)
![Android Studio](https://img.shields.io/badge/-Android%20Studio-0D1117?style=for-the-badge&logo=androidstudio&labelColor=0D1117)
![Git](https://img.shields.io/badge/-Git-0D1117?style=for-the-badge&logo=git&labelColor=0D1117)

**Front-end:** Flutter (Android e Web)
**Back-end:** Node.js + Express
**Banco de dados:** MongoDB Atlas
**Hospedagem do back-end:** Render

## ▶️ Como executar o projeto

### Front-end (Flutter)

#### Pré-requisitos
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Android Studio ou VS Code
- Emulador Android ou dispositivo físico

#### Passo a passo

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/foodcoll-mobile.git
```

2. Acesse a pasta do projeto:
```bash
cd foodcoll-mobile
```

3. Instale as dependências:
```bash
flutter pub get
```

4. Verifique se está tudo configurado:
```bash
flutter doctor
```

5. Execute o projeto:
```bash
flutter run
```

#### 📱 Executar em dispositivo físico

1. Ative o **modo desenvolvedor** no celular
2. Ative a **depuração USB**
3. Conecte o celular via cabo
4. Execute:
```bash
flutter devices
flutter run
```

### Back-end (Node.js)

1. Acesse a pasta do back-end:
```bash
cd back-end
```

2. Instale as dependências:
```bash
npm install
```

3. Configure as variáveis de ambiente necessárias (banco de dados, porta, etc.)

4. Inicie o servidor:
```bash
npm start
```

## 🤝 Contribuições

O projeto foi desenvolvido em contexto acadêmico de iniciação científica. Sugestões, melhorias e correções são bem-vindas por meio de **Issues**.

## 👥 Equipe

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/EDUARDOALMEIDARODRIGUES">
        <img src="https://avatars.githubusercontent.com/u/169735314?v=4" width="100px;" alt="Eduardo Almeida Rodrigues"/><br>
        <sub><b>Eduardo Almeida Rodrigues</b></sub><br>
        <sub>Back-end</sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/Bozzi-afk">
        <img src="https://avatars.githubusercontent.com/u/262649729?v=4" width="100px;" alt="Bozzi"/><br>
        <sub><b>Bozzi</b></sub><br>
        <sub>Mídia</sub>
      </a>
    </td>
    <td align="center">
      <a href="https://github.com/RhafaelyReis">
        <img src="https://avatars.githubusercontent.com/u/152396652?v=4" width="100px;" alt="Rhafaely Reis"/><br>
        <sub><b>Rhafaely Reis</b></sub><br>
        <sub>Front-end, UX/UI, Coordenação</sub>
      </a>
    </td>
  </tr>
</table>

## 🎓 Orientação acadêmica

**Orientador:** Prof. Dr. Jean Michel Pimentel Rocha
**Instituição:** Instituto Federal de Mato Grosso do Sul (IFMS)
