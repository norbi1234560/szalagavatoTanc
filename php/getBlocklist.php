<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query ="SELECT `user_id`, `blocked_user_id` 
         FROM `blocklist`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);