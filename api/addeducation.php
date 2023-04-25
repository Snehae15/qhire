<?php
include 'connection.php';

// $id=$_POST['id'];
$centername=$_POST['centername'];
$degree=$_POST['degree'];
$field=$_POST['field'];
$startdate=$_POST['startdate'];
$enddate=$_POST['enddate'];
$grade=$_POST['grade'];
$activity=$_POST['activity'];
$description=$_POST['description'];

$sql=mysqli_query($con,"INSERT INTO education(centername,degree,field,startdate,enddate,grade,activity,description)VALUES('$centername','$degree,'$field','$startdate','$enddate','$grade','$activity','$description')");

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

