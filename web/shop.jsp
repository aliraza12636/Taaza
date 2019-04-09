<%-- 
    Document   : shop
    Created on : Apr 9, 2019, 5:03:55 PM
    Author     : Ali Raza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Shop Homepage</title>

		<link href='./css/bootstrap.css' rel='stylesheet'/>
		<link href='./css/style1.css' rel='stylesheet' />

		<script src='./js/bootstrap.js'></script>
	</head>
	<body>
		<div class = 'container' id='mycontainer'>
			<div id='header' class='row'>
				<div class='col-sm-4'>
					<br/>
					<center>
					<!-- image of shop or a defalt image -->
						<img class='img-rounded' src='./logo.png'  height='100' width='60%' />
					</center>
				</div>
				
				<div class='col-sm-8'>
				<center>
					<h1>name of the shop</h1>
						<h4>a partner of Taaza</h4>
				</center>
				</div> 
				
			</div>
		
		
			<div id='nav' class='row'>
				<div class='col-sm-12'>
					<ul id='menuul' class="nav navbar-nav">
					<!-- modify badge using jsp -->
						
						<li><a href=''>Manage Shop</a></li>
						<li><a href=''>Orders &nbsp;<span class = 'badge' id = 'mybadge' >1</span></a></li>
						<li><a href=''>Permanent Users</a></li>
					</ul>
					<button class='btn btn-default' id ='signoutbtn'>Sign Out</button>
				</div>
			</div>
			
			<div id='content' class='row'> 
				<div class='col-sm-12'>
				</br>
					<center>
					<table class ='table' id = 'mytable' border = '1'>
						<th>Name</th>
						<th>unit</th>
						<th>Price per unit</th>
						<!-- modify using js-->
						<tr>
							
						</tr>
					</table>
						<button class='btn btn-default' id ='mybtn'>Add item</button>
						<button class='btn btn-default' id ='mybtn'>Edit</button>
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>

