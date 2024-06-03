
<?php
// Corrected PHP code for adding items to the cart

include 'connection.php'; // Database connection

// CORS headers for cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve POST data
    $data = json_decode(file_get_contents("php://input"), true);

    if (!empty($data['bracelets']) && !empty($data['userid'])) {
        $userid = intval($data['userid']);
        $bracelets = $data['bracelets'];

        // Prepare SQL statement to prevent SQL injection
        $stmt = $conn->prepare("INSERT INTO cart (sid, userid) VALUES (?, ?)");

        foreach ($bracelets as $braceletId) {
            $braceletId = intval($braceletId);
            $stmt->bind_param("ii", $braceletId, $userid);
            if (!$stmt->execute()) {
                echo "Error: " . $stmt->error;
                exit;
            }
        }
        echo "Items added to the cart successfully!";
    } else {
        echo "No items selected or missing user ID!";
    }
} else {
    echo "Invalid request method!";
}

// Close database connection
$conn->close();
?>
