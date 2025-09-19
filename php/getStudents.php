<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_string($args["class"]))
    Util::setError("A classnak stringnek kell lennie!");

$db = new Database();

$query ="SELECT `id`, `name`, `gender`, 
                `taken`, `image`, `class`,`height`
         FROM `students`
         WHERE `class` = :class ";

$result =$db->execute($query,$args);

$db = null;

Util::setResponse($result);