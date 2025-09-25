<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = 'SELECT * FROM `users` WHERE `id`= :id';

$result = $db -> execute($query,$args);

Util::setResponse($result[0]);
