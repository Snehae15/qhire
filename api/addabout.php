<?php
include 'connection.php';

$about=$_POST['about'];

$sql=mysqli_query($con,"INSERT INTO about(about)VALUES('$about')");

if($sql)
{
    $myaddress['message']='added';
}
else
{
    $myaddress['message']='failed';
}
echo json_encode($myaddress);
?>

