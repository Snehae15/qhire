<?php
include 'connection.php';
$id=$_POST['id'];
$sql = mysqli_query($con,"SELECT reg_emp.emp_id,about.about FROM reg_emp join about where emp_id='$id'");
$list=array();

if($sql->num_rows>0){
    while($row = mysqli_fetch_assoc($sql)){
        $myarray['message']='viewed';
       
        $myarray['about']= $row['about'];

        array_push($list,$myarray);
    }
}
else{
    $myarray['message']='failed';
    array_push($list,$myarray);

}
echo json_encode($list);
?>