<%-- 
    Document   : account
    Created on : 26/04/2021, 1:54:57 AM
    Author     : johnballa
--%>
<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>View Account</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./iotbayStyle.css" />
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
      <nav>
        <ul class="menu">
          <li><a href="./index.jsp">Home</a></li>
          <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
          <li><a href="LogoutServlet">Logout</a></li>
          <li><a href="./catalogue.jsp">Browse Catalogue</a></li>
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
    <main>
      <h1 class="main_title">Account details</h1>
      <div class="landing_body">
            <table class="displayTable">
                <tr>
                    <td>Name: </td><td>${user.firstName} ${user.lastName}</td>
                </tr>
                <tr>
                    <td>Email: </td><td>${user.email}</td>
                </tr>
                <tr>
                    <td>Phone: </td><td>${user.phoneNum}</td>
                </tr>
                <tr>
                    <td>Address: </td><td>${user.addressLine1}</td>
                </tr>
                <tr>
                    <td></td><td>${user.addressLine2}</td>
                </tr>
                <tr>
                    <td></td><td>${user.city}, ${user.state} ${user.postCode}</td>
                </tr>
            </table></br>
        <a class='formButton' href="EditServlet?email='<%= user.getEmail()%>'&password='<%=user.getPassword()%>'">Edit My Account</a>
        <a class='formButton' href="./userAccessLogs.jsp">View My Access Logs</a>
        <a class='formButton' href="">View My Orders</a>
        <a class='formButton' href="">Delete My Account</a>
      </div>
    </main>
  </body>
</html>
