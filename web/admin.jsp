<%-- 
    Document   : admin
    Created on : 09/05/2021, 3:17:18 PM
    Author     : johnballa
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Menu</title>
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
              <li><a href="./staff.jsp"> Staff Menu</a></li>
              <li><a href="./admin.jsp"> Admin Menu</a></li>
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
            <%
            if(user.isAdmin()) {
            %>            <h1 class="main_title">Admin Menu</h1>
            <div class="landing_body">
                <table class="buttonTable">
                    <a class='formButton' href="">Add New User</a>
                    <a class='formButton' href="">List User Records</a>
                    <a class='formButton' href="">Edit User Record</a>            
                    <a class='formButton' href="">Delete User</a>
                </table>
            </div>
            <%
            } else {
            %>
            <h1 class="main_title">UNAUTHORIZED ACCESS</h1>
            <%
            }
            %>
        </main>
    </body>
</html>