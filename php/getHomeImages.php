<?php

require_once("../../common/php/environment.php");

$result = glob("assets/homeImg/*");

Util::setResponse($result);