<?php
require_once("../../common/php/environment.php");

if ($_COOKIE["email"]) Util::setResponse();

$args = Util::getArgs();

if (!is_string($args["email"]) || mb_strlen($args["email"], "utf8") > 150 || !str_contains($args["email"], '@'))
    Util::setError("Az email nem helyes!");
if (!is_string($args["password"]) || mb_strlen($args["password"], "utf8") > 20)
    Util::setError("A jelszó nem helyes!");

$db = new Database();

$query = "SELECT `id`, `name`, `password` FROM `users` WHERE `email` = :email LIMIT 1";
$result = $db->execute($query, $args["email"]);

$db = null;

if ($result[0]["password"] != $args["password"])
    Util::setError("A jelszó nem helyes!");

const DAYS_30 = 30 * 24 * 60 * 60;

setcookie("email", $args["email"], [
    "expires" => time() + DAYS_30,
    "httponly" => true
]);

setcookie("password", $args["password"], [
    "expires" => time() + DAYS_30,
    "httponly" => true
]);

Util::setResponse([
    "id" => $result[0]["id"],
    "name" => $result[0]["name"],
]);