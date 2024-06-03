
<?php
// Corrected PHP code for adding items to the cart

include 'connection.php'; // Database connection

// CORS headers for cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve product details from POST request
    $productName = $_POST['productName'];
    $productPrice = $_POST['productPrice'];
    $productCategory = $_POST['productCategory'];
    $imageUrl = $_POST['imageUrl'];

    // Validate and sanitize the input (important for security)
    $productName = filter_var($productName, FILTER_SANITIZE_STRING);
    $productPrice = filter_var($productPrice, FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
    $productCategory = filter_var($productCategory, FILTER_SANITIZE_STRING);
    $imageUrl = filter_var($imageUrl, FILTER_SANITIZE_URL);

    // Prepare SQL query to insert product
    $query = "INSERT INTO silver (name, price, type, img) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);

    // Bind parameters to the query
    $stmt->bind_param("sdss", $productName, $productPrice, $productCategory, $imageUrl);

    // Execute the query
    if ($stmt->execute()) {
        echo "Product inserted successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
} else {
    echo "Invalid request method";
}
?>