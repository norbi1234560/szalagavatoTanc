<?php
// Betöltjük a szerver fájlt
require_once 'connect.php';

// Átállítom az ada típust json-ra
header('Content-Type: application/json; charset=UTF-8');

// Meggyőződöm hogy sikerült a kapcsolat
$conn = connectToDatabase();

// SQL query az adatok fetch eléséhez
$sql = "SELECT * FROM `students` ORDER BY `students`.`id` ASC";
$result = $conn->query($sql);

// Felkészítjük a json - fájlt a teszthez
if ($result && $result->num_rows > 0) {
    $records = [];
    while ($row = $result->fetch_assoc()) {
        $records[] = $row;
    }

    // Visszaküldjük a választ megfelelő formában
    echo json_encode(["records" => $records]);
} else {
    // No data found or query failed
    echo json_encode(["records" => []]);
}

// Bezárjuk a kapcsolatot
$conn->close();

?>
