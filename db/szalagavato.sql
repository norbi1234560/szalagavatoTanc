-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Sze 26. 10:40
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
-- Tábla szerkezet ehhez a táblához `language`
--

CREATE TABLE `language` (
  `language` char(2) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `language`
--

INSERT INTO `language` (`language`, `data`) VALUES
('cn', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Informatika\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"首页\",\r\n        \"event\": \"活动\",\r\n        \"pair\": \"配对\",\r\n        \"classes\": \"班级\",\r\n        \"class\": \"班级\",\r\n        \"login\": \"登录\",\r\n        \"logout\": \"登出\",\r\n        \"gallery\": \"登出\",\r\n        \"profile_edit\": \"配置文件修改\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"HSZC Návay Lajos 职业培训中心和宿舍 2025-2026 毕业舞会\",\r\n        \"event_description\": \"毕业舞会是每一位毕业生人生中特别的时刻。这个活动不仅象征着学业的结束，也意味着新人生阶段的开始。我们自豪地佩戴象征学校、老师和同学之间联系的绶带。感谢一路支持我们的人！\",\r\n        \"interest\": \"您是否对我们的毕业舞会感兴趣并想购买门票？\",\r\n        \"click_here\": \"点击这里！\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"班级\",\r\n        \"more\": \"更多\",\r\n        \"gender\": \"性别\",\r\n        \"man\": \"男\",\r\n        \"woman\": \"女\",\r\n        \"all\": \"所有\",\r\n        \"height\": \"身高\",\r\n        \"block_list\": \"黑名单\",\r\n        \"close\": \"关闭\",\r\n        \"no_pair\": \"没有搭档\",\r\n        \"yes_pair\": \"已有搭档\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"信息\",\r\n        \"event_info\": \"关于毕业舞会的信息\",\r\n        \"appearance\": \"着装：正式服装\",\r\n        \"date\": \"时间：2025年12月5日 22:30\",\r\n        \"location\": \"地点：Makó 体育馆\",\r\n        \"warning\": \"请准时到达会场！\",\r\n        \"ticket_reservation\": \"订票\",\r\n        \"ticket_reservation_info\": \"关于订票的信息\",\r\n        \"ticket\": \"票\",\r\n        \"price\": \"价格：2500福林/人\",\r\n        \"reservation_date\": \"订票时间：从2025.11.05.开始\",\r\n        \"reservation\": \"预订\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"登录\",\r\n        \"register\": \"注册\",\r\n        \"show_password\": \"显示密码\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"登出\",\r\n        \"close\": \"关闭\"\r\n    },\r\n    \"gallery\": {\r\n      \"gallery_picture\": \"画廊图片\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\": \"配对\",\r\n        \"make_pairs\": \"创建配对\",\r\n        \"pairs\": \"配对\",\r\n        \"first\": \"第一成员\",\r\n        \"second\": \"第二成员\",\r\n        \"no_pairs\": \"它们没有配对\",\r\n        \"all\" : \"共\",\r\n        \"pair_2\": \"生成\",\r\n        \"generated\": \"对\",\r\n        \"manual_pair\": \"设置手动配对\"\r\n   }\r\n}'),
('de', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Information Technologie\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"Heim Seite\",\r\n        \"event\": \"Veranstaltung\",\r\n        \"pair\": \"Paars machen\",\r\n        \"classes\": \"Klassen\",\r\n        \"class\": \"Klasse\",\r\n        \"login\": \"Login\",\r\n        \"logout\": \"Ausloggen\",\r\n        \"gallery\": \"Fleischordnung\",\r\n        \"profile_edit\": \"Profiländerung\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"HSZC Návay Lajos Berufsschule Centrum und College 2025-2026 Schülerball\",\r\n        \"event_description\": \"Der Abschlussball ist ein besonderes Fest im Leben aller Absolventen. Dieses Ereignis markiert nicht nur das Ende des Studiums, sondern auch den Beginn eines neuen Lebensabschnitts. Wir tragen das Band, das uns mit unserer Schule, unseren Lehrern und untereinander verbindet, mit Stolz. Wir danken allen, die unsere Reise unterstützt haben!\",\r\n        \"interest\": \"Sind Sie interessieren für unser Schülerball?\",\r\n        \"click_here\": \"Klicken hier!\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"Klasse\",\r\n        \"more\": \"Mehr\",\r\n        \"gender\": \"Gender\",\r\n        \"man\": \"Mann\",\r\n        \"woman\": \"Frau\",\r\n        \"all\": \"Alle\",\r\n        \"height\": \"Größe\",\r\n        \"block_list\": \"Block Liste\",\r\n        \"close\": \"Schließen\",\r\n        \"no_pair\": \"Ohne Partner*in\",\r\n        \"yes_pair\": \"Mit Partner*in\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"Information\",\r\n        \"event_info\": \"Information über das Schülerball\",\r\n        \"appearance\": \"Kleiderordnung: Formelle\",\r\n        \"date\": \"Datum: 5. 12. 2025. 22:30\",\r\n        \"location\": \"Standort: Makó Sport Zentrum\",\r\n        \"warning\": \"Kommen Sie bitte pünktlich an!\",\r\n        \"ticket_reservation\": \"Karten reservieren\",\r\n        \"ticket_reservation_info\": \"Information über Karten reservieren\",\r\n        \"ticket\": \"Karten\",\r\n        \"price\": \"Preis: 6.41€/Person\",\r\n        \"reservation_date\": \"Reservierung ist möglich bis 05.11.2025.\",\r\n        \"reservation\": \"Reservieren\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"Login\",\r\n        \"register\": \"Registieren\",\r\n        \"show_password\": \"Passwort anzeigen\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"Ausloggen\",\r\n        \"close\": \"Schließen\"\r\n    },\r\n    \"gallery\": {\r\n      \"gallery_picture\": \"Galeriebild\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\":\"Paars machen\",\r\n        \"make_pairs\": \"Machen Paars\",\r\n        \"pairs\": \"Paars\",\r\n        \"first\": \"Erste Person\",\r\n        \"second\": \"Zweite Person\",\r\n        \"no_pairs\": \"sie sind ungepaart\",\r\n        \"all\" : \"insgesamt\",\r\n        \"pair_2\": \"wurden\",\r\n        \"generated\": \"Paare generiert\",\r\n        \"manual_pair\": \"Manuelle Paarung einrichten\"\r\n    }\r\n}'),
('en', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Information Technologies\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"Home page\",\r\n        \"event\": \"Event\",\r\n        \"pair\": \"Pair raffle\",\r\n        \"classes\": \"Classes\",\r\n        \"class\": \"class\",\r\n        \"login\": \"Log in\",\r\n        \"logout\": \"Log out\",\r\n        \"gallery\": \"Gallery\",\r\n        \"profile_edit\": \"Profile Modification\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"HSZC Návay Lajos Vocational Training Center and College 2025-2026 Prom\",\r\n        \"event_description\": \"The prom is a special celebration in the lives of all graduating students. This event not only marks the end of their studies, but the start of a new stage of life. We bear the ribbon that connects us with our school, teachers, and each other proudly.We thank all of you that supported our journey!\",\r\n        \"interest\": \"Are you interested in getting a ticket to our prom?\",\r\n        \"click_here\": \"Click here!\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"class\",\r\n        \"more\": \"More\",\r\n        \"gender\": \"Gender\",\r\n        \"man\": \"Man\",\r\n        \"woman\": \"Woman\",\r\n        \"all\": \"All\",\r\n        \"height\": \"Height\",\r\n        \"block_list\": \"Block list\",\r\n        \"no_pair\": \"Doesn\'t have a partner\",\r\n        \"yes_pair\": \"Has a partner\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"Information\",\r\n        \"event_info\": \"Information regarding the prom\",\r\n        \"appearance\": \"Dress code: Formal\",\r\n        \"date\": \"Date: 12. 5. 2025. 10:30 PM\",\r\n        \"location\": \"Location: Makó Sport center\",\r\n        \"warning\": \"Please arrive at the location punctually!\",\r\n        \"ticket_reservation\": \"Ticket reservation\",\r\n        \"ticket_reservation_info\": \"Information regarding ticket reservation\",\r\n        \"ticket\": \"Ticket\",\r\n        \"price\": \"Price: $7.57/Person\",\r\n        \"reservation_date\": \"Reservation is possible from 11.05.2025.\",\r\n        \"reservation\": \"Reservation\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"Log in\",\r\n        \"register\": \"Register\",\r\n        \"show_password\": \"Show password\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"Log out\",\r\n        \"close\": \"Close\"\r\n    },\r\n   \"gallery\": {\r\n      \"gallery_picture\": \"Gallery Photos\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\":\"Pair raffle\",\r\n        \"make_pairs\": \"Make pairs\",\r\n        \"pairs\": \"Pairs\",\r\n        \"first\": \"First person\",\r\n        \"second\": \"Second person\",\r\n        \"no_pairs\": \"Singles\",\r\n        \"all\" : \"A total of\",\r\n        \"pair_2\": \"pairs\",\r\n        \"generated\": \"were generated\",\r\n        \"manual_pair\": \"Setting up manual pairs\"\r\n    }\r\n}'),
('hu', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Informatika\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"Kezdőlap\",\r\n        \"event\": \"Esemény\",\r\n        \"pair\": \"Párválasztás\",\r\n        \"classes\": \"Osztályok\",\r\n        \"class\": \"osztály\",\r\n        \"login\": \"Bejelentkezés\",\r\n        \"logout\": \"Kijelentkezés\",\r\n        \"gallery\": \"Galéria\",\r\n        \"profile_edit\": \"Profil Módosítás\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"HSZC Návay Lajos Szakképzési Centrum és Kollégium 2025-2026 Szalagavató\",\r\n        \"event_description\": \"A szalagavató ünnepség minden végzős diák életében különleges pillanat. Ez az esemény nemcsak a tanulmányok lezárását jelképezi, hanem egy új életszakasz kezdetét is. Büszkén viseljük a szalagot, amely összeköt minket az iskolával, tanárainkkal és egymással. Köszönjük mindenkinek, aki támogatta utunkat!\",\r\n        \"interest\": \"Esetleg érdekli a mi szalagavatónk és megvenné a jegyét?\",\r\n        \"click_here\": \"Kattints Ide!\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"osztály\",\r\n        \"more\": \"Bővebben\",\r\n        \"gender\": \"Neme\",\r\n        \"man\": \"Férfi\",\r\n        \"woman\": \"Nő\",\r\n        \"all\": \"Összes\",\r\n        \"height\": \"Magassága\",\r\n        \"block_list\": \"Tiltott lista\",\r\n        \"close\": \"Bezárás\",\r\n        \"no_pair\": \"Nincs párja\",\r\n        \"yes_pair\": \"Van párja\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"Információ\",\r\n        \"event_info\": \"Szalagavatóval kapcsolatos Információk\",\r\n        \"appearance\": \"Megjelenés: Elegáns öltözet\",\r\n        \"date\": \"Időpont: 2025 dec. 5, 22:30\",\r\n        \"location\": \"Helyszín: Makó, Sportcsarnok\",\r\n        \"warning\": \"Kérem a helyszínre időbe érkezzenek!\",\r\n        \"ticket_reservation\": \"Jegyfoglalás\",\r\n        \"ticket_reservation_info\": \"Jegyfoglalással kapcsolatos információk\",\r\n        \"ticket\": \"Jegy\",\r\n        \"price\": \"Ár: 2500ft/fő\",\r\n        \"reservation_date\": \"A foglalás 2025.11.05.-től lehetséges\",\r\n        \"reservation\": \"Foglalás\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"Bejelentkezés\",\r\n        \"register\": \"Regisztráció\",\r\n        \"show_password\": \"Jelszó megjelenítése\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"Kijelentkezés\",\r\n        \"close\": \"Bezárás\"\r\n    },\r\n    \"gallery\": {\r\n      \"gallery_picture\": \"Galéria kép\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\": \"Pár összeállítás\",\r\n        \"make_pairs\": \"Párok összeállítása\",\r\n        \"pairs\": \"Párok\",\r\n        \"first\": \"1. Tag\",\r\n        \"second\": \"2. Tag\",\r\n        \"no_pairs\": \"Párnélküliek\",\r\n        \"all\" : \"Összesen\",\r\n        \"pair_2\": \"pár\",\r\n        \"generated\": \"generálódott.\",\r\n        \"manual_pair\": \"Manuális párok beállítása\"\r\n    }\r\n\r\n}'),
('it', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Informatika\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"Home\",\r\n        \"event\": \"Evento\",\r\n        \"pair\": \"Abbinamento\",\r\n        \"classes\": \"Classi\",\r\n        \"class\": \"Classe\",\r\n        \"login\": \"Accedi\",\r\n        \"logout\": \"Disconnetti\",\r\n        \"gallery\": \"Galleria\",\r\n        \"profile_edit\": \"Modifica del profilo\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"Centro di Formazione Professionale e Collegio HSZC Návay Lajos 2025-2026 Ballo delle Matricole\",\r\n        \"event_description\": \"Il ballo delle matricole è un momento speciale nella vita di ogni diplomando. Questo evento non solo simboleggia la conclusione degli studi, ma anche l\'inizio di una nuova fase della vita. Indossiamo con orgoglio il nastro che ci lega alla scuola, ai nostri insegnanti e gli uni agli altri. Grazie a tutti coloro che hanno sostenuto il nostro cammino!\",\r\n        \"interest\": \"Sei interessato al nostro ballo delle matricole e vuoi acquistare il biglietto?\",\r\n        \"click_here\": \"Clicca qui!\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"Classe\",\r\n        \"more\": \"Di più\",\r\n        \"gender\": \"Genere\",\r\n        \"man\": \"Uomo\",\r\n        \"woman\": \"Donna\",\r\n        \"all\": \"Tutti\",\r\n        \"height\": \"Altezza\",\r\n        \"block_list\": \"Lista bloccati\",\r\n        \"close\": \"Chiudi\",\r\n        \"no_pair\": \"Nessun partner\",\r\n        \"yes_pair\": \"Ha un partner\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"Informazioni\",\r\n        \"event_info\": \"Informazioni relative al ballo delle matricole\",\r\n        \"appearance\": \"Abbigliamento: Elegante\",\r\n        \"date\": \"Data: 5 dic. 2025, 22:30\",\r\n        \"location\": \"Luogo: Makó, Palestra\",\r\n        \"warning\": \"Si prega di arrivare puntuali!\",\r\n        \"ticket_reservation\": \"Prenotazione biglietti\",\r\n        \"ticket_reservation_info\": \"Informazioni sulla prenotazione dei biglietti\",\r\n        \"ticket\": \"Biglietto\",\r\n        \"price\": \"Prezzo: 2500 HUF/persona\",\r\n        \"reservation_date\": \"La prenotazione è possibile dal 05/11/2025\",\r\n        \"reservation\": \"Prenota\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"Accedi\",\r\n        \"register\": \"Registrati\",\r\n        \"show_password\": \"Mostra password\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"Disconnetti\",\r\n        \"close\": \"Chiudi\"\r\n    },\r\n    \"gallery\": {\r\n      \"gallery_picture\": \"immagine della galleria\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\": \"Abbinamento\",\r\n        \"make_pairs\": \"Crea coppie\",\r\n        \"pairs\": \"Coppie\",\r\n        \"first\": \"1° Membro\",\r\n        \"second\": \"2° Membro\",\r\n        \"no_pairs\": \"Single\",\r\n        \"all\" : \"sono state\",\r\n        \"pair_2\": \"generate in totale\",\r\n        \"generated\": \"coppie\",\r\n        \"manual_pair\": \"Impostazione di coppie manuali\"\r\n    }\r\n}\r\n'),
('ru', '{\r\n    \"footer\": {\r\n        \"copyright\": \"2021-2026 KERI Informatika\"\r\n    },\r\n    \"header\": {\r\n        \"home\": \"Главная\",\r\n        \"event\": \"Событие\",\r\n        \"pair\": \"Пары\",\r\n        \"classes\": \"Классы\",\r\n        \"class\": \"Класс\",\r\n        \"login\": \"Войти\",\r\n        \"logout\": \"Выйти\",\r\n        \"gallery\": \"гордостью\",\r\n        \"profile_edit\":\"Модификация профиля\"\r\n    },\r\n    \"home\": {\r\n        \"event_name\": \"HSZC Návay Lajos Центр профессионального обучения и общежитие 2025-2026 Выпускной бал\",\r\n        \"event_description\": \"Выпускной бал — это особенный момент в жизни каждого выпускника. Это событие не только символизирует завершение учёбы, но и начало нового этапа жизни. Мы с гордостью носим ленточку, которая связывает нас со школой, учителями и друг с другом. Спасибо всем, кто поддерживал нас на этом пути!\",\r\n        \"interest\": \"Вас интересует наш выпускной бал и хотите купить билет?\",\r\n        \"click_here\": \"Нажмите здесь!\"\r\n    },\r\n    \"classes\": {\r\n        \"class\": \"Класс\",\r\n        \"more\": \"Подробнее\",\r\n        \"gender\": \"Пол\",\r\n        \"man\": \"Мужчина\",\r\n        \"woman\": \"Женщина\",\r\n        \"all\": \"Все\",\r\n        \"height\": \"Рост\",\r\n        \"block_list\": \"Чёрный список\",\r\n        \"close\": \"Закрыть\",\r\n        \"no_pair\": \"Нет пары\",\r\n        \"yes_pair\": \"Есть пара\"\r\n    },\r\n    \"event\": {\r\n        \"info\": \"Информация\",\r\n        \"event_info\": \"Информация о выпускном бале\",\r\n        \"appearance\": \"Дресс-код: Элегантный наряд\",\r\n        \"date\": \"Дата: 5 декабря 2025 г., 22:30\",\r\n        \"location\": \"Место: Мако, Спортзал\",\r\n        \"warning\": \"Пожалуйста, приходите вовремя!\",\r\n        \"ticket_reservation\": \"Бронирование билетов\",\r\n        \"ticket_reservation_info\": \"Информация о бронировании билетов\",\r\n        \"ticket\": \"Билет\",\r\n        \"price\": \"Цена: 2500 форинтов/чел.\",\r\n        \"reservation_date\": \"Бронирование возможно с 05.11.2025\",\r\n        \"reservation\": \"Забронировать\"\r\n    },\r\n    \"login\": {\r\n        \"login\": \"Войти\",\r\n        \"register\": \"Регистрация\",\r\n        \"show_password\": \"Показать пароль\"\r\n    },\r\n    \"modal\": {\r\n        \"logout\": \"Выйти\",\r\n        \"close\": \"Закрыть\"\r\n    },\r\n    \"gallery\": {\r\n      \"gallery_picture\": \"изображение галереи\"\r\n    },\r\n    \"reserve\": {\r\n        \"pair\": \"Пары\",\r\n        \"make_pairs\": \"Составить пары\",\r\n        \"pairs\": \"Пары\",\r\n        \"first\": \"1-й участник\",\r\n        \"second\": \"2-й участник\",\r\n        \"no_pairs\": \"Они непарные.\",\r\n        \"all\" : \"Всего было \",\r\n        \"pair_2\": \"создано\",\r\n        \"generated\": \"пар.\",\r\n        \"manual_pair\": \"Настройка ручных пар\"\r\n    }\r\n}\r\n');

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
(3, 50),
(4, 40),
(5, 60),
(6, 52),
(7, 57),
(8, 55),
(9, 51),
(10, 33),
(11, 31),
(12, 32),
(13, 43),
(14, 66),
(15, 36),
(16, 71),
(17, 61),
(18, 64),
(19, 56),
(20, 53),
(21, 49),
(22, 54),
(23, 70),
(24, 72),
(25, 39),
(26, 62),
(28, 27),
(30, 34),
(37, 47),
(38, 69),
(42, 48),
(45, 44),
(58, 29),
(59, 46),
(63, 35),
(65, 41),
(68, 67);

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
(1, 'Badó-Gulácsi Dániel', 'M', 0, 'BadoGulacsiDani.jpg', '13C', 175),
(2, 'Berta Barnabás', 'M', 0, 'BertaBarnabas.jpg', '13C', 170),
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
(59, 'Illés Imre Dániel', 'M', 1, 'IllesImre.jpg', '13B', 172),
(60, 'Joó Nóra', 'F', 1, 'JooNora.jpg', '13B', 163),
(61, 'Loós Jázmin', 'F', 1, 'LoosJazmin.jpg', '13B', 168),
(62, 'Mak Szilvia', 'F', 1, 'MakSzilvia.jpg', '13B', 162),
(63, 'Mezei Dániel', 'M', 1, 'MezeiDaniel.jpg', '13B', 185),
(64, 'Pásztor Tímea', 'F', 1, 'PasztorTimea.jpg', '13B', 164),
(65, 'Pepó Gábor', 'M', 1, 'PepoGabor.jpg', '13B', 175),
(66, 'Szécsi Dóra', 'F', 1, 'SzecsiDora.jpg', '13B', 172),
(67, 'Sztojkó Lara', 'F', 1, 'SztojkoLara.jpg', '13B', 168),
(68, 'Varadik Armand', 'M', 1, 'VaradikArmand.png', '13B', 168),
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
  `email` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `last_name`, `first_name`, `phone`, `description`, `name`) VALUES
(1, 'badogulacsi.daniel-2021@keri.mako.hu', 'badogulacsidaniel13c', 'Badó-Gulácsi', 'Dániel', '06301234567', '', 'Badó-Gulácsi Dániel'),
(2, 'berta.barnabas-2021@keri.mako.hu', 'bertabarnabas13c', 'Berta', 'Barnabás', '06301234567', '', 'Berta Barnabás'),
(3, 'bokor.richard-2021@keri.mako.hu', 'bokorrichard13c', 'Bokor', 'Richárd', '06301234567', '', 'Bokor Richárd'),
(4, 'dani.benedek-2021@keri.mako.hu', 'danibenedek13c', 'Dani', 'Benedek', '06301234567', '', 'Dani Benedek'),
(5, 'dome.zoltan-2021@keri.mako.hu', 'domezoltan13c', 'Döme', 'Zoltán', '06301234567', '', 'Döme Zoltán'),
(6, 'esser.balazs-2021@keri.mako.hu', 'esserbalazsdavid13c', 'Esser', 'Balázs Dávid', '06301234567', '', 'Esser Balázs Dávid'),
(7, 'fodor.adrian-2021@keri.mako.hu', 'fodoradrianlaszlo13c', 'Fodor', 'Adrián László', '06301234567', '', 'Fodor Adrián László'),
(8, 'guvat.bence-2021@keri.mako.hu', 'guvatbencejozsef13c', 'Guvat', 'Bence József', '06301234567', '', 'Guvat Bence József'),
(9, 'herczeg.mate-2021@keri.mako.hu', 'herczegmatejanos13c', 'Herczeg', 'Máté János', '06301234567', '', 'Herczeg Máté János'),
(10, 'kardos.zoltan-2021@keri.mako.hu', 'kardoszoltan13c', 'Kardos', 'Zoltán', '06301234567', '', 'Kardos Zoltán'),
(11, 'kis.david-2021@keri.mako.hu', 'kisdavidcsaba13c', 'Kis', 'David Csaba', '06301234567', '', 'Kis David Csaba'),
(12, 'kis.marcell-2021@keri.mako.hu', 'kismarcellzsombor13c', 'Kis', 'Marcell Zsombor', '06301234567', '', 'Kis Marcell Zsombor'),
(13, 'knoch.henrik-2021@keri.mako.hu', 'knochhenrik13c', 'Knoch', 'Henrik', '06301234567', '', 'Knoch Henrik'),
(14, 'krivan.balazs-2021@keri.mako.hu', 'krivanbalazs13c', 'Kriván', 'Balázs', '06301234567', '', 'Kriván Balázs'),
(15, 'kulcsar.tamas-2021@keri.mako.hu', 'kulcsartamasamon13c', 'Kulcsár', 'Tamás Ámon', '06301234567', '', 'Kulcsár Tamás Ámon'),
(16, 'miklos.martin-2021@keri.mako.hu', 'miklosmartin13c', 'Miklós', 'Martin', '06301234567', '', 'Miklós Martin'),
(17, 'olah.zsigmond-2021@keri.mako.hu', 'olahzsigmondsamuel13', 'Oláh', 'Zsigmond Sámuel', '06301234567', '', 'Oláh Zsigmond Sámuel'),
(18, 'repa.norbert-2021@keri.mako.hu', 'repanorbert13c', 'Répa', 'Norbert', '06301234567', '', 'Répa Norbert'),
(19, 'sotet.armin-2021@keri.mako.hu', 'sotetarmin13c', 'Sötét', 'Ármin', '06301234567', '', 'Sötét Ármin'),
(20, 'suba.benjamin-2021@keri.mako.hu', 'subabenjamin13c', 'Suba', 'Benjamin', '06301234567', '', 'Suba Benjamin'),
(21, 'suhajda.adam-2021@keri.mako.hu', 'suhajdaadamdominik13', 'Suhajda', 'Ádám Dominik', '06301234567', '', 'Suhajda Ádám Dominik'),
(22, 'szabo.bence-2021@keri.mako.hu', 'szabobence13c', 'Szabó', 'Bence', '06301234567', '', 'Szabó Bence'),
(23, 'szalontai.laszlo-2021@keri.mako.hu', 'szalontailaszlo13c', 'Szalontai', 'László', '06301234567', '', 'Szalontai László'),
(24, 'szanto.peter-2021@keri.mako.hu', 'szantopeter13c', 'Szántó', 'Péter', '06301234567', '', 'Szántó Péter'),
(25, 'tokai.adam-2021@keri.mako.hu', 'tokaiadam13c', 'Tokai', 'Ádám', '06301234567', '', 'Tokai Ádám'),
(26, 'toth.laszlo-2021@keri.mako.hu', 'tothlaszlogabor13c', 'Tóth', 'László Gábor', '06301234567', '', 'Tóth László Gábor'),
(27, 'andor.rebeka-2021@keri.mako.hu', 'andorrebeka13a', 'Andor', 'Rebeka', '06301234567', '', 'Andor Rebeka'),
(28, 'baroczi.gergo-2021@keri.mako.hu', 'baroczigergo13a', 'Baróczi', 'Gergő', '06301234567', '', 'Baróczi Gergő'),
(29, 'berta.sztella-2021@keri.mako.hu', 'bertasztella13a', 'Berta', 'Sztella', '06301234567', '', 'Berta Sztella'),
(30, 'boros.balazs-2021@keri.mako.hu', 'borosbalazs13a', 'Boros', 'Balázs', '06301234567', '', 'Boros Balázs'),
(31, 'derdak.csenge-2021@keri.mako.hu', 'derdakcsenge13a', 'Derdák', 'Csenge', '06301234567', '', 'Derdák Csenge'),
(32, 'erdelian.iringo-2021@keri.mako.hu', 'erdelianiringo13a', 'Erdélián', 'Iringó', '06301234567', '', 'Erdélián Iringó'),
(33, 'farago.zorka-2021@keri.mako.hu', 'faragozorka13a', 'Faragó', 'Zorka', '06301234567', '', 'Faragó Zorka'),
(34, 'gregor.lilla-2021@keri.mako.hu', 'gregorlilla13a', 'Gregor', 'Lilla', '06301234567', '', 'Gregor Lilla'),
(35, 'horvath.zoe-2021@keri.mako.hu', 'horvathzoe13a', 'Horváth', 'Zoé', '06301234567', '', 'Horváth Zoé'),
(36, 'janko.georgina-2021@keri.mako.hu', 'jankogeorgina13a', 'Jankó', 'Georgina', '06301234567', '', 'Jankó Georgina'),
(37, 'kerekes.akos-2021@keri.mako.hu', 'kerekesakos13a', 'Kerekes', 'Ákos', '06301234567', '', 'Kerekes Ákos'),
(38, 'kisjakab.peter-2021@keri.mako.hu', 'kisjakabpeter13a', 'Kis-Jakab', 'Péter', '06301234567', '', 'Kis-Jakab Péter'),
(39, 'kocka.kira-2021@keri.mako.hu', 'kockakira13a', 'Kocka', 'Kira', '06301234567', '', 'Kocka Kira'),
(40, 'kovacs.dorka-2021@keri.mako.hu', 'kovacsdorka13b', 'Kovács', 'Dorka', '06301234567', '', 'Kovács Dorka'),
(41, 'kovacs.lara-2021@keri.mako.hu', 'kovacslara13a', 'Kovács', 'Lara', '06301234567', '', 'Kovács Lara'),
(42, 'lenhardt.akos-2021@keri.mako.hu', 'lenhardtakos13a', 'Lenhardt', 'Ákos', '06301234567', '', 'Lenhardt Ákos'),
(43, 'magori.adel-2021@keri.mako.hu', 'magoriadel13a', 'Mágori', 'Adél', '06301234567', '', 'Mágori Adél'),
(44, 'meszaros.anna-2021@keri.mako.hu', 'meszarosanna13a', 'Mészáros', 'Anna', '06301234567', '', 'Mészáros Anna'),
(45, 'nagy.kristof-2021@keri.mako.hu', 'nagykristof13a', 'Nagy', 'Kristóf', '06301234567', '', 'Nagy Kristóf'),
(46, 'savanya.reka-2021@keri.mako.hu', 'savanyarekagabriella', 'Savanya', 'Réka Gabriella', '06301234567', '', 'Savanya Réka Gabriella'),
(47, 'schneider.evelyn-2021@keri.mako.hu', 'schneiderevelyn13a', 'Schneider', 'Evelyn', '06301234567', '', 'Schneider Evelyn'),
(48, 'szabo.jazmin-2021@keri.mako.hu', 'szabojazmin13a', 'Szabó', 'Jázmin', '06301234567', '', 'Szabó Jázmin'),
(49, 'szabo.kata-2021@keri.mako.hu', 'szabokata13a', 'Szabó', 'Kata', '06301234567', '', 'Szabó Kata'),
(50, 'velek.panna-2021@keri.mako.hu', 'velekpanna13a', 'Velek', 'Panna', '06301234567', '', 'Velek Panna'),
(51, 'vetro.barbara-2021@keri.mako.hu', 'vetrobarbara13a', 'Vetró', 'Barbara', '06301234567', '', 'Vetró Barbara'),
(52, 'vincze.kinga-2021@keri.mako.hu', 'vinczekingajazmin13a', 'Vincze', 'Kinga Jázmin', '06301234567', '', 'Vincze Kinga Jázmin'),
(53, 'zatyko.lili-2021@keri.mako.hu', 'zatykolili13a', 'Zatykó', 'Lili', '06301234567', '', 'Zatykó Lili'),
(54, 'balint.cintia-2021@keri.mako.hu', 'balintcintia13b', 'Bálint', 'Cintia', '06301234567', '', 'Bálint Cintia'),
(55, 'czekman.lili-2021@keri.mako.hu', 'czekmanlili13b', 'Czékmán', 'Lili', '06301234567', '', 'Czékmán Lili'),
(56, 'csige.evelin-2021@keri.mako.hu', 'csigeevelin13b', 'Csige', 'Evelin', '06301234567', '', 'Csige Evelin'),
(57, 'ferencsik.vivien-2021@keri.mako.hu', 'ferencsikvivien13b', 'Ferencsik', 'Vivien', '06301234567', '', 'Ferencsik Vivien'),
(58, 'gyenge.ivan-2021@keri.mako.hu', 'gyengeivan13b', 'Gyenge', 'Iván', '06301234567', '', 'Gyenge Iván'),
(59, 'illes.imre-2021@keri.mako.hu', 'illesimredaniel13b', 'Illés', 'Imre Dániel', '06301234567', '', 'Illés Imre Dániel'),
(60, 'joo.nora-2021@keri.mako.hu', 'joonora13b', 'Joó', 'Nóra', '06301234567', '', 'Joó Nóra'),
(61, 'loos.jazmin-2021@keri.mako.hu', 'loosjazmin13b', 'Loós', 'Jázmin', '06301234567', '', 'Loós Jázmin'),
(62, 'mak.szilvia-2021@keri.mako.hu', 'makszilvia13b', 'Mak', 'Szilvia', '06301234567', '', 'Mak Szilvia'),
(63, 'mezei.daniel-2021@keri.mako.hu', 'mezeidaniel13b', 'Mezei', 'Dániel', '06301234567', '', 'Mezei Dániel'),
(64, 'pasztor.timea-2021@keri.mako.hu', 'pasztortimea13b', 'Pásztor', 'Tímea', '06301234567', '', 'Pásztor Tímea'),
(65, 'pepo.gabor-2021@keri.mako.hu', 'pepogabor13b', 'Pepó', 'Gábor', '06301234567', '', 'Pepó Gábor'),
(66, 'szecsi.dora-2021@keri.mako.hu', 'szecsidora13b', 'Szécsi', 'Dóra', '06301234567', '', 'Szécsi Dóra'),
(67, 'sztojko.lara-2021@keri.mako.hu', 'sztojkolara13b', 'Sztojkó', 'Lara', '06301234567', '', 'Sztojkó Lara'),
(68, 'varadik.armand-2021@keri.mako.hu', 'varadikarmand13b', 'Varadik', 'Armand', '06301234567', '', 'Varadik Armand'),
(69, 'dombi.ivett-2021@keri.mako.hu', 'dombiivett13a', 'Dombi', 'Ivett', '06301234567', '', 'Dombi Ivett'),
(70, 'ambrozy.vanda-2021@keri.mako.hu', 'ambrozyvanda13a', 'Ambrózy', 'Vanda', '06301234567', '', 'Ambrózy Vanda'),
(999, 'admin@gmail.com', 'admin123', 'admin', 'admin', '06301234567', '', 'admin ');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `blocklist`
--
ALTER TABLE `blocklist`
  ADD UNIQUE KEY `user_id1` (`user_id`,`blocked_user_id`);

--
-- A tábla indexei `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language`);

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
