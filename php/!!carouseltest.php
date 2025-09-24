<?php

require_once("../../common/php/environment.php");


$assets = "./assets/pics";

$files = scandir($assets);

$galleryImages = array();

foreach ($files as $images) {

  if (str_contains($images)) {
    $commondir = "./assets/pics/homeImg/";
    $commonFolder = scandir($commondir);
    foreach ($commonFolder as $common) {
      if ($common != "." && $common != "..") {
        $galleryImages[] = "$commondir/$common";
      }
    }
  }
}

Util::SetResponse($galleryImages);