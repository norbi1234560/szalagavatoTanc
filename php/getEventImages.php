<?php

require_once("../../common/php/environment.php");

$result = glob("assets/eventImg/*");

Util::setResponse($result);