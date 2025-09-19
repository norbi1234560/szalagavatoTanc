<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_array($args))
    Util::setError("Az argumentum nem lista!");

$db = new Database();

$db->execute("START TRANSACTION");
foreach ($args as $x) {
    $query = "INSERT INTO `pairs` VALUES (?, ?)";
    $result = $db->execute($query, $x);

    $query = "UPDATE `students` SET `taken` = 1 WHERE `id` in (?, ?)";
    $result = $db->execute($query, $x);
}
$db->execute("COMMIT");


$db = null;

Util::setResponse();