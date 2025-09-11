<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "DELETE FROM `pairs`";
$query = "UPDATE `students` SET `taken` = 0";

$db = null;

Util::setResponse();