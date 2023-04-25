<?php
include 'connection.php';
$id = $_GET['id'];
mysqli_query($con,"update reg_emp set status='Rejected' where emp_id ='$id'");
header("location:verifyemployee.php");
?>