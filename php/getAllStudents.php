<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `id`, `name`, `gender`, 
                `taken`, `image`, `class`
         FROM `students`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);