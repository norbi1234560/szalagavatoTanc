<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

if ($args["user_id"] === $args["blocked_user_id"]) {
    Util::setError("A kettő id nem lehet egyenlő értékű!");
}

$db = new Database();

$query = $db->preparateInsert('blocklist',$args);

$result = $db->execute($query, array_values($args));

$db = null;

if(!$result["affectedRows"])
{
    Util::setError("Sikertelen adatfelvitel");
}

$result = "Sikeres adatfelvitel!";

Util::setResponse($result);