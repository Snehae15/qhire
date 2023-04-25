<?php
include 'connection.php';
$id = $_GET['id'];
mysqli_query($con,"update  reg_company set status='Accept' where comp_id ='$id'");
header("location:verifycompany.php");
?>