<?php
include 'connection.php';
$id = $_GET['id'];
mysqli_query($con,"update  reg_emp set status='Accept' where emp_id ='$id'");
header("location:verifycompany.php");
?>