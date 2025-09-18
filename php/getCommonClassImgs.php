<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `id`, `class`, `image`
          FROM `gallery`
          WHERE `class` = '13A'
          OR `class` = '13B' 
          OR `class` = '13C'";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);