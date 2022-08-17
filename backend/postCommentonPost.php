<?php

include 'db_conn.php';

$time = $_POST['publish_time'];
$content = $_POST['content'];
$authorID = $_POST['author_id'];
$postID = $_POST['post_id'];

#$time = '2022-08-16 23:50:00';
#$content = 'This is a diffrent comment to this post';
#$authorID = '1';
#$postID = '12';

$insert = "INSERT INTO Comment(id, publish_time, content, author_id, review_id, post_id) VALUES (NULL, '$time', '$content', '$authorID', NULL, '$postID')";
$query = mysqli_query($conn, $insert);

if($query) {
    echo json_encode("Success");
}
else {
    echo mysqli_error($conn);
}

mysqli_close($conn);
?>