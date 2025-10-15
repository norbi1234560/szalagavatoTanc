<?php

require_once("../../common/php/environment.php");

$assets = "./assets/pics";

$files = scandir($assets);

$galleryImages = array();

foreach ($files as $classes) {

  if (str_contains($classes, "13")) {
    $commondir = "./assets/pics/$classes/common";
    $commonFolder = scandir($commondir);
    foreach ($commonFolder as $common) {
      if ($common != "." && $common != "..") {
        $galleryImages[] = "$commondir/$common";
      }
    }
  }
}

Util::SetResponse($galleryImages);