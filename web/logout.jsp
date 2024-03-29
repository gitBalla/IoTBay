<%-- 
    Document   : logout
    Created on : 27/03/2021, 4:01:11 PM
    Author     : johnballa
--%>
<%@page import="isd.iotbay.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <%
        Customer customer = (Customer)session.getAttribute("customer");
    %>
    <body>
      <header>
        <nav>
          <ul class="menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="registration.jsp">Register</a></li>
            <li><a href="login.jsp">Login</a></li>
            <li><a>Browse Catalogue</a></li>
            <div class="search-container">
              <form action="">
                <button type="submit">Submit</button>
                <input id="searchbar" type="text" placeholder="Search.." />
              </form>
            </div>
          </ul>
        </nav>
      </header>
      <h1 class="main_title">You are now logged out.</h1>
      <div class="landing_body"><p>Thanks for visiting IoTBay, ${customer.firstName}</p>
        <a href="login.jsp">Login again</a>
        <a>Start Browsing</a>
      </div>
    </body>
    <%
        session.invalidate();
    %>
</html>
