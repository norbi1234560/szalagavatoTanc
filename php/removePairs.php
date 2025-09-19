<?php

require_once("../../common/php/environment.php");

$db = new Database();

$db->execute("START TRANSACTION");
$db->execute("DELETE FROM `pairs`");
$db->execute("UPDATE `students` SET `taken` = 0");
$db->execute("COMMIT");

$db = null;
Util::setResponse();