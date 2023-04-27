<?php
include 'connection.php';
$email = $_POST['email'];
$password = $_POST['password'];

// Prepare and execute database query
$query = "SELECT * FROM login WHERE email='$email'";
$result = mysqli_query($conn, $query);

// Check if query returned any results
if (mysqli_num_rows($result) == 0) {
  echo "Invalid email or password";
} else {
  // Verify user's password
  $row = mysqli_fetch_assoc($result);
  if (password_verify($password, $row['password'])) {
    // Start session and store user information
    header('Location: home.php'); // Redirect to dashboard or other page
  } else {
    echo "Invalid email or password";
  }
}
?>