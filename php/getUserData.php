<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_int($args["id"]))
    Util::setError("Az id-nek intnek kell lennie!");

$db = new Database();

$query = 'SELECT students.image, students.class 
          FROM students 
          INNER JOIN users 
          ON students.id = users.id 
          WHERE users.id = :id';

$result = $db -> execute($query,$args);

if (!$result) 
    Util::setError('A meglévő felhasználó nem tagja a KERI-nek');

Util::setResponse($result[0]);
