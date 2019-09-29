<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hotelmenu.service.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Food Record</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
	<!--
	CSS
	============================================= -->
	<link rel="stylesheet" href="../css/linearicons.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	<link rel="stylesheet" href="../css/jquery-ui.css">				
	<link rel="stylesheet" href="../css/nice-select.css">							
	<link rel="stylesheet" href="../css/animate.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.css">				
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/custom.css">
	<link rel="stylesheet" href="../css/cms_page.css">
</head>
<body>
	
	<header>
		<div class="container p-5">
			<h2 class="title">Admin Panel</h2>
		</div>
	</header>
	
	<main>
		<div class="container">
			<section class="options text-right">
				<a href="orders.jsp" class="genric-btn primary-border">View Orders</a>
				<a href="add_food.jsp" class="genric-btn primary-border">Add New</a>
			</section> 
			<section class="food_record"> 
				<h3>Food Records</h3>
				<table id="food-record-table" class="table">
					<thead>
						<tr>
							<th>Id</th>
							<th>Food Name</th>
							<th>Cost</th>
							<th>Availability</th>
							<th>Category</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<% Statement st = DbConnect.getConnection();
							ResultSet rs = st.executeQuery("select * from food_record");
							while(rs.next()){
						%>    <tr>
						    	<td><%=rs.getString("food_id") %></td>
						    	<td><%=rs.getString("name") %></td>
						    	<td><%=rs.getString("cost") %></td>
						    	<td><%=rs.getString("availability") %></td>
						    	<td><%=rs.getString("category") %></td>
						    	<td><a href="edit_food.jsp?food_id=<%=rs.getString("food_id") %>" class="genric-btn warning">Edit</a></td>
						    	<td><a onclick="deleteFood('<%=rs.getString("food_id") %>')" class="genric-btn danger">Delete</a></td> 
						      </tr>
						<%	}
						%>
					</tbody>
				</table>
			</section>
		</div>
	</main>
	
	<script src="../js/vendor/jquery-2.2.4.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/vendor/bootstrap.min.js"></script>			
	<script src="../js/jquery-ui.js"></script>					
	<script src="../js/easing.min.js"></script>			
	<script src="../js/hoverIntent.js"></script>
	<script src="../js/superfish.min.js"></script>	
	<script src="../js/jquery.ajaxchimp.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>						
	<script src="../js/jquery.nice-select.min.js"></script>					
	<script src="../js/owl.carousel.min.js"></script>			
    <script src="../js/isotope.pkgd.min.js"></script>								
	<script src="../js/mail-script.js"></script>	 
	<script src="../js/main.js"></script>	
	<script src="../js/datatables.min.js"></script>
	<script src="../js/cms-script.js"></script>
	<script>
	$("#food-record-table").DataTable();
	</script>
</body>
</html>