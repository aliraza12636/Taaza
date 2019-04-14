<%-- 
    Document   : my_orders
    Created on : Apr 9, 2019, 8:49:01 PM
    Author     : Ali Raza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.Item"%>
<%@page import="dto.Customer"%>
<%@page import="dao.CustomerDAO"%>
<!DOCTYPE html>

<%
         String uid1 ;
         uid1=   (String)  session.getAttribute("email");
         if(uid1== null)
          {
            response.sendRedirect("index.jsp");
          }
          CustomerDAO cm1 = new CustomerDAO();
          Customer c = cm1.getCustomerData(uid1);
          session.setAttribute("sobj", c);
    
    
%>
<html>
	<head>
		<title>My orders</title>

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
						<h4><%=c.getName() %></h4>
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
					<FORM action="signout.jsp" method="post"><button type='submit' class='btn btn-default' id ='signoutbtn'>Sign Out</button></FORM>
				</div>
			</div>
			
			<div id='content' class='row'> 
				<div class='col-sm-12'>
				
				</br>
					<center>
					
						
						
					<table class ='table' id = 'mytable' border = '1'>
						<th>Item From</th>
						<th>Item Name</th>
						<th>Quantity</th>
						<th>Amount to pay</th>
						<th>Status</th>
						 modify using jsp
						<tr>
							
						</tr>
					</table>
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>
