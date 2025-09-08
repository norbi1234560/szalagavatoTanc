-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2025 at 11:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szalagavato`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocklist`
--

CREATE TABLE `blocklist` (
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `blocklist`
--

INSERT INTO `blocklist` (`user_id`, `blocked_user_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(2, 0),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pairs`
--

CREATE TABLE `pairs` (
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pairs`
--

INSERT INTO `pairs` (`user_id1`, `user_id2`) VALUES
(5, 9),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `image` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `gender`, `taken`, `image`) VALUES
(1, 'Badó-Gulácsi Dániel', 'M', 0, 'BadoGulacsiDani.jpg'),
(2, 'Berta Barnabás', 'M', 0, 'BertaBarnabas.jpg'),
(3, 'Bokor Richárd', 'M', 0, 'BokorRicsi.jpg'),
(4, 'Dani Benedek', 'M', 0, 'DaniBenedek.jpg'),
(5, 'Döme Zoltán', 'M', 0, 'DomeZoltan.jpg'),
(6, 'Esser Balázs Dávid', 'M', 0, 'EsserBalazs.jpg'),
(7, 'Fodor Adrián László', 'M', 0, 'FodorAdrian.jpg'),
(8, 'Guvat Bence József', 'M', 0, 'GuvatBence.jpg'),
(9, 'Herczeg Máté János', 'M', 0, 'HerczegMate.png'),
(10, 'Kardos Zoltán', 'M', 0, 'KardosZoltan.jpg'),
(11, 'Kis David Csaba', 'M', 0, 'KisDavid.png'),
(12, 'Kis Marcell Zsombor', 'M', 0, 'KisMarcell.jpg'),
(13, 'Knoch Henrik', 'M', 0, 'KnochHenrik.jpg'),
(14, 'Kriván Balázs', 'M', 0, 'KrivanBalazs.jpg'),
(15, 'Kulcsár Tamás Ámon', 'M', 0, 'KulcsarTamas.jpg'),
(16, 'Miklós Martin', 'M', 0, 'MiklosMartin.jpg'),
(17, 'Oláh Zsigmond Sámuel', 'M', 0, 'OlahZsigmond.jpg'),
(18, 'Répa Norbert', 'M', 0, 'RepaNorbert.jpg'),
(19, 'Sötét Ármin', 'M', 0, 'SotetArmin.png'),
(20, 'Suba Benjamin', 'M', 0, 'SubaBenjamin.jpg'),
(21, 'Suhajda Ádám Dominik', 'M', 0, 'SuhajdaAdam.jpg'),
(22, 'Szabó Bence', 'M', 0, 'SzaboBence.jpg'),
(23, 'Szalontai László', 'M', 0, 'SzalontaiLaszlo.jpg'),
(24, 'Szántó Péter', 'M', 0, 'SzantoPeter.jpg'),
(25, 'Tokai Ádám', 'M', 0, 'TokaiAdam.jpg'),
(26, 'Tóth László Gábor', 'M', 0, 'TothLaszlo.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocklist`
--
ALTER TABLE `blocklist`
  ADD UNIQUE KEY `user_id1` (`user_id`,`blocked_user_id`);

--
-- Indexes for table `pairs`
--
ALTER TABLE `pairs`
  ADD UNIQUE KEY `user_id1` (`user_id1`,`user_id2`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
