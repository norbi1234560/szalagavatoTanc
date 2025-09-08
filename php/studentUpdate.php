<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query  = $db->preparateUpdate('users', $args, 'id');
$query .= " WHERE `id` = :id;";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);