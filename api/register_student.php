<?php
include 'connection.php';
$name = $_POST['name'];
$dob = $_POST['dob'];
$phone_no = $_POST['phone_no'];
$gender = $_POST['gender'];
$address = $_POST['address'];
$qualifiaction = $_POST['qualifiaction'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$upload_resume = $_POST['resume'];
$sql = mysqli_query($con, "INSERT INTO reg_student(name,dob,phone_no,gender,address,qualification,username,password,email,resume,status)VALUES('$name','$dob','$phone_no',''$gender,'$address','$qualifiaction','$username','$password','$email','$resume','pending')");

if ($sql)
{
    $myarray['message'] = 'Added';

} else {
    $myarray['message'] = 'failed';
}
echo json_encode($myarray);
?>