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
        response.sendRedirect("index.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="index.jsp"%>
<script language="javascript">
    document.getElementById("invalidlogin").innerHTML="<center>You Must login first!</center>";
</script>