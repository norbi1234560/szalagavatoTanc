<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

foreach ($args as $x) {
    $query = "INSERT INTO `pairs` VALUES (?, ?)";
    $result = $db->execute($query, $x);

    $query = "UPDATE `students` SET `taken` = 1 WHERE `id` in (?, ?)";
    $result = $db->execute($query, $x);
}

$db = null;

Util::setResponse();