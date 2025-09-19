<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `language`, `data` 
          FROM `language`";

$result = $db->execute($query);

$db = null;
    
Util::setResponse($result);