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
        String tos = request.getParameter("tos");        
    %>
    <body>
        <header>
          <nav>
            <ul class="menu">
              <li><a href="./index.jsp">Home</a></li>
              <%
                if (tos.equals("no")) {
              %>
              <li><a href="./registration.jsp">Register</a></li>
              <li><a href="./login.jsp">Login</a></li>
              <%
                  } else {
              %>
              <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
              <li><a href="LogoutServlet">Logout</a></li>
              <%
                  }
              %>
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
        <%
            //if the required fields have been filled out, but the tos has not been agreed to
        if (tos.equals("no")) {
        %>
        <h1 class="main_title">Registration Error:</h1>
        <div class="landing_body"><p>Please agree to the terms of service to continue.</p></div>
        <form class="buttonForm" action="./registration.jsp">
            <table>
                <tr>
                    <input type="submit" id="register" class="submit" value="return to registration"></input>
                    <a class="formButton" href="./index.jsp">Cancel</a>
                </tr>
            </table>
        <%
        session.invalidate(); //invalidates session from top of page if tos not agreed to
            //tos is agreed to
        } else {
        %>
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