<?php

include 'db_conn.php';

$authorID = $_POST['author_id'];
$query = "SELECT * FROM Post WHERE author_id='$authorID'";

$result = mysqli_query($conn, $query);
$count = mysqli_num_rows($result);
#echo $count;

if($result) {
    $res = mysqli_fetch_all($conn->query($query), MYSQLI_ASSOC);
    echo json_Encode($res);
}
else {
    echo mysqli_error($conn);
}

$result->free();

?>