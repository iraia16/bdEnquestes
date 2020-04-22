-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 22, 2020 at 03:48 PM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.3.9-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dam2`
--

-- --------------------------------------------------------

--
-- Table structure for table `contesta`
--

CREATE TABLE `contesta` (
  `id_participant` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_resposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `usuari` varchar(20) NOT NULL,
  `contrasenya` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `correu` varchar(20) NOT NULL,
  `admin` varchar(20) NOT NULL,
  `cif` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `enquesta`
--

CREATE TABLE `enquesta` (
  `id` int(11) NOT NULL,
  `remuneracio` float NOT NULL,
  `data_inici` date NOT NULL,
  `data_fi` date DEFAULT NULL,
  `participants` int(11) DEFAULT NULL,
  `edat_min` date DEFAULT NULL,
  `edat_max` date DEFAULT NULL,
  `fumes` tinyint(1) DEFAULT NULL,
  `transport_public` tinyint(1) DEFAULT NULL,
  `gust_pelis` tinyint(1) DEFAULT NULL,
  `sexe` char(1) DEFAULT NULL,
  `nivell_estudis` int(11) DEFAULT NULL,
  `treballes` tinyint(1) DEFAULT NULL,
  `estudies` tinyint(1) DEFAULT NULL,
  `llegeix` tinyint(1) DEFAULT NULL,
  `videojocs` tinyint(1) DEFAULT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `omple`
--

CREATE TABLE `omple` (
  `id_participant` int(11) NOT NULL,
  `id_enquesta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `usuari` varchar(20) NOT NULL,
  `contrasenya` varchar(20) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognoms` varchar(40) NOT NULL,
  `correu` varchar(20) NOT NULL,
  `data_naix` date NOT NULL,
  `data_registre` date NOT NULL,
  `preg_seguretat` varchar(50) NOT NULL,
  `resp_seguretat` varchar(30) NOT NULL,
  `saldo` float NOT NULL,
  `sexe` char(1) NOT NULL,
  `treballes` tinyint(1) NOT NULL,
  `estudies` tinyint(1) NOT NULL,
  `fills` int(11) NOT NULL,
  `nivell_estudis` int(11) NOT NULL,
  `fumes` tinyint(1) NOT NULL,
  `carnet` tinyint(1) NOT NULL,
  `llegeixes` tinyint(1) NOT NULL,
  `videojocs` tinyint(1) NOT NULL,
  `transport_public` tinyint(1) NOT NULL,
  `gust_pelis` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `id_enquesta` int(11) NOT NULL,
  `descripcio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resposta`
--

CREATE TABLE `resposta` (
  `id` int(11) NOT NULL,
  `id_enquesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `descripcio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contesta`
--
ALTER TABLE `contesta`
  ADD PRIMARY KEY (`id_participant`,`id_pregunta`,`id_resposta`),
  ADD KEY `FKpregunta` (`id_pregunta`),
  ADD KEY `FKresposta` (`id_resposta`),
  ADD KEY `FKpart` (`id_participant`) USING BTREE;

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquesta`
--
ALTER TABLE `enquesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKempresa` (`id_empresa`);

--
-- Indexes for table `omple`
--
ALTER TABLE `omple`
  ADD PRIMARY KEY (`id_participant`,`id_enquesta`),
  ADD KEY `FKenquesta` (`id_enquesta`) USING BTREE,
  ADD KEY `FKempresa` (`id_participant`) USING BTREE;

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`,`id_enquesta`),
  ADD KEY `FKenquesta` (`id_enquesta`);

--
-- Indexes for table `resposta`
--
ALTER TABLE `resposta`
  ADD PRIMARY KEY (`id`,`id_enquesta`,`id_pregunta`),
  ADD KEY `FKenquesta2` (`id_enquesta`),
  ADD KEY `FKpregunta2` (`id_pregunta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquesta`
--
ALTER TABLE `enquesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resposta`
--
ALTER TABLE `resposta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contesta`
--
ALTER TABLE `contesta`
  ADD CONSTRAINT `FKpart` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id`),
  ADD CONSTRAINT `FKpregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`),
  ADD CONSTRAINT `FKresposta` FOREIGN KEY (`id_resposta`) REFERENCES `resposta` (`id`);

--
-- Constraints for table `enquesta`
--
ALTER TABLE `enquesta`
  ADD CONSTRAINT `FKempresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`);

--
-- Constraints for table `omple`
--
ALTER TABLE `omple`
  ADD CONSTRAINT `enquesta` FOREIGN KEY (`id_enquesta`) REFERENCES `enquesta` (`id`),
  ADD CONSTRAINT `participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id`);

--
-- Constraints for table `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FKenquesta` FOREIGN KEY (`id_enquesta`) REFERENCES `enquesta` (`id`);

--
-- Constraints for table `resposta`
--
ALTER TABLE `resposta`
  ADD CONSTRAINT `FKenquesta2` FOREIGN KEY (`id_enquesta`) REFERENCES `enquesta` (`id`),
  ADD CONSTRAINT `FKpregunta2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
