<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_int($args["user_id"]) || !is_int($args["blocked_user_id"]))
    Util::setError("A kettő id-nek intnek kell lennie!");
if ($args["user_id"] === $args["blocked_user_id"]) 
    Util::setError("A kettő id nem lehet egyenlő értékű!");

$db = new Database();

$query = "DELETE FROM `blocklist`
          WHERE `user_id`         = :user_id
            AND `blocked_user_id` = :blocked_user_id";

$result = $db->execute($query, array_values($args));

$db = null;

if(!$result["affectedRows"])
{
    Util::setError("Sikertelen adat törlés");
}

Util::setResponse();