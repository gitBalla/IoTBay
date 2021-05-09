<%-- 
    Document   : userAccessLogs
    Created on : 26/04/2021, 1:56:57 AM
    Author     : johnballa
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.UserLog"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>View Access Logs</title>
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
          <li><a>Browse Catalogue</a></li>
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
      <h1 class="main_title">Access Logs</h1>
      <div class="landing_body">
      <div>
        <label class="user_access_form">Search Log Entries: 
           <input class="formInput" type="date" name="logSearchBar"></input>
        </label>
      </div>
        <jsp:include page="./userLogTable.jsp" flush="true"/>
        <a class='formButton' href="./account.jsp">View Account</a>
        <a class='formButton' href="LogoutServlet">Logout</a>
      </div>
    </main>
  </body>
</html>
