<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
include('connection.php');
// Include your connection file here

// Check if the username and password are set
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Perform authentication here using your database connection
    // Adjust this query based on your database schema
    $sql = "SELECT * FROM user WHERE USERNAME = '$username' AND PASSWORD = '$password'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "error", "message" => "Invalid username or password"));
    }
} else {
    echo json_encode(array("status" => "error", "message" => "Invalid request"));
}
?>
