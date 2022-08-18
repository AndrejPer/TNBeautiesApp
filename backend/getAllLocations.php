<?php

include 'db_conn.php';

$query = "SELECT * FROM Location";

$res = mysqli_fetch_all($conn->query($query), MYSQLI_ASSOC);
$count = count($res);

echo json_Encode($res);


?>