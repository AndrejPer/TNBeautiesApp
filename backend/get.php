<?php
require_once('db_conn.php');

$password = 'P4ssword?';
$email = 'andrej@email.com';

$query = "SELECT * FROM User WHERE email='$email' AND password = '$password'";
$stm = $conn->prepare($query);
$stm->execute();

$row = $stm->fetch(PDO::FETCH_ASSOC);
echo json_encode($row);
?>