<?php
require_once("../../common/php/environment.php");

if ($_COOKIE["email"]) Util::setResponse(false);

$args = Util::getArgs();

if (!is_string($args["email"]) || !str_contains($args["email"], '@'))
    Util::setError("Az email cím nem valós");

$db = new Database();

$query = "SELECT `id`, `name`, `email` FROM `users` WHERE `email` = :email LIMIT 1";
$result = $db->execute($query, $args["email"]);

if (count($result) === 0) {
    Util::setResponse(false);
}

$db = null;

Util::setResponse($result[0]);