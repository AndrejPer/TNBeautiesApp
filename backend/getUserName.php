<?php

include 'db_conn.php';

$userID = $_POST['id'];

$query = "SELECT first_name, last_name FROM User WHERE id='$userID'";

$result = mysqli_query($conn, $query);
$count = mysqli_num_rows($result);

if($count == 1) {
    echo json_encode(mysqli_fetch_assoc($result));
}
else {
    echo mysqli_error($conn);
}

?>