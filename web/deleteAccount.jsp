<%-- 
    Document   : deleteAccount
    Created on : 15/05/2021, 5:28:43 PM
    Author     : johnballa
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <%
        User user = (User) session.getAttribute("user");
        boolean deleted = Boolean.parseBoolean(request.getParameter("deleted"));
        String existErr = (String) session.getAttribute("existErr");
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
      <h1 class="main_title">Delete Account Confirmation</h1>
      <% 
        if (deleted) { //if delete has been successful
      %>
      <div class="landing_body">
        <p>Your account has been deleted.</p>
        <p>Please register again if you wish to login.</p>
          <table class="buttonTable">
            <a class='formButton' href="./index.jsp">Home Page</a>
            <a class='formButton' href="CatalogueServlet">Start Browsing</a>
          </table>
      </div>
      <% 
        } else { //if delete was not successful or user just arrived at the page
      %>
      <div class="landing_body">
          <p>Are you sure you want to delete your account?</p>
          <p>NOTE: Your account will not be recoverable if you proceed.</p>
          <p><span class="message"> <%=(existErr != null ? existErr : "")%> </span></p><!-- error messages -->
          <table class="buttonTable">
            <a class='formButton' href="DeleteAccountServlet">Yes, Delete My Account</a>
          </table><br><br><br><br>
          <table class="buttonTable">
            <a class='formButton' href="./account.jsp">Back to My Account</a>
            <a class='formButton' href="CatalogueServlet">Start Browsing</a>
          </table>
      </div>
      <% 
        }
      %>
    </body>
</html>