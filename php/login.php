<?php
require_once("../../common/php/environment.php");

// if ($_COOKIE["email"]) Util::setResponse();

$args = Util::getArgs();

if (!is_string($args["email"]) || mb_strlen($args["email"], "utf8") > 150 || !str_contains($args["email"], '@'))
    Util::setError("Az email nem helyes!");
if (!is_string($args["password"]) || mb_strlen($args["password"], "utf8") > 30)
    Util::setError("A jelszó nem helyes!");

$db = new Database();

$query = "SELECT `id`, `name`, `first_name`, `last_name`, `password`,`user_type`
          FROM `users` 
          WHERE `email` = :email 
          LIMIT 1";
$result = $db->execute($query, $args["email"]);

$db = null;

if ($result == null)
    Util::setError("Nincs ilyen email cím regisztrálva!");

if ($result[0]["password"] != $args["password"])
    Util::setError("A jelszó nem helyes!");

// const DAYS_30 = 30 * 24 * 60 * 60;

// setcookie("email", $args["email"], [
//     "expires" => time() + DAYS_30,
//     "httponly" => true
// ]);

// setcookie("password", $args["password"], [
//     "expires" => time() + DAYS_30,
//     "httponly" => true
// ]);

Util::setResponse([
    "id" => $result[0]["id"],
    "user_type" =>$result[0]["user_type"],
    "first_name" => $result[0]["first_name"],
    "last_name" => $result[0]["last_name"],
    "name" => $result[0]["name"],
]);