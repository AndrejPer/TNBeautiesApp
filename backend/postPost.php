<?php

include 'db_conn.php';

#$time = $_POST['publish_time'];
#$content = $_POST['content'];
#$authorID = $_POST['author_id'];

$time = '2022-08-16 23:50:00';
$content = 'This s a post! The first one!';
$authorID = '1';

$insert = "INSERT INTO Post(id, publish_time, content, author_id) VALUES (NULL, '$time', '$content', '$authorID')";
$query = mysqli_query($conn, $insert);

if($query) {
    echo json_encode("Success");
}
else {
    echo mysqli_error($conn);
}

mysqli_close($conn);
?>