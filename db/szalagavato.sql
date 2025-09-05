-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Sze 05. 09:36
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szalagavato`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pairs`
--

CREATE TABLE `pairs` (
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `image` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `students`
--

INSERT INTO `students` (`id`, `name`, `gender`, `taken`, `image`) VALUES
(1, 'Badó-Gulácsi Dániel', 'M', 0, NULL),
(2, 'Berta Barnabás', 'M', 0, NULL),
(3, 'Bokor Richárd', 'M', 0, NULL),
(4, 'Dani Benedek', 'M', 0, NULL),
(5, 'Döme Zoltán', 'M', 0, NULL),
(6, 'Esser Balázs Dávid', 'M', 0, NULL),
(7, 'Fodor Adrián László', 'M', 0, NULL),
(8, 'Guvat Bence József', 'M', 0, NULL),
(9, 'Herczeg Máté János', 'M', 0, NULL),
(10, 'Kardos Zoltán', 'M', 0, NULL),
(11, 'Kis David Csaba', 'M', 0, NULL),
(12, 'Kis Marcell Zsombor', 'M', 0, NULL),
(13, 'Knoch Henrik', 'M', 0, NULL),
(14, 'Kriván Balázs', 'M', 0, NULL),
(15, 'Kulcsár Tamás Ámon', 'M', 0, NULL),
(16, 'Miklós Martin', 'M', 0, NULL),
(17, 'Oláh Zsigmond Sámuel', 'M', 0, NULL),
(18, 'Répa Norbert', 'M', 0, NULL),
(19, 'Sötét Ármin', 'M', 0, NULL),
(20, 'Suba Benjamin', 'M', 0, NULL),
(21, 'Suhajda Ádám Dominik', 'M', 0, NULL),
(22, 'Szabó Bence', 'M', 0, NULL),
(23, 'Szalontai László', 'M', 0, NULL),
(24, 'Szántó Péter', 'M', 0, NULL),
(25, 'Tokai Ádám', 'M', 0, NULL),
(26, 'Tóth László Gábor', 'M', 0, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pairs`
--
ALTER TABLE `pairs`
  ADD UNIQUE KEY `user_id1` (`user_id1`,`user_id2`);

--
-- A tábla indexei `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
