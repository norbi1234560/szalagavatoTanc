<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_string($args["name"]) || mb_strlen($args["name"], "utf8") > 150) 
    Util::setError("A felhasználónév nem helyes!");
if (!is_string($args["email"]) || mb_strlen($args["email"], "utf8") > 150 || !str_contains($args["email"], '@'))
    Util::setError("Az email nem helyes!");
if (!is_string($args["password"]) || mb_strlen($args["password"], "utf8") > 20)
    Util::setError("A jelszó nem helyes!");

$db = new Database();

$query = "SELECT COUNT(*) > 0 as `email_exists` FROM `users` WHERE `email` = :email LIMIT 1";
$result = $db->execute($query, $args["email"]);

if ($result[0]["email_exists"] == 1)
    Util::setError("Az email már használt!");

$query = $db->preparateInsert("users",$args);
$result = $db->execute($query, array_values($args));

$db = null;

if(!$result["affectedRows"])
{
    Util::setError("Sikertelen adatfelvitel");
}

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
    "id" => $result["firstInsertId"],
    "name" => $args["name"]
]);
