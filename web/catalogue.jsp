<%-- 
    Document   : catalogue
    Created on : 27/04/2021, 4:49:12 PM
    Author     : hamartillano test commit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="isd.iotbay.model.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <title>IoT Bay Catalogue</title>
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
                <li><a href="./logout.jsp">Logout</a></li>
                <%
                    } else {
                %>
                <li><a href="./registration.jsp">Register</a></li>
                <li><a href="./login.jsp">Login</a></li>
                <%
                    }
                %>
                <li><a href="catalogue.jsp">Browse Catalogue</a></li>
                <%
                if(user.isStaff()) {
                %>
                <li><a href="./staff.jsp"> Staff Menu</a></li>
                <%
                }
                if(user.isAdmin()) {
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
        <main class="container">
            <div class="row">
                <div class="col">
                    <h1>Catalogue</h1>
                    <div style="display: flex">
                        <div><a href="p1.jsp"></a><p>Airpods Max</p></div>
                        <div><a href="p2.jsp"></a><p>iPhone 12 pro</p></div>
                        <div><a href="p3.jsp"></a><p>Microsoft Surface pro 7</p></div>
                        <div><a href="p4.jsp"></a><p>Bose Home Speaker 500</p></div>
                        <div><a href="p5.jsp"></a><p>Playstation 5</p></div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
