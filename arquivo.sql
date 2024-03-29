-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/10/2021 às 03:37
-- Versão do servidor: 10.4.21-MariaDB
-- Versão do PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `curso_spring`
--

-- --------------------------------------------------------
--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Informática'),
(2, 'Escritório'),
(3, 'Cama mesa e banho'),
(4, 'Eletrônicos'),
(5, 'Jardinagem'),
(6, 'Decoração'),
(7, 'Perfumaria');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `estado_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cidade`
--

INSERT INTO `cidade` (`id`, `nome`, `estado_id`) VALUES
(1, 'Uberlândia', 1),
(2, 'São Paulo', 2),
(3, 'Campinas', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `cpf_ou_cnpj` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `cpf_ou_cnpj`, `email`, `nome`, `tipo`) VALUES
(1, '363378912377', 'maria@gmail.com', 'Maria Silva', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cidade_id` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`id`, `bairro`, `cep`, `complemento`, `logradouro`, `numero`, `cidade_id`, `cliente_id`) VALUES
(1, 'Jardim', '38220834', 'Apto 303', 'Rua Flores', '300', 1, 1),
(2, 'Centro', '38777012', 'Sala 800', 'Avenida Matos', '100', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`) VALUES
(1, 'Minas Gerais'),
(2, 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `desconto` double DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `produto_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`desconto`, `preco`, `quantidade`, `pedido_id`, `produto_id`) VALUES
(0, 2000, 1, 1, 1),
(0, 80, 2, 1, 3),
(100, 800, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `pedido_id` bigint(20) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`pedido_id`, `estado`) VALUES
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento_com_boleto`
--

CREATE TABLE `pagamento_com_boleto` (
  `data_pagamento` datetime DEFAULT NULL,
  `data_vencimento` datetime DEFAULT NULL,
  `pedido_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pagamento_com_boleto`
--

INSERT INTO `pagamento_com_boleto` (`data_pagamento`, `data_vencimento`, `pedido_id`) VALUES
(NULL, '2017-10-20 02:00:00', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento_com_cartao`
--

CREATE TABLE `pagamento_com_cartao` (
  `numero_parcelas` int(11) DEFAULT NULL,
  `pedido_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pagamento_com_cartao`
--

INSERT INTO `pagamento_com_cartao` (`numero_parcelas`, `pedido_id`) VALUES
(6, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL,
  `instante` datetime DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `endereco_entrega_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id`, `instante`, `cliente_id`, `endereco_entrega_id`) VALUES
(1, '2017-09-30 13:32:00', 1, 1),
(2, '2017-10-10 22:35:00', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id` bigint(20) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `preco`) VALUES
(1, 'Computador', 2000),
(2, 'Impressora', 800),
(3, 'Mouse', 80),
(4, 'Mesa de escritório', 300),
(5, 'Toalha', 50),
(6, 'Colcha', 200),
(7, 'TV true color', 1200),
(8, 'Roçadeira', 800),
(9, 'Abajour', 100),
(10, 'Pendente', 180),
(11, 'Shampoo', 90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_categoria`
--

CREATE TABLE `produto_categoria` (
  `produto_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `produto_categoria`
--

INSERT INTO `produto_categoria` (`produto_id`, `categoria_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `telefone` (
  `cliente_id` bigint(20) NOT NULL,
  `telefones` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `telefone`
--

INSERT INTO `telefone` (`cliente_id`, `telefones`) VALUES
(1, '27363323'),
(1, '93838393');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkworrwk40xj58kevvh3evi500` (`estado_id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`) USING HASH;

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8b1kcb3wucapb8dejshyn5fsx` (`cidade_id`),
  ADD KEY `FK8s7ivtl4foyhrfam9xqom73n9` (`cliente_id`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`pedido_id`,`produto_id`),
  ADD KEY `FKtk55mn6d6bvl5h0no5uagi3sf` (`produto_id`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`pedido_id`);

--
-- Índices de tabela `pagamento_com_boleto`
--
ALTER TABLE `pagamento_com_boleto`
  ADD PRIMARY KEY (`pedido_id`);

--
-- Índices de tabela `pagamento_com_cartao`
--
ALTER TABLE `pagamento_com_cartao`
  ADD PRIMARY KEY (`pedido_id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK30s8j2ktpay6of18lbyqn3632` (`cliente_id`),
  ADD KEY `FKcrxxe5rpllxbh0sfi4a6rwphb` (`endereco_entrega_id`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produto_categoria`
--
ALTER TABLE `produto_categoria`
  ADD KEY `FKq3g33tp7xk2juh53fbw6y4y57` (`categoria_id`),
  ADD KEY `FK1c0y58d3n6x3m6euv2j3h64vt` (`produto_id`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `telefone`
  ADD KEY `FK8aafha0njkoyoe3kvrwsy3g8u` (`cliente_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
