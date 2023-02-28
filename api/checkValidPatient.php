<?php

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "online_doctor";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
//get data from form
    
$email = $_POST['email'];
$password = $_POST['password'];

// Check if the email and password match a record in the database
$stmt = $conn->prepare("SELECT * FROM patientData WHERE PEmail = ? AND PPassword = ?");
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $PID = $row['PID'];
  
 
    
   
    echo "OK_$PID";


    
} else {
    echo "Invalid login credentials.";
    print("Response value: Invalid login credentials.");
}

$stmt->close();
$conn->close();

?>

