<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

if ($args == null) {
  $query = "SELECT `id`, `class`, `image`
            FROM `gallery`";

  $result = $db->execute($query);
} else {
  $query = "SELECT `id`, `class`, `image`
            FROM `gallery`
            WHERE `class` = :class";

  $result = $db->execute($query, $args);
}

$db = null;

Util::setResponse($result);