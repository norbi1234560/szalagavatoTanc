-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Sze 10. 09:15
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
-- Tábla szerkezet ehhez a táblához `blocklist`
--

CREATE TABLE `blocklist` (
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `blocklist`
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
-- Tábla szerkezet ehhez a táblához `pairs`
--

CREATE TABLE `pairs` (
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `pairs`
--

INSERT INTO `pairs` (`user_id1`, `user_id2`) VALUES
(5, 9),
(8, 6);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `taken` tinyint(1) NOT NULL,
  `image` varchar(60) DEFAULT NULL,
  `class` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `students`
--

INSERT INTO `students` (`id`, `name`, `gender`, `taken`, `image`, `class`) VALUES
(1, 'Badó-Gulácsi Dániel', 'M', 0, 'BadoGulacsiDani.jpg', '13C'),
(2, 'Berta Barnabás', 'M', 0, 'BertaBarnabas.jpg', '13C'),
(3, 'Bokor Richárd', 'M', 0, 'BokorRicsi.jpg', '13C'),
(4, 'Dani Benedek', 'M', 0, 'DaniBenedek.jpg', '13C'),
(5, 'Döme Zoltán', 'M', 0, 'DomeZoltan.jpg', '13C'),
(6, 'Esser Balázs Dávid', 'M', 0, 'EsserBalazs.jpg', '13C'),
(7, 'Fodor Adrián László', 'M', 0, 'FodorAdrian.jpg', '13C'),
(8, 'Guvat Bence József', 'M', 0, 'GuvatBence.jpg', '13C'),
(9, 'Herczeg Máté János', 'M', 0, 'HerczegMate.png', '13C'),
(10, 'Kardos Zoltán', 'M', 0, 'KardosZoltan.jpg', '13C'),
(11, 'Kis David Csaba', 'M', 0, 'KisDavid.png', '13C'),
(12, 'Kis Marcell Zsombor', 'M', 0, 'KisMarcell.jpg', '13C'),
(13, 'Knoch Henrik', 'M', 0, 'KnochHenrik.jpg', '13C'),
(14, 'Kriván Balázs', 'M', 0, 'KrivanBalazs.jpg', '13C'),
(15, 'Kulcsár Tamás Ámon', 'M', 0, 'KulcsarTamas.jpg', '13C'),
(16, 'Miklós Martin', 'M', 0, 'MiklosMartin.jpg', '13C'),
(17, 'Oláh Zsigmond Sámuel', 'M', 0, 'OlahZsigmond.jpg', '13C'),
(18, 'Répa Norbert', 'M', 0, 'RepaNorbert.jpg', '13C'),
(19, 'Sötét Ármin', 'M', 0, 'SotetArmin.png', '13C'),
(20, 'Suba Benjamin', 'M', 0, 'SubaBenjamin.jpg', '13C'),
(21, 'Suhajda Ádám Dominik', 'M', 0, 'SuhajdaAdam.jpg', '13C'),
(22, 'Szabó Bence', 'M', 0, 'SzaboBence.jpg', '13C'),
(23, 'Szalontai László', 'M', 0, 'SzalontaiLaszlo.jpg', '13C'),
(24, 'Szántó Péter', 'M', 0, 'SzantoPeter.jpg', '13C'),
(25, 'Tokai Ádám', 'M', 0, 'TokaiAdam.jpg', '13C'),
(26, 'Tóth László Gábor', 'M', 0, 'TothLaszlo.jpg', '13C'),
(27, 'Berta Barnabás', 'M', 0, 'BertaBarnabas.jpg', '13C'),
(28, 'Andor Rebeka', 'F', 0, 'AndorRebeka.jpg', '13A'),
(29, 'Baróczi Gergő', 'M', 0, 'BarocziGergo.jpg', '13A'),
(30, 'Berta Sztella', 'F', 0, 'BertaSztella.jpg', '13A'),
(31, 'Boros Balázs', 'M', 0, 'BorosBalazs.jpg', '13A'),
(32, 'Derdák Csenge', 'F', 0, 'DerdakCsenge.jpg', '13A'),
(33, 'Erdélián Iringó', 'F', 0, 'ErdelianIringo.jpg', '13A'),
(34, 'Faragó Zorka', 'F', 0, 'FaragoZorka.jpg', '13A'),
(35, 'Gregor Lilla', 'F', 0, 'GregorLilla.jpg', '13A'),
(36, 'Horváth Zoé', 'F', 0, 'HorvathZoe.jpg', '13A'),
(37, 'Jankó Georgina', 'F', 0, 'JankoGeorgina.jpg', '13A'),
(38, 'Kerekes Ákos', 'M', 0, 'KerekesAkos.png', '13A'),
(39, 'Kis-Jakab Péter', 'M', 0, 'KisJakabPeter.jpg', '13A'),
(40, 'Kocka Kira', 'F', 0, 'KockaKira.png', '13A'),
(41, 'Kovács Dorka', 'F', 0, 'KovacsDorka.jpg', '13A'),
(42, 'Kovács Lara', 'F', 0, 'KovácsLara.jpg', '13A'),
(43, 'Lenhardt Ákos', 'M', 0, 'LenhardtAkos.jpg', '13A'),
(44, 'Mágori Adél', 'F', 0, 'MagoriAdel.jpg', '13A'),
(45, 'Mészáros Anna', 'F', 0, 'MeszarosAnna.jpg', '13A'),
(46, 'Nagy Kristóf', 'M', 0, 'NagyKristof.jpg', '13A'),
(47, 'Savanya Réka Gabriella', 'F', 0, 'SavanyaReka.jpg', '13A'),
(48, 'Schneider Evelyn', 'F', 0, 'SchneiderEvelyn.jpg', '13A'),
(49, 'Szabó Jázmin', 'F', 0, 'SzaboJazmin.jpg', '13A'),
(50, 'Szabó Kata', 'F', 0, 'SzaboKata.jpg', '13A'),
(51, 'Velek Panna', 'F', 0, 'VelekPanna.jpg', '13A'),
(52, 'Vetró Barbara', 'F', 0, 'VetroBarbara.jpg', '13A'),
(53, 'Vincze Kinga Jázmin', 'F', 0, 'VinczeKinga.jpg', '13A'),
(54, 'Zatykó Lili', 'F', 0, 'ZatykoLili.jpg', '13A'),
(55, 'Bálint Cintia', 'F', 0, 'BalintCintia.jpg', '13B'),
(56, 'Czékmán Lili', 'F', 0, 'CzekmanLili.jpg', '13B'),
(57, 'Csige Evelin', 'F', 0, 'CsigeEvelin.jpg', '13B'),
(58, 'Ferencsik Vivien', 'F', 0, 'FerencsikVivien.jpg', '13B'),
(59, 'Gyenge Iván', 'M', 0, 'GyengeIvan.jpg', '13B'),
(60, 'Illés Imre Dániel', 'M', 0, 'IllesImre.jpg', '13B'),
(61, 'Joó Nóra', 'F', 0, 'JooNora.jpg', '13B'),
(62, 'Loós Jázmin', 'F', 0, 'LoosJazmin.jpg', '13B'),
(63, 'Mak Szilvia', 'F', 0, 'MakSzilvia.jpg', '13B'),
(64, 'Mezei Dániel', 'M', 0, 'MezeiDaniel.jpg', '13B'),
(65, 'Pásztor Tímea', 'F', 0, 'PasztorTimea.jpg', '13B'),
(66, 'Pepó Gábor', 'M', 0, 'PepoGabor.jpg', '13B'),
(67, 'Szécsi Dóra', 'F', 0, 'SzecsiDora.jpg', '13B'),
(68, 'Sztojkó Lara', 'F', 0, 'SztojkoLara.jpg', '13B'),
(69, 'Varadik Armand', 'M', 0, 'VaradikArmand.png', '13B');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `blocklist`
--
ALTER TABLE `blocklist`
  ADD UNIQUE KEY `user_id1` (`user_id`,`blocked_user_id`);

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
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
