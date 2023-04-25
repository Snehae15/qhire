<?php
include 'connection.php';
$id = $_GET['id'];
mysqli_query($con,"update  reg_student set status='Accept' where std_id ='$id'");
header("location:verifystudent.php");
?>