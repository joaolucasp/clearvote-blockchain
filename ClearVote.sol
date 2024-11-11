// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ClearVote - Um contrato inteligente de votação eletrônica baseado em blockchain
/// Este contrato implementa funcionalidades básicas de uma votação eletrônica segura e transparente.

contract ClearVote {
    address public admin; // Endereço do administrador que controla a votação
    bool public votingState;
    
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    struct Voter {
        bool isRegistered;
        bool hasVoted;
    }
    
    mapping(address => Voter) public voters; // Mapeia um endereço para os dados de um eleitor
    Candidate[] public candidates; // Lista de candidatos
    
    /// Evento para registrar um voto
    event VoteCasted(address indexed voter, uint256 candidateIndex);

    /// Evento para iniciar e encerrar a votação
    event VotingStatusChanged(bool isOpen);

    constructor(string[] memory candidateNames) {
        admin = msg.sender; // Define o administrador como quem cria o contrato
        votingState = false; // A votação do contrato começa fechada por default
        
        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    /// Permite que o administrador registre eleitores
    /// @param voterAddress O endereço do eleitor a ser registrado
    function registerVoter(address voterAddress) external onlyAdmin {
        require(!voters[voterAddress].isRegistered, "Esse eleitor ja esta cadastrado.");
        voters[voterAddress] = Voter({
            isRegistered: true,
            hasVoted: false
        });
    }

    /// Abre ou encerra a votação (somente o administrador)
    function toggleVotingStatus() external onlyAdmin {
        votingState = !votingState;
        emit VotingStatusChanged(votingState);
    }

    /// Função principal de votação
    /// @param candidateIndex O índice do candidato no array de candidatos
    function vote(uint256 candidateIndex) external onlyRegisteredVoter onlyDuringVoting {
        require(!voters[msg.sender].hasVoted, "Eleitor ja votou.");
        require(candidateIndex < candidates.length, "Candidato invalido.");
        
        voters[msg.sender].hasVoted = true;
        candidates[candidateIndex].voteCount += 1;
        
        emit VoteCasted(msg.sender, candidateIndex);
    }

    /// Obtém o total de votos para um candidato
    /// @param candidateIndex O índice do candidato no array de candidatos
    function getVoteCount(uint256 candidateIndex) external view returns (uint256) {
        require(candidateIndex < candidates.length, "Candidato invalido.");
        return candidates[candidateIndex].voteCount;
    }

    /// Retorna a lista de candidatos e os votos para cada um
    function getCandidates() external view returns (string[] memory, uint256[] memory) {
        string[] memory names = new string[](candidates.length);
        uint256[] memory votes = new uint256[](candidates.length);
        for (uint256 i = 0; i < candidates.length; i++) {
            names[i] = candidates[i].name;
            votes[i] = candidates[i].voteCount;
        }
        return (names, votes);
    }

    /// Modificador para limitar o acesso a funções ao administrador
    modifier onlyAdmin() {
        require(msg.sender == admin, "Apenas o administrador pode executar esta funcao.");
        _;
    }

    /// Modificador para permitir o acesso apenas a eleitores registrados
    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].isRegistered, "Voce nao esta registrado como eleitor.");
        _;
    }

    /// Modificador para garantir que a votação está aberta
    modifier onlyDuringVoting() {
        require(votingState, "A votacaoo esta fechada.");
        _;
    }
}
