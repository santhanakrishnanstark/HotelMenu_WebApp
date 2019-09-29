<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Add Food</title>

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
			<section class="add_food"> 
				<h3>Add New Food</h3>
				<div class="row">
					<div class="col-md-6">
						<div class="food_form mt-5">
							<form action="SaveFood" method="post">
								<div class="form-group">
									<label>Food Name: </label> <br/> 
									<input type="text" name="foodName" placeholder="Name of your food" class="single-input"/>
								</div>
								<div class="form-group">
									<label>Cost (Rs): </label> <br/> 
									<input type="text" name="foodCost" placeholder="Food cost" class="single-input"/>
								</div>
								<div class="form-group">
									<label>Availability: </label> <br/> 
									<label>
										<input type="radio" name="availability" value="1" />
										Yes
									</label> 
									<label>
										<input type="radio" name="availability" value="0" />
										No
									</label>
								</div>
								<div class="form-group">
									<label>Category: </label> <br/> 
									<label>
										<input type="checkbox" name="category[]" value="breakfast" />
										BreakFast
									</label>
									<label>
										<input type="checkbox" name="category[]" value="lunch" />
										Lunch
									</label>
									<label>
										<input type="checkbox" name="category[]" value="dinner" />
										Dinner
									</label>
								</div>
								<button type="submit" class="genric-btn primary circle arrow"> Add 
									<span class="lnr lnr-arrow-right"></span>
								</button>
							</form>
						</div>
					</div>
				</div>
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
</body>
</html>