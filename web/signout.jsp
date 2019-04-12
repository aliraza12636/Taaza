<%-- 
    Document   : signout
    Created on : 14 Apr, 2018, 1:39:35 PM
    Author     : Ali Raza
--%>
<%
        
            session.invalidate();
            
    
        response.sendRedirect("LoginFailedAlert.jsp");
    

%>
