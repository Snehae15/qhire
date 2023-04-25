<?php
include 'connection.php';
$data=mysqli_query($con,"select * from reg_student");
?>
<!DOCTYPE HTML>
<html>
<head>
<title>veify student</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS -->

 <!-- side nav css file -->
 <link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
 <!-- side nav css file -->
 
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!--//webfonts--> 

<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->

</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
	<?php
    include 'sidebar.php';
    ?>
		<!--left-fixed -navigation-->
		
		<!-- header-starts -->
	<?php
    include 'header.php';
    ?>

		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<div class="tables">
					<h2 class="title1">Tables</h2>
					<div class="panel-body widget-shadow">
						<h4>View all students</h4>
						<table class="table">
							<thead>
								<tr>
								  <th>#</th>
								  <th>Name</th>
								  <th>DOB</th>
								  <th>PHONE NO</th>
                                  <th>GENDER</th>
                                  <th>ADDRESS</th>
                                  <th>QUALIFICATION</th>
                                  <th>USERNAME</th>
                                  <th>EMAIL</th>
                                  <th>PASSWORD</th>
                                  <th>RESUME</th>
                                  <th>STATUS</th>
								</tr>
							</thead>
							<tbody>
                            <?php
                        while($row = mysqli_fetch_assoc($data)){
                      ?>
                        <tr>
                        <td><?php echo $row['std_id'] ?></td>
                          <td><?php echo $row['name'] ?></td>
                          <td><?php echo $row['dob'] ?></td>
                          <td><?php echo $row['phone_no']?></td>
                          <td><?php echo $row['gender'] ?></td>
                          <td><?php echo $row['address'] ?></td>
                          <td><?php echo $row['qualification'] ?></td>
                          <td><?php echo $row['username'] ?></td>
                          <td><?php echo $row['email'] ?></td>
                          <td><?php echo $row['password'] ?></td>
                          <td><?php echo $row['resume'] ?></td>
                          <td><span class="label label-danger"><?php echo $row['status'] ?></span></td>

                          <td></td>
                          <td></td>
                        </tr>
                        <?php 
                        }
                        ?>
							</tbody>
						</table>
					</div>
					
		
	
	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->
	
	<!-- Classie --><!-- for toggle left push menu script -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->
	
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"> </script>
	
</body>
</html>