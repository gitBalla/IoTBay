<%-- 
    Document   : navBar
    Created on : 16/05/2021, 8:59:56 PM
    Author     : johnballa
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navigation Bar import</title>
    </head>
    <%
       User user = (User)session.getAttribute("user");
    %>
    <body>
        <header>
            <nav>
                <ul class="menu">
                  <li><a href="./index.jsp">Home</a></li>
                  <%
                      if (user != null) {
                  %>
                  <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
                  <li><a href="LogoutServlet">Logout</a></li>
                  <%
                      } else {
                  %>
                  <li><a href="./registration.jsp">Register</a></li>
                  <li><a href="./login.jsp">Login</a></li>
                  <%
                      }
                  %>
                  <li><a href="CatalogueServlet">Browse Catalogue</a></li>
                  <li><a href="CheckoutServlet">Checkout</a></li>
                    <%
                    if(user != null && user.isStaff()) {
                    %>
                    <li><a href="./staff.jsp"> Staff Menu</a></li>
                    <%
                    }
                    if(user != null && user.isAdmin()) {
                    %>
                    <li><a href="./admin.jsp"> Admin Menu</a></li>
                    <%
                    }
                    %>
                  <div class="search-container">
                    <form action="">
                      <button type="submit">Submit</button>
                      <input id="searchbar" type="text" placeholder="Search.." />
                    </form>
                  </div>
                </ul>
            </nav>
        </header>
    </body>
</html>
