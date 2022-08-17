<?php

$dns = 'mysql:host=localhost;dbname=andrejp';

$servername = 'localhost';
$username = 'codeigniter';
$password = 'codeigniter2019';
$db_name = 'andrejp';


$urlroot = 'https://www.studenti.famnit.upr.si/andrejp';

try{
    $conn = new mysqli($servername, $username, $password, $db_name);
    #echo 'connected';
} catch(Exception $ex) {
    echo 'problem ';
    echo $ex->getMessage();
    echo $conn->$_SESSION;

    if ($conn->connect_error) {
        die('Connection failed: ' . $conn->connect_error);
    }
}

?>     