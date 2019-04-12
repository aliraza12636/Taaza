
<%@page import="dto.Item"%>
<%@page import="dto.Shopkeeper"%>
<%@page import="dao.ShopkeeperDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("signout.jsp");
    }
    ShopkeeperDAO sd1 = new ShopkeeperDAO();
    String email = session.getAttribute("email").toString();
    Shopkeeper s = sd1.getShopkeeperData(email);
    
   session.setAttribute("sobj", s);
    
    
%>

<html lang="en">
	<head>
		<title>Shop Homepage</title>

		<link href='./css/bootstrap.css' rel='stylesheet'/>
		<link href='./css/style1.css' rel='stylesheet' />

		<script src='./js/bootstrap.js'></script>
                
                  <script>
         addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
      </script>
      <!-- Meta tags -->
      <!--pop-ups-->
      <link href="css/popuo-box1.css" rel="stylesheet" type="text/css" media="all" />
      <link href="css/daiolof2pop.css" rel="stylesheet" type="text/css" media="all" />
      <!-- //pop-ups-->
      <!--//style sheet end here-->
      <link href="//fonts.googleapis.com/css?family=Barlow:300,400,500" rel="stylesheet">
      <!--<link href="css/login.css" rel='stylesheet' type='text/css' media="all">-->
      <!--//style sheet end here-->
    
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
					<h1><%=s.getShop_name() %></h1>
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
						 <button class='btn btn-default' id ='mybtn'><a href="#small-dialog1 " class="play-icon popup-with-zoom-anim">Add item</a></button>
                                                <button class='btn btn-default' id ='mybtn'><a href="#small-dialog2 " class="play-icon popup-with-zoom-anim">Delete</a></button></div>
					</center>
                                <div id="small-dialog1" class="mfp-hide w3ls_small_dialog wthree_pop">
                     <div class="agileits_modal_body">
                        <!--login form-->
                        <div class="letter-w3ls">
						
                           <form action="shop.jsp" method="post">
                              
                              <div class="form-left-to-w3l">
                                 <input type="text" name="itemname" placeholder="Product Name" required="">
                              </div>
                              <div class="form-left-to-w3l ">
                                 <input type="text" name="prize" placeholder="Prize" required="">
                              </div>
								 <div class="form-left-to-w3l"></br>
                                 <input type="radio" name="itype" value ='kg' required="">Quantity(Kg) &nbsp; &nbsp;&nbsp;
								 <input type="radio" name="itype" value ='lt' required="">Quantity(Lt.)
									
                              </div>
								
					<!--		  <div class="form-left-to-w3l"></br>
                                <a href ="" > Forget Password  </a>
                              </div>-->
                              <div class="btnn"><center>
                                 <button type="submit">ADD</button><br></center>
                              </div>
                           </form>
                           <div class="clear"></div>
                        </div>
                        <!--//login form-->
                     </div>
                  </div>
                                 <div id="small-dialog2" class="mfp-hide w3ls_small_dialog wthree_pop">
                     <div class="agileits_modal_body">
                        <!--login form-->
                        <div class="letter-w3ls">
						
                           <form action="shop.jsp" method="post">
                              
                              <div class="form-left-to-w3l">
                                 <input type="text" name="itname" placeholder="Product Name" required="">
                              </div>
                              								
					<!--		  <div class="form-left-to-w3l"></br>
                                <a href ="" > Forget Password  </a>
                              </div>-->
                              <div class="btnn"><center>
                                 <button type="submit">DELETE</button><br></center>
                              </div>
                           </form>
                           <div class="clear"></div>
                        </div>
                        <!--//login form-->
                     </div>
                  </div>
               </div>
				</div>
				
				
			</div>
             <script src='js/jquery-2.2.3.min.js'></script>
    
             <script src="js/jquery.magnific-popup.js"></script>
      <!-- //pop-up-box -->
      <script>
         $(document).ready(function () {
         	$('.popup-with-zoom-anim').magnificPopup({
         		type: 'inline',
         		fixedContentPos: false,
         		fixedBgPos: true,
         		overflowY: 'auto',
         		closeBtnInside: true,
         		preloader: false,
         		midClick: true,
         		removalDelay: 300,
         		mainClass: 'my-mfp-zoom-in'
         	});
         
         });
      </script>
      <!-- //pop-up-box -->
      <%
	  String uid=null ,itemname = null, prize = null,type= null , shop_name = null ;
            
                Item ai = new Item();
              
                uid = "sgdd" ;
                ai.setEmail(uid);
                
               shop_name = "akkshop";
                ai.setShop_name(shop_name);
                
                itemname = request.getParameter("itemname");
                ai.setItemname(itemname);
                
                prize = request.getParameter("prize");
                ai.setPrize(prize);
                
                type = request.getParameter("itype");
                ai.setQuantity(type);
                
                ShopkeeperDAO sd = new ShopkeeperDAO();
                if(prize !=null){
                boolean b = sd.addItem(ai);
                if(b){
                       out.println("<font color=red>Record Inserted...........</font>");
                    
                     }
            
            }
                  
		
		
		
                            String itname = null;
                            
                            itname = request.getParameter("itname");
                                ai.setItemname(itname);
                              if(itname!=null){
                
                                     int i = sd.deleteItem(ai);
                 
                                           if(i>0){
                 
                                                  out.println("<font color=red>Record deleted...........</font>");
                                                      }else{
                                             
                                           }
                                     }
                             
                
                %>
		
	</body>
</html>

