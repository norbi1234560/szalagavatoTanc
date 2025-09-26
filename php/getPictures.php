<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$valami =$args["id"];

$query = "SELECT `image` FROM `students` WHERE `id` = $valami";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);
