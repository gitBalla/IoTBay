<%-- 
    Document   : index.jsp
    Created on : 08/04/2021, 2:48:17 PM
    Author     : vince
--%>
<%@page import="isd.iotbay.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>IoTBay - Your Source for IoT Devices</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
          <%
              if (customer != null) {
          %>
          <li><a>Account</a></li>
          <li><a href="logout.jsp">Logout</a></li>
          <%
              } else {
          %>
          <li><a href="registration.jsp">Register</a></li>
          <li><a href="login.jsp">Login</a></li>
          <%
              }
          %>
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
    <main>
      <h1 class="main_title">Welcome to IoTBay!</h1>
      <div class="landing_body">
        <p>
          Your first stop for all things IoT. We house a vast array of products that are easy to find and purchase.
        </p>
        <%
              if (customer != null) {
        %>
        <a>View Account</a>
        <%
              } else {
        %>
        <a href="registration.jsp">Create an account</a>
        <%
              }
        %>
        <a>Start Browsing</a>
      </div>
    </main>
  </body>
</html>
