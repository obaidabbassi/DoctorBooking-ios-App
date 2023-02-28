<?php

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "online_doctor";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

$data = json_decode(file_get_contents("php://input"), true);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    if (!$conn->ping()) {
        die("Error: Could not connect to database server.");
    }
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

// Get the user's data from the form
$username = $_POST['username'];
$email = $_POST['email'];
    
    $password = $_POST['password'];
    $age = $_POST['age'];
    
    $phone = $_POST['phone'];


// Insert the data into the database
$sql = "INSERT INTO patientData (PName,PEmail,PPassword,Phone,PAge)
VALUES ('$username', '$email','$password','$phone','$age')";

    if ($conn->query($sql) === true) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure", "message" => $conn->error));
    }

$conn->close();
?>

