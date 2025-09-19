<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT DISTINCT `class` FROM `students`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);