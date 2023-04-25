<?php
include 'connection.php';
$id=$_POST['id'];
$sql = mysqli_query($con,"SELECT * from reg_emp.emp_id,education.centername,education.degree,education.field,education.startdate,education.enddate,education.grade,education.activity,education.description FROM reg_emp join education where emp_id='$id'");
$list=array();

if($sql->num_rows>0){
    while($row = mysqli_fetch_assoc($sql)){
        $myarray['message']='viewed';
       
        $myarray['centername']= $row['centername'];
        $myarray['degree']= $row['degree'];
        $myarray['field']= $row['field'];
        $myarray['startdate']= $row['startdate'];
        $myarray['enddate']= $row['enddate'];
        $myarray['grade']= $row['grade'];
        $myarray['activity']= $row['activity'];
        $myarray['description']= $row['description'];

        array_push($list,$myarray);
    }
}
else{
    $myarray['message']='failed';
    array_push($list,$myarray);

}
echo json_encode($list);
?>