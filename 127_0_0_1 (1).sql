-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/06/2023 às 14:18
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `halterexercise`
--
DROP DATABASE IF EXISTS `halterexercise`;
CREATE DATABASE IF NOT EXISTS `halterexercise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `halterexercise`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `amigos`
--

CREATE TABLE `amigos` (
  `cpf_amigo` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` char(2) NOT NULL,
  `altura` decimal(10,0) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `email` varchar(30) NOT NULL,
  `objetivo` varchar(30) NOT NULL,
  `experiencia` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `tempo_de_amizade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `amigos`
--

INSERT INTO `amigos` (`cpf_amigo`, `nome`, `idade`, `sexo`, `altura`, `peso`, `email`, `objetivo`, `experiencia`, `estado`, `tempo_de_amizade`) VALUES
(99999999999, 'Amiga do Fulano', 27, 'F', 2, 50, 'Emailprofissional@email.com', 'Saudável', 'pequena', 'levemente sedentario', '2023-01-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `id_exe` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `sequencias` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `nivel_dificuldade` int(11) NOT NULL,
  `musculo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exercicios`
--

INSERT INTO `exercicios` (`id_exe`, `tipo`, `sequencias`, `descricao`, `nivel_dificuldade`, `musculo`) VALUES
(1, 'aeróbico', 10, 'Deve-se saltar abrindo os braços e perna', 1, 'Braços e pernas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `cpf_pessoa` bigint(20) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` char(2) NOT NULL,
  `altura` decimal(10,0) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `objetivo` varchar(30) NOT NULL,
  `experiencia` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`cpf_pessoa`, `nome`, `idade`, `sexo`, `altura`, `peso`, `email`, `senha`, `objetivo`, `experiencia`, `estado`) VALUES
(12345678900, 'Fulano de Tal', 28, 'M', 2, 51, 'Fulaninho@email.com', '123456', 'Ganhar massa muscular', 'Nenhum', 'Sedentario');

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano`
--

CREATE TABLE `plano` (
  `id_plano` int(11) NOT NULL,
  `objetivo` varchar(40) NOT NULL,
  `descricao` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `plano`
--

INSERT INTO `plano` (`id_plano`, `objetivo`, `descricao`) VALUES
(1, 'Aquecimento', 'O objetivo é esquentar os musculos antes do exercício'),
(2, 'Saudável', 'Exercícios leves apenas para manter o corpo saudável');

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos`
--

CREATE TABLE `planos` (
  `id_planos` int(11) NOT NULL,
  `id_exe_fk` int(11) DEFAULT NULL,
  `id_plano_fk` int(11) DEFAULT NULL,
  `id_pessoa_fk` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planos`
--

INSERT INTO `planos` (`id_planos`, `id_exe_fk`, `id_plano_fk`, `id_pessoa_fk`) VALUES
(1, 1, 1, 12345678900);

-- --------------------------------------------------------

--
-- Estrutura para tabela `rede_amizade`
--

CREATE TABLE `rede_amizade` (
  `id_amizade` int(11) NOT NULL,
  `amigo1_fk` bigint(20) DEFAULT NULL,
  `amigo2_fk` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `rede_amizade`
--

INSERT INTO `rede_amizade` (`id_amizade`, `amigo1_fk`, `amigo2_fk`) VALUES
(1, 12345678900, 99999999999);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`cpf_amigo`);

--
-- Índices de tabela `exercicios`
--
ALTER TABLE `exercicios`
  ADD PRIMARY KEY (`id_exe`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`cpf_pessoa`);

--
-- Índices de tabela `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices de tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id_planos`),
  ADD KEY `id_exe_fk` (`id_exe_fk`),
  ADD KEY `id_plano_fk` (`id_plano_fk`),
  ADD KEY `id_pessoa_fk` (`id_pessoa_fk`);

--
-- Índices de tabela `rede_amizade`
--
ALTER TABLE `rede_amizade`
  ADD PRIMARY KEY (`id_amizade`),
  ADD KEY `amigo1_fk` (`amigo1_fk`),
  ADD KEY `amigo2_fk` (`amigo2_fk`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `planos`
--
ALTER TABLE `planos`
  ADD CONSTRAINT `planos_ibfk_1` FOREIGN KEY (`id_exe_fk`) REFERENCES `exercicios` (`id_exe`),
  ADD CONSTRAINT `planos_ibfk_2` FOREIGN KEY (`id_plano_fk`) REFERENCES `plano` (`id_plano`),
  ADD CONSTRAINT `planos_ibfk_3` FOREIGN KEY (`id_pessoa_fk`) REFERENCES `pessoa` (`cpf_pessoa`);

--
-- Restrições para tabelas `rede_amizade`
--
ALTER TABLE `rede_amizade`
  ADD CONSTRAINT `rede_amizade_ibfk_1` FOREIGN KEY (`amigo1_fk`) REFERENCES `pessoa` (`cpf_pessoa`),
  ADD CONSTRAINT `rede_amizade_ibfk_2` FOREIGN KEY (`amigo2_fk`) REFERENCES `amigos` (`cpf_amigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
