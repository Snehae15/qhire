<?php

include 'connection.php';
$email = $_POST['email'];
$password = $_POST['password'];

$sql = mysqli_query($con, "SELECT * FROM reg_emp WHERE email='$email' AND password='$password'");

if($sql->num_rows > 0)
{
    while ($row = mysqli_fetch_assoc($sql))
    {
      $myarray['message'] = 'User Successfully LoggedIn';

     $myarray['emp_id'] = $row['emp_id'];
     $myarray['email']= $row['email'];
    $myarray['password']= $row['password'];

    }     
}  
else 
{
    $myarray['message'] = 'Failed to LogIn';
}
echo json_encode($myarray);
?>