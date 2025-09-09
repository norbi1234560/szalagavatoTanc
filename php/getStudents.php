<?php

require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query ="SELECT `id`, `name`, `gender`, 
                `taken`, `image`, `class`
         FROM `students`
         WHERE `class` = :class ";

$result =$db->execute($query,$args);

$db = null;

Util::setResponse($result);