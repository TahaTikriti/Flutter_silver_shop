<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

include 'connection.php'; // Assuming you have a file named connection.php for database connection

// Establish a connection to your database

// Assuming $conn is your database connection object

// Perform the query to fetch necklaces
$query = "SELECT * FROM silver WHERE type = 'necklace'";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query failed" . mysqli_error($conn));
}

$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
    $rows[] = $row;
}

// Return JSON encoded data
echo json_encode($rows);

// Close the connection
mysqli_close($conn);
?>
