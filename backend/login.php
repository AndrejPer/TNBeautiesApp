<?php

include 'db_conn.php';

#$password = 'P4ssword?';
#$email = 'andrej@email.com';

$email = trim($_POST['email']);
$password = trim($_POST['password']);

$query = "SELECT * FROM User WHERE email = '$email' AND password = '$password'";

$result = mysqli_query($conn, $query);
$count = mysqli_num_rows($result);

if($count != 1) {
    echo json_encode("Error");
} else {
    echo json_encode(mysqli_fetch_assoc($result));
}

?>