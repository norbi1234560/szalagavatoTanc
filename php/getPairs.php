<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query ="SELECT `user_id1`, `user_id2` 
         FROM `pairs`";

$result =$db->execute($query);

$db = null;

Util::setResponse($result);