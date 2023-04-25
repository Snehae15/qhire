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

$sql = mysqli_query($con, "UPDATE reg_emp SET name='$name',dob='$dob',phone_no='$phone_no',
gender='$gender',address='$address',
qualifiction='$qualification',username='$username',password='$password',
email='$email',ep_status='$ep_status', where emp_id = '$emp_id'");


if ($sql) {

  

    $myarray['message'] = 'Added';

    // $myarray['login_id'] = $row['login_id'];

    // $myarray['type'] = $row['type'];
  
} else {

  $myarray['message'] = 'Failed';
}
echo json_encode($myarray);
