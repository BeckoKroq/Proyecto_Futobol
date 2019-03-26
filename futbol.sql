-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-03-2019 a las 16:22:02
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `COD_EQUIPO` varchar(20) NOT NULL,
  `NOM_EQUIPO` varchar(50) NOT NULL,
  `NOM_ESTADIO` varchar(50) NOT NULL,
  `CIUDAD` varchar(50) NOT NULL,
  `AÑO_FUNDACION` date NOT NULL,
  `AFORO` varchar(50) NOT NULL,
  `COD_PARTIDO` int(11) NOT NULL,
  PRIMARY KEY (`COD_EQUIPO`),
  UNIQUE KEY `COD_PARTIDO` (`COD_PARTIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goles`
--

DROP TABLE IF EXISTS `goles`;
CREATE TABLE IF NOT EXISTS `goles` (
  `minuto` varchar(5) DEFAULT NULL,
  `descripcion` text,
  `cod_partido` int(11) DEFAULT NULL,
  KEY `cod_partido` (`cod_partido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

DROP TABLE IF EXISTS `jugador`;
CREATE TABLE IF NOT EXISTS `jugador` (
  `COD_JUGADOR` int(11) NOT NULL,
  `NOMBRE` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `FECHA_NAC` date NOT NULL,
  `POSICION` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `COD_PARTIDO` int(11) NOT NULL,
  PRIMARY KEY (`COD_JUGADOR`),
  UNIQUE KEY `COD_PARTIDO` (`COD_PARTIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `COD_PARTIDO` int(11) NOT NULL,
  `FECHA_JUEGO` date NOT NULL,
  `GOLES_CASA` int(11) NOT NULL,
  `GOLES_FUERA` int(11) NOT NULL,
  UNIQUE KEY `COD_PARTIDO` (`COD_PARTIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presidente`
--

DROP TABLE IF EXISTS `presidente`;
CREATE TABLE IF NOT EXISTS `presidente` (
  `DNI` varchar(10) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `FECHA_NACIMIENTO` varchar(10) NOT NULL,
  `EQUIPO_PRESIDENTE` varchar(20) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `EQUIPO_PRESIDENTE` (`EQUIPO_PRESIDENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`COD_EQUIPO`) REFERENCES `presidente` (`EQUIPO_PRESIDENTE`);

--
-- Filtros para la tabla `goles`
--
ALTER TABLE `goles`
  ADD CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`cod_partido`) REFERENCES `partido` (`COD_PARTIDO`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`COD_PARTIDO`) REFERENCES `equipo` (`COD_PARTIDO`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`COD_PARTIDO`) REFERENCES `jugador` (`COD_PARTIDO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
