-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 28/01/2024 às 18:28
-- Versão do servidor: 8.0.34
-- Versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `desafio`
--
CREATE DATABASE IF NOT EXISTS `desafio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `desafio`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_pessoas`
--

CREATE TABLE `tb_pessoas` (
  `id_pessoas` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `email` varchar(155) NOT NULL,
  `dta_criacao` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_pessoas`
--

INSERT INTO `tb_pessoas` (`id_pessoas`, `nome`, `idade`, `email`, `dta_criacao`) VALUES
(1, 'Miguel', 19, 'miguel@gmail.com', '2024-01-25 18:11:11'),
(2, 'Caio', 26, 'caio@gmail.com', '2024-01-25 18:11:50'),
(3, 'Natan', 30, 'natan@gmail.com', '2024-01-25 18:11:50'),
(4, 'João', 51, 'joao@gmail.com', '2024-01-25 18:11:50'),
(5, 'Theo', 45, 'theo@gmail.com', '2024-01-25 18:11:50'),
(6, 'Matheus', 32, 'matheus@gmail.com', '2024-01-25 18:11:50'),
(7, 'Nelson', 19, 'nelson@gmail.com', '2024-01-25 18:11:50'),
(8, 'Ana', 27, 'ana@gmail.com', '2024-01-25 18:11:50'),
(9, 'Larissa', 23, 'larissa@gmail.com', '2024-01-25 18:11:50'),
(10, 'Manoel', 56, 'manoel@gmail.com', '2024-01-25 18:11:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_tokens`
--

CREATE TABLE `tb_tokens` (
  `id_token` int NOT NULL,
  `token` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `ativo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dta_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_atualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tb_tokens`
--

INSERT INTO `tb_tokens` (`id_token`, `token`, `usuario`, `ativo`, `dta_criacao`, `dt_atualizacao`) VALUES
(1, '6UyPbimq9WzOAMTmkbSce490ZtSwEJGppJzpYD0jhBbnxVLCO9kOdIOqu4FX', 'Matheus', 'nao', '2024-01-26 16:02:56', '2024-01-27 19:22:19'),
(2, 'GKNwh3ukSGeRmdZK995UzqtmWScw4cGAHhqKw9qlVzsSXqQAxIaLolst9qIA', 'Caio', 'sim', '2024-01-27 15:02:41', '2024-01-27 18:56:24'),
(3, 'ulcG8NTjQ5oHsxr47KHjKVDdnBGSx1j7vd9iPMzpvFmYs04X24fduVxXDCO7', 'Carol', 'nao', '2024-01-27 16:39:17', '2024-01-27 20:10:36'),
(5, 'dmw66Y54DvPLrPQqCAfN64mwAKsJEk3GVYP00jQEYDbK67sbDsPlyy3zJcte', 'Roberta', 'sim', '2024-01-27 17:11:13', '2024-01-27 20:11:41');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_pessoas`
--
ALTER TABLE `tb_pessoas`
  ADD PRIMARY KEY (`id_pessoas`);

--
-- Índices de tabela `tb_tokens`
--
ALTER TABLE `tb_tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_pessoas`
--
ALTER TABLE `tb_pessoas`
  MODIFY `id_pessoas` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_tokens`
--
ALTER TABLE `tb_tokens`
  MODIFY `id_token` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
