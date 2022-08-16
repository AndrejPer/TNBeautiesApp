<?php

include 'db_conn.php';


$fname = trim($_POST['first_name']);
$lname = trim($_POST['last_name']);
$email = trim($_POST['email']);
$birthday = trim($_POST['birthday']);
$password = trim($_POST['password']);

#$fname = 'Marko';
#$lname = 'Markovic';
#$email = 'marko@email.com';
#$birthday = '2022-08-16 00:00:00';
#$password = 'P4ssword?';

$sql = "SELECT * FROM User WHERE email = '$email' AND password = '$password'";

$result = mysqli_query($conn, $sql);
$count = mysqli_num_rows($result);

if($count == 1) {
    echo json_encode("Error - already registered");
} else {
    $insert = "INSERT INTO User(id, first_name, last_name, birthday, role, location_id, email, password) VALUES (NULL, '$fname', '$lname', '$birthday', 'registeredUser', NULL, '$email', '$password')";
    $query = mysqli_query($conn, $insert);

    if($query) {
        echo json_encode("Success");
    }
}

?>