-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-10-2012 a las 03:59:12
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- Base de datos: `dbConcursos`
--
CREATE DATABASE `dbConcursos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbConcursos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nom_Categoria` varchar(45) NOT NULL,
  `USUARIO_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idCategoria`,`USUARIO_idUsuario`),
  KEY `fk_CATEGORIA_USUARIO1_idx` (`USUARIO_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concurso`
--

CREATE TABLE IF NOT EXISTS `concurso` (
  `idConcurso` int(11) NOT NULL AUTO_INCREMENT,
  `NombreConcurso` varchar(30) NOT NULL,
  `hashtag` varchar(30) NOT NULL,
  `Dificultad` int(11) NOT NULL,
  `Categoria` varchar(10) NOT NULL,
  `FechaDeAlta` date NOT NULL,
  `fechaDeInicio` date NOT NULL,
  `FechaFin` date NOT NULL,
  `Organizador` varchar(20) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  PRIMARY KEY (`idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concurso_has_entrada`
--

CREATE TABLE IF NOT EXISTS `concurso_has_entrada` (
  `Concurso_idConcurso` int(11) NOT NULL,
  `Entrada_idEntrada` int(11) NOT NULL,
  PRIMARY KEY (`Concurso_idConcurso`,`Entrada_idEntrada`),
  KEY `fk_Concurso_has_Entrada_Entrada1_idx` (`Entrada_idEntrada`),
  KEY `fk_Concurso_has_Entrada_Concurso1_idx` (`Concurso_idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concurso_has_usuario`
--

CREATE TABLE IF NOT EXISTS `concurso_has_usuario` (
  `Concurso_idConcurso` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`Concurso_idConcurso`,`Usuario_idUsuario`),
  KEY `fk_Concurso_has_Usuario_Usuario1_idx` (`Usuario_idUsuario`),
  KEY `fk_Concurso_has_Usuario_Concurso_idx` (`Concurso_idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE IF NOT EXISTS `entrada` (
  `idEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `FechaDeEnvio` date DEFAULT NULL,
  `DescripEntrada` varchar(500) DEFAULT NULL,
  `Concurso_idConcurso` int(11) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `fk_Entrada_Concurso1_idx` (`Concurso_idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `idIMAGENES` int(11) NOT NULL,
  `url_imagen` varchar(100) NOT NULL,
  `CONCURSO_idConcurso` int(11) NOT NULL,
  PRIMARY KEY (`idIMAGENES`,`CONCURSO_idConcurso`),
  KEY `fk_IMAGENES_CONCURSO1_idx` (`CONCURSO_idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `arrobaUsuario` varchar(20) DEFAULT NULL,
  `tipoDeUsuario` int(11) DEFAULT NULL,
  `Entrada_idEntrada` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Entrada1_idx` (`Entrada_idEntrada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_CATEGORIA_USUARIO1` FOREIGN KEY (`USUARIO_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `concurso_has_entrada`
--
ALTER TABLE `concurso_has_entrada`
  ADD CONSTRAINT `fk_Concurso_has_Entrada_Concurso1` FOREIGN KEY (`Concurso_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Concurso_has_Entrada_Entrada1` FOREIGN KEY (`Entrada_idEntrada`) REFERENCES `entrada` (`idEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `concurso_has_usuario`
--
ALTER TABLE `concurso_has_usuario`
  ADD CONSTRAINT `fk_Concurso_has_Usuario_Concurso` FOREIGN KEY (`Concurso_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Concurso_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_Entrada_Concurso1` FOREIGN KEY (`Concurso_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_IMAGENES_CONCURSO1` FOREIGN KEY (`CONCURSO_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Entrada1` FOREIGN KEY (`Entrada_idEntrada`) REFERENCES `entrada` (`idEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--

