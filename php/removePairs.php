<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "DELETE FROM `pairs`";
$result = $db->execute($query);
$query = "UPDATE `students` SET `taken` = 0";
$result = $db->execute($query);

$db = null;
Util::setResponse();