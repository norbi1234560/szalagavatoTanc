<?php

require_once("../../common/php/environment.php");

$assets = "./assets/pics/homeImages";

$files = scandir($assets);

$homeImages = array();

foreach ($files as $image) {

  if($image != "." && $image != "..")
  {
    $homeImages[] = $image;
  }
}

Util::SetResponse($homeImages);