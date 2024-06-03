<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

include('connection.php');

$userName = $_POST['user_name'];
$userPassword = $_POST['password']; // Assuming the password field is named 'password' in your form

$sql = "INSERT INTO user (userid, USERNAME, PASSWORD) VALUES (NULL, '$userName', '$userPassword')";
$result = $conn->query($sql);
if ($result) {
  echo json_encode(array("success" => true));
} else {
  echo json_encode(array("success" => false));
}
?>
