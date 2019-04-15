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
<%@page import="dto.Shopkeeper"%>
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
          Shopkeeper s = (Shopkeeper)session.getAttribute("shopkeeper");
          ShopkeeperDAO sdao = new ShopkeeperDAO();
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
					
					
						</br>
                                                <h3>Your in <%=s.getShop_name() %></h3></br>
					
						
						
                                                <% 
                                                    int n = 0;
                                                    String temp = "hid";
                                                    String qtt ="quantity";
                                                    
                                                
                                           
                                                List<Item> ilist = new ArrayList<Item>();
                                                ilist = sdao.getItemList(s.getEmail());
                                               if(ilist != null)
                                               {%>
                                                <table class ='table' id = 'mytable' border = '1'>
						<th>Item</th>
						<th>Price per unit (Rs.)</th>
                                                <th>Quantity</th>
                                                
                                                <%
                                                    session.setAttribute("mylist", ilist);
                                                    for(Item it : ilist)
                                                    {
                                                %><tr><td><%=it.getItemname() %></td><td><%=it.getPrize() %></td>
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
                                              else
                                                {%><h5>Nothing is selling here</h5><%}

                                                %>
					</table>
                                         
					</center>
				</div>
				
				
			</div>
		
		
		
		
		</div>
	</body>
</html>



   