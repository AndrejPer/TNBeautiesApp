<?
require_once('db_conn.php');

$query = 'SELECT * FROM User';
$stm = $conn->prepare($query);
$stm->execute();

$row = $stm->fetch(PDO::FETCH_ASSOC);
echo json_encode($row);
?>