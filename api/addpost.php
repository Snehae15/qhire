<?php
include 'connection.php';

// $id=$_POST['id'];
$postname=$_POST['postname'];
$description=$_POST['description'];
$uploadfile=$_POST['uploadfile'];

$sql=mysqli_query($con,"INSERT INTO posts(postname,description,uploadfile)VALUES('$postname','$description','$uploadfile')");

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

