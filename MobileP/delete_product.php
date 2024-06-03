
<?php
// Corrected PHP code for adding items to the cart

include 'connection.php'; // Database connection

// CORS headers for cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
$productName = $_POST['productName'];

// Prepare SQL statement to prevent SQL injection
$stmt = $conn->prepare("DELETE FROM silver WHERE name = ?");
$stmt->bind_param("s", $productName);

if ($stmt->execute()) {
    echo "Product deleted successfully";
} else {
    echo "Error: " . $conn->error;
}

$stmt->close();
$conn->close();
?>