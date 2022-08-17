<?php

include 'db_conn.php';

#$userID = $_POST['id'];
$postID = '1';
$query = "SELECT * FROM Comment WHERE author_id='$postID'";

$result = mysqli_query($conn, $query);
$count = mysqli_num_rows($result);
#echo $count;

if($count != 0) {
    while($obj = mysqli_fetch_assoc($result)) {
        echo json_encode($obj);
    }
}
else {
    echo mysqli_error($conn);
}

?>