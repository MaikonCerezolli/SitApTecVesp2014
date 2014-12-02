-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.27
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `sitap`
--
CREATE DATABASE `sitap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sitap`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo`
--

CREATE TABLE IF NOT EXISTS `artigo` (
  `idartigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `corpo` text,
  `data` datetime DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `like` int(11) DEFAULT NULL COMMENT 'Quantidade de curtidas que o artigo recebe.',
  PRIMARY KEY (`idartigo`),
  KEY `fk_artigo_usuario1` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nome`, `descricao`) VALUES
(1, 'Pizza', 'Categora que fala sobre pizzas'),
(2, 'Bacon', 'Categoria sobre bacon');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_has_artigo`
--

CREATE TABLE IF NOT EXISTS `categoria_has_artigo` (
  `idcategoria` int(11) NOT NULL,
  `idartigo` int(11) NOT NULL,
  PRIMARY KEY (`idcategoria`,`idartigo`),
  KEY `fk_categoria_has_artigo_artigo1` (`idartigo`),
  KEY `fk_categoria_has_artigo_categoria1` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idartigo` int(11) NOT NULL,
  `corpo` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_usuario_has_artigo_artigo1` (`idartigo`),
  KEY `fk_usuario_has_artigo_usuario` (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `idfoto` int(11) NOT NULL AUTO_INCREMENT,
  `arquivo` varchar(45) DEFAULT NULL,
  `idartigo` int(11) NOT NULL,
  PRIMARY KEY (`idfoto`),
  KEY `fk_foto_artigo1` (`idartigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `email`, `senha`, `sexo`, `cidade`, `estado`, `endereco`, `cep`, `foto`) VALUES
(0, 'Anônimo', 'anonimo@anonimo.com.br', NULL, NULL, NULL, NULL, NULL, NULL, 'ciclops.png'),
(1, 'Admin', 'admin@admin.com.br', '1234', NULL, NULL, NULL, NULL, NULL, 'ciclops.png'),
(6, 'Pepa Pig', 'pepapig@gmail.com', '1234', 'F', 'Pepalândia', 'SC', 'Rua da Pepa', '83542-252', 'pepapig.png'),
(7, 'Nícolas Cage', 'cage@gmail.com', '1234', 'm', 'Brusque', 'SC', 'Rua dos Cages', '88350-250', 'nicolas.jpg');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `artigo`
--
ALTER TABLE `artigo`
  ADD CONSTRAINT `artigo_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `categoria_has_artigo`
--
ALTER TABLE `categoria_has_artigo`
  ADD CONSTRAINT `categoria_has_artigo_ibfk_2` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `categoria_has_artigo_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Restrições para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`idartigo`) REFERENCES `artigo` (`idartigo`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
