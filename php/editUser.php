<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

session_start();

if (!isset($_SESSION["user_id"])) {
    Util::setError("Nincs bejelentkezve!");
}

$userId = $_SESSION["user_id"];

if (!is_string($args["name"]) || mb_strlen($args["name"], "utf8") > 150) 
    Util::setError("A felhasználónév nem helyes!");

if (!is_string($args["email"]) || mb_strlen($args["email"], "utf8") > 150 || !str_contains($args["email"], '@'))
    Util::setError("Az email nem helyes!");

if (!is_string($args["password"]) || mb_strlen($args["password"], "utf8") > 20)
    Util::setError("A jelszó nem helyes!");

$db = new Database();

$query = "SELECT COUNT(*) > 0 as `email_exists` FROM `users` WHERE `email` = :email AND `id` != :id LIMIT 1";
$result = $db->execute($query, [
    ":email" => $args["email"],
    ":id" => $userId
]);

if ($result[0]["email_exists"] == 1)
    Util::setError("Az email már használt!");

$query = "UPDATE `users` SET `name` = :name, `email` = :email, `password` = :password WHERE `id` = :id";
$params = [
    ":name" => $args["name"],
    ":email" => $args["email"],
    ":password" => $args["password"],
    ":id" => $userId
];

$result = $db->execute($query, $params);

$db = null;

if (!$result["affectedRows"]) {
    Util::setError("Nem történt módosítás.");
}

Util::setResponse([
    "id" => $userId,
    "name" => $args["name"]
]);
