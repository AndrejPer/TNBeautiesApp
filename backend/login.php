<?php

include 'db_conn.php';

$password = 'P4ssword?';
$email = 'andrej.email.com';


$email = trim($_POST['email']);
$password = trim($_POST['password']);

echo $password;

// Processing form data when form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    echo 'here--';
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    // Validate credentials
    $sql = "SELECT * FROM User WHERE email = '$email' AND password = '$password'";
    if ($result = mysqli_query($conn, $sql)) {
        echo 'now here';
        if ($result->num_rows > 0) {
            session_start();
            $data = mysqli_fetch_array($result);
            // Store data in session variables
            $_SESSION['loggedin'] = true;
            $_SESSION['id'] = $data['id'];

            //$_SESSION['email'] = $email;
            $_SESSION['email'] = $data['email'];
            echo json_encode($data);
        } else {
            echo 'Wrong username or password';
        }
    }
    // Close connection
    mysqli_close($conn);
}
?>