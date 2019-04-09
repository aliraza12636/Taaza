<%-- 
    Document   : near_by_shops
    Created on : Apr 9, 2019, 8:48:24 PM
    Author     : Ali Raza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Near By Shops</title>

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
					<h1>Welcome to taaza</h1>
						<h4>name of customer</h4>
				</center>
				</div> 
				
			</div>
		
		
			<div id='nav' class='row'>
				<div class='col-sm-12'>
					<ul id='menuulcust' class="nav navbar-nav">
					<!-- modify badge using jsp -->
						
						<li><a href='customer.jsp'>Search for an Item</a></li>
						<li><a href='near_by_shops.jsp'>Near by Shops</a></li>
						<li><a href='my_orders.jsp'>My Orders</a></li>
						<li><a href='subscriptions.jsp'>Subscriptions</a></li>
					</ul>
					<button class='btn btn-default' id ='signoutbtn'>Sign Out</button>
				</div>
			</div>
			
			<div id='content' class='row'> 
				<div class='col-sm-12'>
				
				</br>
					<center>
					<form method = 'post' action=''>
					<label class="input select">
							choose your Landmark:  &nbsp;</lable><select name="city">
								<option>  --select-- </option>
								
							</select>
							
						</br></br>
						<button class='btn btn-search' id ='mybtn'>Search</button>
						</form>
						
						<!--
					<table class ='table' id = 'mytable' border = '1'>
						<th>shop Name</th>
						<th>unit</th>
						<th>Price per unit</th>
						 modify using js
						<tr>
							
						</tr>
					</table> -->
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>

