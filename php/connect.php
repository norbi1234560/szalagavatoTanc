<?php

// Adatbázis paraméterek
$host = 'localhost';
$dbuser = 'root';
$password = '';
$dbname = 'szalagavato';
$charset = 'utf8mb4';

// Egy function ami lekéri az adatbázist
function connectToDatabase() {
    global $host, $dbuser, $password, $dbname, $charset;

    // létrehozunk egy mysql kapcsolatot
    $conn = new mysqli($host, $dbuser, $password, $dbname);

    // Ellenőrízzük a kapcsolatot
    if ($conn->connect_error) {
        die("Kapcsolati hiba: " . $conn->connect_error);
    }

    // Beállítjuk a kódolást a balhé elkerülése miatt
    if (!$conn->set_charset($charset)) {
        die("Hiba a karakter beállítása során. $charset: " . $conn->error);
    }

    return $conn;
}

?>
