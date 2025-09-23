<?php

require_once("../../common/php/environment.php");


$assets ="./assets/pics";

$files = scandir($assets); 

$students = array();


foreach ($files as $classes) {

  if(str_contains($classes,"13")){
    $classdir = "./assets/pics/$classes";
    $studentsFolder = scandir($classdir);

    foreach ($studentsFolder as $student) {

      if(!str_contains($student,"common") &&
         !str_contains($student,".") &&
         !str_contains($student,"..")) {
        $students[] = $student;
      }
    }
  }
}

Util::SetResponse($students);