<%-- 
    Document   : logout
    Created on : 27/03/2021, 4:01:11 PM
    Author     : johnballa
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <%
        String name = request.getParameter("name");
    %>
    <body>
      <header>
      <jsp:include page="./navBar.jsp" flush="true"/>
      </header>
      <h1 class="main_title">You are now logged out.</h1>
      <div class="landing_body"><p>Thanks for visiting IoTBay<%= (name != null ? " " + name : "" )%>!</p>
            <table class="buttonTable">
                <a class='formButton' href="./login.jsp">Login again</a>
                <a class='formButton' href="CatalogueServlet">Start Browsing</a>
            </table>
      </div>
    </body>
    <jsp:include page="/ConnServlet" flush="true"/>
</html>
