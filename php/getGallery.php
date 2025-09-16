<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `id`, `class`, `image`
          FROM `gallery`
          WHERE `class` = :class";

$result =$db->execute($query, $args);

$db = null;

Util::setResponse($result);