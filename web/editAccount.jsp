<%-- 
    Document   : editAccount
    Created on : 26/04/2021, 2:20:26 AM
    Author     : johnballa
--%>

<%@page import="isd.iotbay.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Edit Account</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./iotbayStyle.css" />
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
          <li><a href="./index.jsp">Home</a></li>
          <li><a href="./account.jsp">Account</a></li>
          <li><a href="./logout.jsp">Logout</a></li>
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
      <h1 class="main_title">Edit Account Details</h1>
      <div class="landing_body">
        <p>
          ...
        </p>
        <a href="./account.jsp">Cancel</a>
        <a href="./logout.jsp">Logout</a>
      </div>
    </main>
  </body>
</html>