<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

include('connection.php');

if (isset($_POST['user_name'])) {
    $userName = $_POST['user_name'];

    $sql = "SELECT * FROM user WHERE USERNAME ='$userName'";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        echo json_encode(array("usernameFound" => true));
    } else {
        echo json_encode(array("usernameFound" => false));
    }
} else {
    echo json_encode(array("error" => "user_name key is missing"));
}
?>

