
<?php
include 'connection.php';
$data=mysqli_query($con,"select * from reg_company");
?><!DOCTYPE HTML>
<html>
<head>
<title>veify employee</title>
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
						<h4>Veify Company</h4>
						<table class="table">
							<thead>
								<tr>
								  <th>#</th>
								  <th>COMPANY Name</th>
								  <th>COMPANY DESCRIPTION</th>
								  <th>TYPE</th>
                                  <th>CONTACT INFO</th>
                                  <th>USERNAME</th>
                                  <th>PASSWORD</th>
                                  <th>EMAIL</th>
                                  <th>CERTIFICATE UPLOAD</th>
								</tr><th colspan="2"><center>Select Status</center></th>
								<th>Status</th>
							</thead>
							<tbody>
                            <?php
                        while($row = mysqli_fetch_assoc($data)){
                      ?>
                        <tr>
                        <td><?php echo $row['comp_id'] ?></td>
                          <td><?php echo $row['company_name'] ?></td>
                          <td><?php echo $row['company_descrip'] ?></td>
                          <td><?php echo $row['type']?></td>
                          <td><?php echo $row['contact_info'] ?></td>
                          <td><?php echo $row['username'] ?></td>
                          <td><?php echo $row['password'] ?></td>
                          <td><?php echo $row['email'] ?></td>
                          <td><?php echo $row['certificate_upload'] ?></td>
						  <!-- <td> <a href="view-more.php?id=<?php echo $row['comp_id'] ?>" type="button" class="btn btn-inverse-warning ">View more</a></td> -->
						  <td> <a href="acceptcompany.php?id=<?php echo $row['comp_id'] ?>" type="button" class="btn btn-inverse-success">Accept</a></td>
							<td> <a href="rejectcompany.php?id=<?php echo $row['comp_id'] ?>" type="button" class="btn btn-inverse-danger">Reject</a></td>
							<td><?php echo $row['status'] ?></td>
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