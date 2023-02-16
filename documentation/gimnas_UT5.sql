-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2022 a las 11:53:49
-- Versión del servidor: 10.4.6-MariaDB-log
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE  IF NOT EXISTS `gimnasio_DWES05`;
USE `gimnasio_DWES05`;

--
-- Base de datos: `gimnas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `llinatges` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `password` char(102) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `username`, `nom`, `llinatges`, `email`, `telefon`, `password`) VALUES
(1, 'amartinez', 'Angel', 'Martinez', 'amartinez@example.com', '666777888', 'pbkdf2:sha256:260000$FmeGDLSwcd69n5QI$6df8f7701a2daa6a0bad1119a3832b585f0ec9d658bb429552e3694a63d3dc25'),
(2, 'sikari', 'Shinji', 'Ikari', 'sikari@example.com', '666222888', 'pbkdf2:sha256:260000$10eZ4touJOL9A0Tl$001ca267fd695e4edaaf4412db0dfe70f4a05b323694045d2c30335614d992c7'),
(3, 'alangley', 'Asuka', 'Langley', 'alangley@example.com', '666333888', 'pbkdf2:sha256:260000$A9FpUwmSPxeZ552p$7037ca1fbbacb6bbb562984a542581c8ce8b641fc21de2fe120fa5b91ea4e2e1'),
(4, 'hkensjin', 'Himura', 'Kenshin', 'hkensjin@example.com', '666444888', 'pbkdf2 :sha256 :260000$FmeGDLSwcd69n5QI$6df8f7701a2daa6a0bad1119a3832b585f0ec9d658bb429552e3694a63d3dc'),
(5, 'SaulGman', 'pepe', 'Goodman', '', '999777555', 'pbkdf2:sha256:260000$92p0bfnAB1JzNLzc$070f91a33e5c30b6f2c2870b6f3ceba2065603577fdb46152994a9a3061ba226');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistes`
--

CREATE TABLE `pistes` (
  `idpista` int(11) NOT NULL,
  `tipo` enum('Coberta','Exterior') NOT NULL,
  `preu` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pistes`
--

INSERT INTO `pistes` (`idpista`, `tipo`, `preu`) VALUES
(1, 'Coberta', 12),
(2, 'Exterior', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserves`
--

CREATE TABLE `reserves` (
  `data` datetime NOT NULL,
  `idpista` int(11) NOT NULL,
  `idclient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserves`
--

INSERT INTO `reserves` (`data`, `idpista`, `idclient`) VALUES
('2023-01-09 21:00:00', 1, 1),
('2023-01-25 15:00:00', 1, 1),
('2023-02-02 16:00:00', 1, 1),
('2023-02-06 15:00:00', 1, 1),
('2023-02-15 15:00:00', 1, 1),
('2023-02-16 15:00:00', 1, 1),
('2023-02-21 16:00:00', 1, 1),
('2023-02-24 19:00:00', 2, 1),
('2023-02-21 15:00:00', 2, 2),
('2023-03-07 15:00:00', 2, 2),
('2023-02-15 17:00:00', 2, 3),
('2022-11-04 17:00:00', 1, 4),
('2022-11-08 16:00:00', 1, 4),
('2022-11-30 17:00:00', 2, 4),
('2022-11-09 16:00:00', 1, 5),
('2023-02-14 21:00:00', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `llinatges` varchar(50) DEFAULT NULL,
  `telefon` varchar(50) DEFAULT NULL,
  `diaalta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id`, `username`, `password`, `email`, `nom`, `llinatges`, `telefon`, `diaalta`) VALUES
(1, 'jose', 'pbkdf2:sha256:260000$ux2sFlCJ65ZbGJkA$eaf6b612d6324680d24eb3a93ed9e26d8c86c9f0853c1d13e12ffd339a857cb6', 'jose.merinopanades@gmail.com', 'Jose', 'Merino', '333444555', '2022-10-04'),
(2, 'root', 'pbkdf2:sha256:260000$ux2sFlCJ65ZbGJkA$eaf6b612d6324680d24eb3a93ed9e26d8c86c9f0853c1d13e12ffd339a857cb6', 'administrador@paucasesnovescifp.cat', 'Super', 'Jefe', '999111222', '2022-10-05'),
(3, 'user1', 'pbkdf2:sha256:260000$ux2sFlCJ65ZbGJkA$eaf6b612d6324680d24eb3a93ed9e26d8c86c9f0853c1d13e12ffd339a857cb6', 'user1@hotmail.com', 'usuario', 'anonimo', '456456456', '2022-09-15'),
(4, 'administrador', 'pbkdf2:sha256:260000$ux2sFlCJ65ZbGJkA$eaf6b612d6324680d24eb3a93ed9e26d8c86c9f0853c1d13e12ffd339a857cb6', 'jlmerino@sampol.com', 'Pep', 'Mula', '971764476', '2022-11-03'),
(5, 'paucasesnoves', 'pbkdf2:sha256:260000$qpOrJdVM7KGPqfg6$b2d6b3c2a29bbc409ca45fdb1c11e2e28d0e5907816de4121029a0bf5f254391', 'paucases@gmail.com', 'Pau', 'Casesnoves', '123456789', '2022-11-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pistes`
--
ALTER TABLE `pistes`
  ADD PRIMARY KEY (`idpista`);

--
-- Indices de la tabla `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`data`,`idpista`),
  ADD KEY `r_idpista` (`idpista`),
  ADD KEY `reserves_ibfk_1` (`idclient`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pistes`
--
ALTER TABLE `pistes`
  MODIFY `idpista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserves`
--
ALTER TABLE `reserves`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `usuaris` (`id`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`idpista`) REFERENCES `pistes` (`idpista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
