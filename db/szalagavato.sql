-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Sze 18. 07:39
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
-- Tábla szerkezet ehhez a táblához `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `class` varchar(20) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `gallery`
--

INSERT INTO `gallery` (`id`, `class`, `image`) VALUES
(1, 'event', 'szalag.jpg'),
(2, 'event', 'Szalagavato.jpg'),
(3, 'event', 'szalagavato-fotozas.jpg'),
(4, 'home', 'h1-event.jpg'),
(5, 'home', 'maxresdefault.jpg'),
(6, 'home', 'szalagavato-szabadhegyi.jpeg'),
(7, '13A', 'erretsegi13A.jpg'),
(8, '13A', 'osztalykep_A01.jpg'),
(9, '13A', 'osztalykep_A02.jpg'),
(10, '13A', 'osztalykep_A03.jpg'),
(11, '13A', 'osztalykep_A04.jpg'),
(12, '13A', 'osztalykep_A05.jpg'),
(13, '13A', 'penzugy_A01.jpg'),
(14, '13A', 'turisztika_A01.jpg'),
(15, '13B', 'agazatiB.jpg'),
(16, '13B', 'erettsegi13B.jpg'),
(17, '13B', 'ivan.jpg'),
(18, '13B', 'marcius15.jpg'),
(19, '13B', 'osztalykep_B01.jpg'),
(20, '13B', 'osztalykep_B02.jpg'),
(21, '13B', 'osztalykep_B03.jpg'),
(22, '13C', 'agazatiC.jpg'),
(23, '13C', 'erettsegi13C.jpg'),
(24, '13C', 'forradalom.jpg'),
(25, '13C', 'helytallas.jpg'),
(26, '13C', 'mecha.jpg'),
(27, '13C', 'nonap.jpg'),
(28, '13C', 'osztalykep_C01.jpg'),
(29, '13C', 'pacek.jpg'),
(30, '13C', 'pacek2.jpg'),
(31, '13C', 'pacek3.jpg'),
(32, '13C', 'szanto.jpg'),
(33, '13C', 'szerencsekerek.jpg');

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
(1, 42),
(2, 56),
(3, 63),
(4, 54),
(5, 58),
(6, 72),
(7, 40),
(8, 71),
(9, 48),
(10, 33),
(11, 57),
(12, 41),
(13, 53),
(14, 55),
(15, 70),
(16, 45),
(17, 51),
(18, 68),
(19, 47),
(20, 62),
(21, 65),
(22, 37),
(23, 30),
(24, 73),
(25, 35),
(26, 28),
(29, 49),
(31, 50),
(32, 59),
(34, 64),
(36, 66),
(38, 44),
(39, 61),
(43, 67),
(46, 52);

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
  `class` varchar(10) NOT NULL,
  `height` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `students`
--

INSERT INTO `students` (`id`, `name`, `gender`, `taken`, `image`, `class`, `height`) VALUES
(1, 'Badó-Gulácsi Dániel', 'M', 1, 'BadoGulacsiDani.jpg', '13C', 175),
(2, 'Berta Barnabás', 'M', 1, 'BertaBarnabas.jpg', '13C', 170),
(3, 'Bokor Richárd', 'M', 1, 'BokorRicsi.jpg', '13C', 175),
(4, 'Dani Benedek', 'M', 1, 'DaniBenedek.jpg', '13C', 183),
(5, 'Döme Zoltán', 'M', 1, 'DomeZoltan.jpg', '13C', 180),
(6, 'Esser Balázs Dávid', 'M', 1, 'EsserBalazs.jpg', '13C', 175),
(7, 'Fodor Adrián László', 'M', 1, 'FodorAdrian.jpg', '13C', 180),
(8, 'Guvat Bence József', 'M', 1, 'GuvatBence.jpg', '13C', 186),
(9, 'Herczeg Máté János', 'M', 1, 'HerczegMate.png', '13C', 184),
(10, 'Kardos Zoltán', 'M', 1, 'KardosZoltan.jpg', '13C', 176),
(11, 'Kis David Csaba', 'M', 1, 'KisDavid.png', '13C', 175),
(12, 'Kis Marcell Zsombor', 'M', 1, 'KisMarcell.jpg', '13C', 190),
(13, 'Knoch Henrik', 'M', 1, 'KnochHenrik.jpg', '13C', 175),
(14, 'Kriván Balázs', 'M', 1, 'KrivanBalazs.jpg', '13C', 177),
(15, 'Kulcsár Tamás Ámon', 'M', 1, 'KulcsarTamas.jpg', '13C', 182),
(16, 'Miklós Martin', 'M', 1, 'MiklosMartin.jpg', '13C', 172),
(17, 'Oláh Zsigmond Sámuel', 'M', 1, 'OlahZsigmond.jpg', '13C', 186),
(18, 'Répa Norbert', 'M', 1, 'RepaNorbert.jpg', '13C', 191),
(19, 'Sötét Ármin', 'M', 1, 'SotetArmin.png', '13C', 168),
(20, 'Suba Benjamin', 'M', 1, 'SubaBenjamin.jpg', '13C', 188),
(21, 'Suhajda Ádám Dominik', 'M', 1, 'SuhajdaAdam.jpg', '13C', 185),
(22, 'Szabó Bence', 'M', 1, 'SzaboBence.jpg', '13C', 187),
(23, 'Szalontai László', 'M', 1, 'SzalontaiLaszlo.jpg', '13C', 188),
(24, 'Szántó Péter', 'M', 1, 'SzantoPeter.jpg', '13C', 178),
(25, 'Tokai Ádám', 'M', 1, 'TokaiAdam.jpg', '13C', 177),
(26, 'Tóth László Gábor', 'M', 1, 'TothLaszlo.jpg', '13C', 173),
(27, 'Andor Rebeka', 'F', 1, 'AndorRebeka.jpg', '13A', 177),
(28, 'Baróczi Gergő', 'M', 1, 'BarocziGergo.jpg', '13A', 190),
(29, 'Berta Sztella', 'F', 1, 'BertaSztella.jpg', '13A', 173),
(30, 'Boros Balázs', 'M', 1, 'BorosBalazs.jpg', '13A', 189),
(31, 'Derdák Csenge', 'F', 1, 'DerdakCsenge.jpg', '13A', 162),
(32, 'Erdélián Iringó', 'F', 1, 'ErdelianIringo.jpg', '13A', 163),
(33, 'Faragó Zorka', 'F', 1, 'FaragoZorka.jpg', '13A', 170),
(34, 'Gregor Lilla', 'F', 1, 'GregorLilla.jpg', '13A', 165),
(35, 'Horváth Zoé', 'F', 1, 'HorvathZoe.jpg', '13A', 166),
(36, 'Jankó Georgina', 'F', 1, 'JankoGeorgina.jpg', '13A', 164),
(37, 'Kerekes Ákos', 'M', 1, 'KerekesAkos.png', '13A', 189),
(38, 'Kis-Jakab Péter', 'M', 1, 'KisJakabPeter.jpg', '13A', 192),
(39, 'Koczkás Kíra', 'F', 1, 'KockaKira.png', '13B', 163),
(40, 'Kovács Dorka', 'F', 1, 'KovacsDorka.jpg', '13B', 170),
(41, 'Kovács Lara', 'F', 1, 'KovácsLara.jpg', '13A', 164),
(42, 'Lenhardt Ákos', 'M', 1, 'LenhardtAkos.jpg', '13A', 190),
(43, 'Mágori Adél', 'F', 1, 'MagoriAdel.jpg', '13A', 177),
(44, 'Mészáros Anna', 'F', 1, 'MeszarosAnna.jpg', '13A', 168),
(45, 'Nagy Kristóf', 'M', 1, 'NagyKristof.jpg', '13A', 187),
(46, 'Savanya Réka Gabriella', 'F', 1, 'SavanyaReka.jpg', '13A', 164),
(47, 'Schneider Evelyn', 'F', 1, 'SchneiderEvelyn.jpg', '13A', 163),
(48, 'Szabó Jázmin', 'F', 1, 'SzaboJazmin.jpg', '13A', 163),
(49, 'Szabó Kata', 'F', 1, 'SzaboKata.jpg', '13A', 166),
(50, 'Velek Panna', 'F', 1, 'VelekPanna.jpg', '13A', 173),
(51, 'Vetró Barbara', 'F', 1, 'VetroBarbara.jpg', '13A', 164),
(52, 'Vincze Kinga Jázmin', 'F', 1, 'VinczeKinga.jpg', '13A', 164),
(53, 'Zatykó Lili', 'F', 1, 'ZatykoLili.jpg', '13A', 170),
(54, 'Bálint Cintia', 'F', 1, 'BalintCintia.jpg', '13B', 167),
(55, 'Czékmán Lili', 'F', 1, 'CzekmanLili.jpg', '13B', 165),
(56, 'Csige Evelin', 'F', 1, 'CsigeEvelin.jpg', '13B', 164),
(57, 'Ferencsik Vivien', 'F', 1, 'FerencsikVivien.jpg', '13B', 165),
(58, 'Gyenge Iván', 'M', 1, 'GyengeIvan.jpg', '13B', 185),
(59, 'Illés Imre Dániel', 'M', 0, 'IllesImre.jpg', '13B', 172),
(60, 'Joó Nóra', 'F', 1, 'JooNora.jpg', '13B', 163),
(61, 'Loós Jázmin', 'F', 1, 'LoosJazmin.jpg', '13B', 168),
(62, 'Mak Szilvia', 'F', 1, 'MakSzilvia.jpg', '13B', 162),
(63, 'Mezei Dániel', 'M', 1, 'MezeiDaniel.jpg', '13B', 185),
(64, 'Pásztor Tímea', 'F', 1, 'PasztorTimea.jpg', '13B', 164),
(65, 'Pepó Gábor', 'M', 1, 'PepoGabor.jpg', '13B', 175),
(66, 'Szécsi Dóra', 'F', 1, 'SzecsiDora.jpg', '13B', 172),
(67, 'Sztojkó Lara', 'F', 1, 'SztojkoLara.jpg', '13B', 168),
(68, 'Varadik Armand', 'M', 0, 'VaradikArmand.png', '13B', 168),
(69, 'Dombi Ivett', 'F', 1, 'DombiIvett.jpg', '13A', 168),
(70, 'Ambrózy Vanda', 'F', 1, 'AmbrozyVanda.jpg', '13A', 170),
(71, 'Hegedűs Vivien', 'F', 1, 'HegedusVivien.jpg', '13A', 168),
(72, 'Kalász Eszter', 'F', 1, 'KalaszEszter.jpg', '13A', 173);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Badó-Gulácsi Dániel', 'badogulacsi.daniel-2021@keri.mako.hu', 'badogulacsidaniel13c'),
(2, 'Berta Barnabás', 'berta.barnabas-2021@keri.mako.hu', 'bertabarnabas13c'),
(3, 'Bokor Richárd', 'bokor.richard-2021@keri.mako.hu', 'bokorrichard13c'),
(4, 'Dani Benedek', 'dani.benedek-2021@keri.mako.hu', 'danibenedek13c'),
(5, 'Döme Zoltán', 'dome.zoltan-2021@keri.mako.hu', 'domezoltan13c'),
(6, 'Esser Balázs Dávid', 'esser.balazs-2021@keri.mako.hu', 'esserbalazsdavid13c'),
(7, 'Fodor Adrián László', 'fodor.adrian-2021@keri.mako.hu', 'fodoradrianlaszlo13c'),
(8, 'Guvat Bence József', 'guvat.bence-2021@keri.mako.hu', 'guvatbencejozsef13c'),
(9, 'Herczeg Máté János', 'herczeg.mate-2021@keri.mako.hu', 'herczegmatejanos13c'),
(10, 'Kardos Zoltán', 'kardos.zoltan-2021@keri.mako.hu', 'kardoszoltan13c'),
(11, 'Kis David Csaba', 'kis.david-2021@keri.mako.hu', 'kisdavidcsaba13c'),
(12, 'Kis Marcell Zsombor', 'kis.marcell-2021@keri.mako.hu', 'kismarcellzsombor13c'),
(13, 'Knoch Henrik', 'knoch.henrik-2021@keri.mako.hu', 'knochhenrik13c'),
(14, 'Kriván Balázs', 'krivan.balazs-2021@keri.mako.hu', 'krivanbalazs13c'),
(15, 'Kulcsár Tamás Ámon', 'kulcsar.tamas-2021@keri.mako.hu', 'kulcsartamasamon13c'),
(16, 'Miklós Martin', 'miklos.martin-2021@keri.mako.hu', 'miklosmartin13c'),
(17, 'Oláh Zsigmond Sámuel', 'olah.zsigmond-2021@keri.mako.hu', 'olahzsigmondsamuel13c'),
(18, 'Répa Norbert', 'repa.norbert-2021@keri.mako.hu', 'repanorbert13c'),
(19, 'Sötét Ármin', 'sotet.armin-2021@keri.mako.hu', 'sotetarmin13c'),
(20, 'Suba Benjamin', 'suba.benjamin-2021@keri.mako.hu', 'subabenjamin13c'),
(21, 'Suhajda Ádám Dominik', 'suhajda.adam-2021@keri.mako.hu', 'suhajdaadamdominik13c'),
(22, 'Szabó Bence', 'szabo.bence-2021@keri.mako.hu', 'szabobence13c'),
(23, 'Szalontai László', 'szalontai.laszlo-2021@keri.mako.hu', 'szalontailaszlo13c'),
(24, 'Szántó Péter', 'szanto.peter-2021@keri.mako.hu', 'szantopeter13c'),
(25, 'Tokai Ádám', 'tokai.adam-2021@keri.mako.hu', 'tokaiadam13c'),
(26, 'Tóth László Gábor', 'toth.laszlo-2021@keri.mako.hu', 'tothlaszlogabor13c'),
(27, 'Andor Rebeka', 'andor.rebeka-2021@keri.mako.hu', 'andorrebeka13a'),
(28, 'Baróczi Gergő', 'baroczi.gergo-2021@keri.mako.hu', 'baroczigergo13a'),
(29, 'Berta Sztella', 'berta.sztella-2021@keri.mako.hu', 'bertasztella13a'),
(30, 'Boros Balázs', 'boros.balazs-2021@keri.mako.hu', 'borosbalazs13a'),
(31, 'Derdák Csenge', 'derdak.csenge-2021@keri.mako.hu', 'derdakcsenge13a'),
(32, 'Erdélián Iringó', 'erdelian.iringo-2021@keri.mako.hu', 'erdelianiringo13a'),
(33, 'Faragó Zorka', 'farago.zorka-2021@keri.mako.hu', 'faragozorka13a'),
(34, 'Gregor Lilla', 'gregor.lilla-2021@keri.mako.hu', 'gregorlilla13a'),
(35, 'Horváth Zoé', 'horvath.zoe-2021@keri.mako.hu', 'horvathzoe13a'),
(36, 'Jankó Georgina', 'janko.georgina-2021@keri.mako.hu', 'jankogeorgina13a'),
(37, 'Kerekes Ákos', 'kerekes.akos-2021@keri.mako.hu', 'kerekesakos13a'),
(38, 'Kis-Jakab Péter', 'kisjakab.peter-2021@keri.mako.hu', 'kisjakabpeter13a'),
(39, 'Kocka Kira', 'kocka.kira-2021@keri.mako.hu', 'kockakira13a'),
(40, 'Kovács Dorka', 'kovacs.dorka-2021@keri.mako.hu', 'kovacsdorka13b'),
(41, 'Kovács Lara', 'kovacs.lara-2021@keri.mako.hu', 'kovacslara13a'),
(42, 'Lenhardt Ákos', 'lenhardt.akos-2021@keri.mako.hu', 'lenhardtakos13a'),
(43, 'Mágori Adél', 'magori.adel-2021@keri.mako.hu', 'magoriadel13a'),
(44, 'Mészáros Anna', 'meszaros.anna-2021@keri.mako.hu', 'meszarosanna13a'),
(45, 'Nagy Kristóf', 'nagy.kristof-2021@keri.mako.hu', 'nagykristof13a'),
(46, 'Savanya Réka Gabriella', 'savanya.reka-2021@keri.mako.hu', 'savanyarekagabriella13a'),
(47, 'Schneider Evelyn', 'schneider.evelyn-2021@keri.mako.hu', 'schneiderevelyn13a'),
(48, 'Szabó Jázmin', 'szabo.jazmin-2021@keri.mako.hu', 'szabojazmin13a'),
(49, 'Szabó Kata', 'szabo.kata-2021@keri.mako.hu', 'szabokata13a'),
(50, 'Velek Panna', 'velek.panna-2021@keri.mako.hu', 'velekpanna13a'),
(51, 'Vetró Barbara', 'vetro.barbara-2021@keri.mako.hu', 'vetrobarbara13a'),
(52, 'Vincze Kinga Jázmin', 'vincze.kinga-2021@keri.mako.hu', 'vinczekingajazmin13a'),
(53, 'Zatykó Lili', 'zatyko.lili-2021@keri.mako.hu', 'zatykolili13a'),
(54, 'Bálint Cintia', 'balint.cintia-2021@keri.mako.hu', 'balintcintia13b'),
(55, 'Czékmán Lili', 'czekman.lili-2021@keri.mako.hu', 'czekmanlili13b'),
(56, 'Csige Evelin', 'csige.evelin-2021@keri.mako.hu', 'csigeevelin13b'),
(57, 'Ferencsik Vivien', 'ferencsik.vivien-2021@keri.mako.hu', 'ferencsikvivien13b'),
(58, 'Gyenge Iván', 'gyenge.ivan-2021@keri.mako.hu', 'gyengeivan13b'),
(59, 'Illés Imre Dániel', 'illes.imre-2021@keri.mako.hu', 'illesimredaniel13b'),
(60, 'Joó Nóra', 'joo.nora-2021@keri.mako.hu', 'joonora13b'),
(61, 'Loós Jázmin', 'loos.jazmin-2021@keri.mako.hu', 'loosjazmin13b'),
(62, 'Mak Szilvia', 'mak.szilvia-2021@keri.mako.hu', 'makszilvia13b'),
(63, 'Mezei Dániel', 'mezei.daniel-2021@keri.mako.hu', 'mezeidaniel13b'),
(64, 'Pásztor Tímea', 'pasztor.timea-2021@keri.mako.hu', 'pasztortimea13b'),
(65, 'Pepó Gábor', 'pepo.gabor-2021@keri.mako.hu', 'pepogabor13b'),
(66, 'Szécsi Dóra', 'szecsi.dora-2021@keri.mako.hu', 'szecsidora13b'),
(67, 'Sztojkó Lara', 'sztojko.lara-2021@keri.mako.hu', 'sztojkolara13b'),
(68, 'Varadik Armand', 'varadik.armand-2021@keri.mako.hu', 'varadikarmand13b'),
(69, 'Dombi Ivett', 'dombi.ivett-2021@keri.mako.hu', 'dombiivett13a'),
(70, 'Ambrózy Vanda', 'ambrozy.vanda-2021@keri.mako.hu', 'ambrozyvanda13a'),
(999, 'admin', 'admin@gmail.com', 'admin123');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `blocklist`
--
ALTER TABLE `blocklist`
  ADD UNIQUE KEY `user_id1` (`user_id`,`blocked_user_id`);

--
-- A tábla indexei `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT a táblához `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT a táblához `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
