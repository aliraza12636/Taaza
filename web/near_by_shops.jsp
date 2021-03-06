<%-- 
    Document   : near_by_shops
    Created on : Apr 9, 2019, 8:48:24 PM
    Author     : Ali Raza
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Shopkeeper"%>
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
					<!--	<li><a href='subscriptions.jsp'>Subscriptions</a></li> -->
					</ul>
					<FORM action="signout.jsp" method="post"><button type='submit' class='btn btn-default' id ='signoutbtn'>Sign Out</button></FORM>
				</div>
			</div>
			
			<div id='content' class='row'> 
				<div class='col-sm-12'>
				
				</br>
					<center>
					<form method = 'post' action='near_by_shops.jsp'>
					<label >
							choose your Landmark:  &nbsp;</lable><select class="input select" name="lm">
                                                         <option >  --select-- </option>
                                            <% 
                                                List<Shopkeeper> slist = new  ArrayList<Shopkeeper>();
                                                slist = cm1.getLandMarkList();
                                                for(Shopkeeper s : slist)
                                                {
                                            %>
								<option>  <%=s.getLandmark() %> </option>
                                            <%  }	%>	
							</select>
							
						</br></br>
						<button class='btn btn-search' id ='mybtn'>Search</button>
						</form>
                                                        
                                                        
						<%
                                           String lm = request.getParameter("lm");
                                           if(lm != null)
                                               session.setAttribute("lm", lm);
                                                
                                           if(session.getAttribute("lm") !=null)
                                            {
                                                %>
                                                <br/>
                                                <h3>Shops around you</h3></br>
                                                <table class ='table' id = 'mytable' border = '1'>
						<th>shop Name</th>
						<th>Honer Name</th>
						<th>Visit</th>
                                                <%
                                                lm = (String) session.getAttribute("lm");
                                                     int n = 0;
                                                    String temp = "hid";
                                                    session.setAttribute("slist", slist);
                                                for(Shopkeeper s : slist)
                                                {
                                                    if(lm.equals(s.getLandmark()))
                                                    {
                                                       %>
                                                            <tr>
                                                                <td><%=s.getShop_name()%></td>
                                                                <td><%=s.getName() %></td>
                                                                <td>
                                                                    <form action="Shop1" method="post">
                                                                    <input type="hidden" value="<%=n%>"  name="<%=temp+n%>">
                                                                        <button class='btn btn-primary' id ='mybtn7' type="submit">Visit Shop</button>
                                                                    </form>
                                                                    
                                                                </td>
                                                            </tr>
                                                        <%
                                                    }
                                                    n++;
                                                }
                                            
                                            }
                                        %>
						
				
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>

