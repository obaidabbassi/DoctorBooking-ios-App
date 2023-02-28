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
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);


// Get the data from the iOS app
$docId = $_POST["doctorID"];
$docName = $_POST["doctorName"];
$docSpeciality = $_POST["doctorSpeciality"];
$patientId = $_POST["patientID"];

// Prepare a parameterized query
$stmt = $conn->prepare("INSERT INTO appointments (Docid, Docname, Docspe, Pid) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $docId, $docName, $docSpeciality, $patientId);

// Execute the prepared statement
if ($stmt->execute()) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure", "message" => $conn->error));
}

$conn->close();

?>
