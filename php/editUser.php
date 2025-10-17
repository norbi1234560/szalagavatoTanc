<?php

require_once("../../common/php/environment.php");

$db = new Database();

$adat = Util::getArgs();

$querry = "UPDATE `users` 
           SET`email`=:email,`phone`=:phone,
           `description`=:description
           WHERE `users`.`id`=:id";

$datas =$db->execute($querry,$adat);

$db = null;

if($datas["affectedRows"] == 0)
{
  Util::setError("Sikertelen adatfelvétel");
}
else{
  Util::setResponse($datas);
}