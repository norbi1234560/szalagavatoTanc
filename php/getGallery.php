<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `id`, `class`, `image`
          FROM `gallery`";

$result =$db->execute($query);

$db = null;

Util::setResponse($result);