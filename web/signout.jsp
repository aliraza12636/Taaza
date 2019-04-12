<%-- 
    Document   : signout
    Created on : 14 Apr, 2018, 1:39:35 PM
    Author     : Ali Raza
--%>
<%
    if(session.getAttribute("email")!=null)
    {
        session.setAttribute("email",null);
        session=null;
        response.sendRedirect("LoginFailedAlert.jsp");
    }

%>
