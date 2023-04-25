<?php
include 'connection.php';
$company_name = $_POST['company_name'];
$company_descrip  = $_POST['company_descrip'];
$type = $_POST['type'];
$contact_info = $_POST['contact_info'];
$username = $_POST['username'];
$password = $_POST['username'];
$email = $_POST['email'];
$cerificate_upload = $_POST['cerificate_upload'];
$sql = mysqli_query($con, "INSERT INTO reg_company(company_name,company_descrip,type,contact_info,username,username,password,email,cerificate_upload)VALUES('$company_name','$company_descrip','$type',''$contact_info,'$username','$password','$email','$cerificate_upload')");

if ($sql)
{
    $myarray['message'] = 'Added';

} else {
    $myarray['message'] = 'failed';
}
echo json_encode($myarray);
?>