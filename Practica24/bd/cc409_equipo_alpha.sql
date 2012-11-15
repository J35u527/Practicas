-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-11-2012 a las 13:54:43
-- Versión del servidor: 5.1.63
-- Versión de PHP: 5.3.3-7+squeeze14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cc409_equipo_alpha`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nom_Categoria` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `categoria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concurso`
--

CREATE TABLE IF NOT EXISTS `concurso` (
  `idConcurso` int(11) NOT NULL AUTO_INCREMENT,
  `NombreConcurso` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Hashtag` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Dificultad` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `FechaDeAlta` date NOT NULL,
  `FechaDeInicio` date NOT NULL,
  `DescripConcurso` text COLLATE utf8_spanish_ci NOT NULL,
  `FechaDeFin` date NOT NULL,
  `status` int(11) NOT NULL,
  `motivos` text COLLATE utf8_spanish_ci,
  `usuarioGanador` int(11) NOT NULL,
  `usuarioOrganizador` int(11) NOT NULL,
  PRIMARY KEY (`idConcurso`,`categoria`,`usuarioGanador`,`usuarioOrganizador`),
  KEY `fk_CONCURSO_USUARIO1_idx` (`usuarioGanador`),
  KEY `fk_CONCURSO_USUARIO2_idx` (`usuarioOrganizador`),
  KEY `fk_CONCURSO_CATEGORIA1_idx` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `concurso`
--


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `concurso_has_entrada`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE IF NOT EXISTS `entrada` (
  `idEntrada` int(11) NOT NULL AUTO_INCREMENT,
  `autor` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `FechaDeEnvio` date NOT NULL,
  `DescripEntrada` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `USUARIO_idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idEntrada`,`USUARIO_idUsuario`),
  KEY `fk_ENTRADA_USUARIO1_idx` (`USUARIO_idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `entrada`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE IF NOT EXISTS `imagenes` (
  `idIMAGENES` int(11) NOT NULL,
  `url_imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `CONCURSO_idConcurso` int(11) NOT NULL,
  PRIMARY KEY (`idIMAGENES`,`CONCURSO_idConcurso`),
  KEY `fk_IMAGENES_CONCURSO1_idx` (`CONCURSO_idConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `imagenes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `arrobaUsuario` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoDeUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `usuario`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `concurso`
--
ALTER TABLE `concurso`
  ADD CONSTRAINT `fk_CONCURSO_USUARIO1` FOREIGN KEY (`usuarioGanador`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CONCURSO_USUARIO2` FOREIGN KEY (`usuarioOrganizador`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CONCURSO_CATEGORIA1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `concurso_has_entrada`
--
ALTER TABLE `concurso_has_entrada`
  ADD CONSTRAINT `fk_Concurso_has_Entrada_Concurso1` FOREIGN KEY (`Concurso_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Concurso_has_Entrada_Entrada1` FOREIGN KEY (`Entrada_idEntrada`) REFERENCES `entrada` (`idEntrada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_ENTRADA_USUARIO1` FOREIGN KEY (`USUARIO_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `fk_IMAGENES_CONCURSO1` FOREIGN KEY (`CONCURSO_idConcurso`) REFERENCES `concurso` (`idConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
