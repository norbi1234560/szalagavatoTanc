<?php

require_once("../../common/php/environment.php");

$assets = "./assets/pics/eventImg";

$files = scandir($assets);

$eventImages = array();

foreach ($files as $image) {

  if($image != "." && $image != "..")
  {
    $eventImages[] = $image;
  }
}

Util::SetResponse($eventImages);