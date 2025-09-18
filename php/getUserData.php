<?php
require_once("../../common/php/environment.php");

$db = new Database();

$args = Util::getArgs();

$query = 'SELECT students.image, students.class 
          FROM students 
          INNER JOIN users 
          ON students.id = users.id 
          WHERE users.id = :id';

$result = $db -> execute($query,$args);

if (count($result) == 0) 
    Util::setResponse('A meglévő felhasználó nem tagja a KERI-nek');

Util::setResponse($result);
