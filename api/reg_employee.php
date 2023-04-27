<?php
include 'connection.php';
$name = $_POST['name'];
$dob = $_POST['dob'];
$phone_no = $_POST['phone_no'];
$gender = $_POST['gender'];
$address = $_POST['address'];
$qualification = $_POST['qualification'];
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$ep_status = $_POST['ep_status'];
$upload_resume = $_POST['upload_resume'];
$status ='Pending';
$sql = mysqli_query($con, "INSERT INTO reg_emp(name,dob,phone_no,gender,address,qualification,username,password,email,ep_status,upload_resume,status)VALUES('$name','$dob','$phone_no','$gender','$address','$qualification','$username','$password','$email','$ep_status','$upload_resume','$status')");

if ($sql)
{
    $myarray['message'] = 'Added';

} else {
    $myarray['message'] = 'failed';
}
echo json_encode($myarray);
?>