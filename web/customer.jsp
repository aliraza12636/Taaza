<%-- 
    Document   : customer
    Created on : Apr 9, 2019, 7:36:54 PM
    Author     : Ali Raza
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.Item"%>
<%@page import="dto.Customer"%>
<%@page import="dto.NewOrders"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="dao.ShopkeeperDAO"%>
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
          NewOrders or = new NewOrders();
             
    
%>
<html>
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
					<h1>Welcome to Taaza</h1>
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
						<!--<li><a href='subscriptions.jsp'>Subscriptions</a></li>-->
					</ul>
					<FORM action="signout.jsp" method="post"><button type='submit' class='btn btn-default' id ='signoutbtn'>Sign Out</button></FORM>
                                     
				</div>
			</div>
			
			<div id='content' class='row'> 
				<div class='col-sm-12'>
				
				</br>
					<center>
					<form method = 'post' action=''>
					<lable id = 'lab'>Enter an Item to search :&nbsp;</lable>
						<input type = 'text' id = 'itemname' name='item' required /></br></br>
						<button class='btn btn-search' id ='mybtn'>Search</button>
						</form>
					<%
                                            String item = request.getParameter("item");
                                            if(item != null)
                                                session.setAttribute("item", item);
                                                
                                            if(session.getAttribute("item") !=null)
                                            {
                                                item = (String) session.getAttribute("item");
                                                item = item.toUpperCase();
                                                List<Item> ilist = new ArrayList<Item>();
                                                ilist = cm1.searchItem(item);
                                                if(ilist == null)
                                                {
                                                %>
                                                </br></br>
                                                <h3><%=item%> is not available anywhere</h3>
                                                <%
                                                }
                                           else
{
                                        %>
						</br>
                                                <h3>Search results for <%=item%></h3></br>
					<table class ='table' id = 'mytable' border = '1'>
						<th>shop Name</th>
						<th>unit</th>
						<th>Price per unit (Rs.)</th>
                                                <th>Quantity</th>
						
						
                                                <% 
                                                    int n = 0;
                                                    String temp = "hid";
                                                    String qtt ="quantity";
                                                    session.setAttribute("mylist", ilist);
                                                    for(Item it : ilist)
                                                    {
                                                %><tr><td><%=it.getShop_name() %></td><td><%=it.getQuantity() %></td><td><%=it.getPrize() %></td>
                                                    <td>
                                                        <form action="PlaceTheOrder" method="post">
                                                            <input type="hidden" value="<%=n%>"  name="<%=temp+n%>">
                                                            <input type="text" name="<%=qtt+n%>" placeholder="Quantity" required="" id ="qtb">
                                                            <button class='btn btn-default' id ='obtn' type="submit">Place Order</button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <%
                                                    n++;
                                                   
                                                    }
                                                    

                                                }
}
                                                %>
					</table>
                                         
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>



   