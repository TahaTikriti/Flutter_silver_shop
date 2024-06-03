<?php
$conn = mysqli_connect(
    'localhost',
     'root', '',
     'SilverShop'
);
if (mysqli_connect_errno()) {
    echo "Failed to connect!" . mysqli_connect_error();
}
?>