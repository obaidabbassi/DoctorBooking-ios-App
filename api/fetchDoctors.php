<?php
    header("Content-Type: application/json; charset=UTF-8");
   $host        = "localhost";
   $user        = "root";
   $password    = "";
   $dbname      = "online_doctor";
   $con = mysqli_connect($host, $user, $password,$dbname);
   if (!$con) {
      die("Connection failed: " . mysqli_connect_error());
   }
   $sql = "SELECT * FROM doctorData";
   $result = mysqli_query($con, $sql);
   $data = array();
   while ($row = mysqli_fetch_array($result)) {
      $data[] = $row;
   }
   echo json_encode($data);
   mysqli_close($con);
?>

