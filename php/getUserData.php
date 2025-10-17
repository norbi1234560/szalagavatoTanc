<?php
require_once("../../common/php/environment.php");

$args = Util::getArgs();

if (!is_int($args["id"]))
    Util::setError("Az id-nek intnek kell lennie!");

$db = new Database();

$query = "SELECT `students`.`image`,`students`.`class`,`users`.`email`,
                 `users`.`first_name`,`users`.`last_name`,`users`.`phone`,
                 `users`.`description`,`users`.`id`
          FROM `users`
          LEFT JOIN `students`
          ON `students`.`id` = `users`.`student_id`
          WHERE `users`.`id` = :id";

$result = $db -> execute($query,$args);

if (!$result) 
    Util::setError('A meglévő felhasználó nem tagja a KERI-nek');

Util::setResponse($result[0]);
