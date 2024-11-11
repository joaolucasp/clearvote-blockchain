# ClearVote: Sistema de Votação Eletrônica usando Blockchain

Projeto desenvolvido para a disciplina **SSC0958: Criptomoedas e Blockchain** na Universidade de São Paulo (USP), ministrada pelo professor **Jo Ueyama**.

## 📜 Descrição do Projeto

O **ClearVote** é um sistema de votação eletrônica baseado em blockchain, que utiliza a rede Ethereum para garantir segurança, transparência e integridade no processo eleitoral. Esse projeto busca resolver problemas presentes em sistemas de votação tradicionais, como manipulação de votos e falta de transparência, através de um registro imutável e auditável de cada voto.

## 🚀 Funcionalidades

- **Registro de Eleitores**: Apenas eleitores registrados têm permissão para votar, assegurando que cada voto seja válido.
- **Abertura e Encerramento da Votação**: Permite ao administrador iniciar e finalizar o processo de votação, garantindo que os votos só sejam registrados durante o período autorizado.
- **Votação e Contagem de Votos**: Eleitores podem votar em candidatos registrados, e a contagem é feita de forma automática e transparente.
- **Privacidade e Anonimato**: Utiliza técnicas de anonimização para garantir que os eleitores possam verificar seus votos sem expor suas identidades.
- **Transparência e Auditoria Pública**: A plataforma permite que qualquer pessoa consulte os resultados de votação, fortalecendo a confiança no processo eleitoral.

## 🛠️ Implementação

O projeto foi desenvolvido usando **Solidity** para criar contratos inteligentes na rede Ethereum. O código está implementado para ser testado no ambiente de desenvolvimento **Remix IDE**, que simula transações no Ethereum e facilita o desenvolvimento e teste de contratos inteligentes.

### Pré-requisitos

Para rodar o projeto, é necessário ter:
- Acesso ao **Remix IDE** (https://remix.ethereum.org)

### Deploy e Interação com o Contrato

1. Abra o **Remix IDE** e carregue o arquivo `ClearVote.sol`.
2. Configure o ambiente para **Remix VM (Ethereum)** para realizar testes locais.
3. Insira os nomes dos candidatos ao implantar o contrato e clique em **Deploy**.
4. Após o deploy, use as funções `registerVoter`, `toggleVotingStatus`, e `vote` para gerenciar o processo de votação e `getCandidates` para visualizar os resultados.

## 🌐 Plataforma Utilizada

A plataforma **Ethereum** foi escolhida pela segurança, transparência e suporte a contratos inteligentes, além de ser uma das mais bem documentadas e com uma comunidade ativa de desenvolvedores.

## 🤝 Colaboradores

Agradecemos à(s) seguinte(s) pessoa(s) que contribuíu(ram) para este projeto:

<table>
  <tr>
    <td align="center">
      <a href="#">
        <img style="border-radius: 30px;" src="https://avatars.githubusercontent.com/u/83319546?v=4" width="100px;" alt="Foto do João Lucas no GitHub"/><br>
        <sub>
          <b>João Lucas</b>
        </sub>
      </a>
    </td>
  </tr>
</table>
