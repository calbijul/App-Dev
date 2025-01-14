<?php
header('Access-Control-Allow-Origin: *');

include 'connection.php';

$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT * FROM tblusers WHERE username = :username AND password = :password ";
$stmt = $conn->prepare($sql);
$stmt->bindParam(':username', $username);
$stmt->bindParam(':password', $password);
$stmt->execute();
$returnValue = 0;
if ($stmt->rowCount() > 0) {
    $returnValue = $stmt->fetch(PDO::FETCH_ASSOC);
}
$stmt = null;
$conn = null;

echo json_encode($returnValue);

?>
