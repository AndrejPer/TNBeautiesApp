<?php

include 'db_conn.php';

$name = $_POST['name'];
$query = "SELECT * FROM Location WHERE name LIKE '$name%'";

$res = mysqli_fetch_all($conn->query($query), MYSQLI_ASSOC);
echo json_Encode($res);


?>