<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

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