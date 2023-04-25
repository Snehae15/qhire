
<?php
include 'connection.php';
$title = $_POST['title'];
$content = $_POST['content'];
$sql = mysqli_query($con, "INSERT INTO notification(title,content)VALUES('$title','$content')");

if ($sql)
{
    $myarray['message'] = ' Added successfully';

} else {
    $myarray['message'] = 'failed';
}
echo json_encode($myarray);
?>