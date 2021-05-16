<%-- 
    Document   : welcome.jsp
    Created on : 08/04/2021, 3:28:34 PM
    Author     : vince
--%>
<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <%
        User user = (User)session.getAttribute("user");
    %>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <h1 class="main_title">Welcome, <%=user.getFirstName()%> <%=user.getLastName()%>!</h1>
        <div class="landing_body">
            <table class="buttonTable">
                <a class='formButton' href="./account.jsp">View User Account</a>
                <%
                if(user != null && user.isStaff()) {
                %>
                <a class='formButton' href="./staff.jsp"> View Staff Menu</a>
                <%
                }
                if(user != null && user.isAdmin()) {
                %>
                <a class='formButton' href="./admin.jsp"> View Admin Menu</a>
                <%
                }
                %>
                <a class='formButton' href="LogoutServlet">Logout</a>
            </table>
        </div>
        <%
        }
        %>
    </body>
</html>