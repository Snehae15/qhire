<?php
include 'connection.php';
$id=$_POST['id'];
$sql = mysqli_query($con,"SELECT * FROM reg_emp where emp_id='$id'");
$list=array();

if($sql->num_rows>0){
    while($row = mysqli_fetch_assoc($sql)){
        $myarray['message']='viewed';
        $myarray['name']= $row['name'];
        $myarray['dob']= $row['dob'];
        $myarray['phone_no']= $row['phone_no'];
        $myarray['gender']= $row['gender'];
        $myarray['address']= $row['address'];
        $myarray['qualification']= $row['qualification'];
        $myarray['email']= $row['email'];
        $myarray['ep_status']= $row['ep_status'];
        $myarray['upload_resume']= $row['upload_resume'];

        array_push($list,$myarray);
    }
}
else{
    $myarray['message']='failed';
    array_push($list,$myarray);

}
echo json_encode($list);
?>