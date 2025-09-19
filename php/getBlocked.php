<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_int($args["user_id"]))
    Util::setError("A user_id-nek intnek kell lennie!");

$db = new Database();

$query = "SELECT `blocked_user_id` 
          FROM `blocklist`
          WHERE `user_id` = :user_id";

$result =$db->execute($query,  $args["user_id"]);

$db = null;

Util::setResponse($result);