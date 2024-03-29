<%-- 
    Document   : welcome.jsp
    Created on : 08/04/2021, 3:28:34 PM
    Author     : vince
--%>
<%@page import="isd.iotbay.model.Customer"%>
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
    <!-- initialize parameters and if statement for welcome page, followed by else statement for registration form -->
    <%
        //parameter variable declarations and requests (only the ones that are currently required/being used)
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String addressline1 = request.getParameter("addressline1");
        String addressline2 = request.getParameter("addressline2");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");
        String state = request.getParameter("state");
        String tos = request.getParameter("tos");
        
        Customer customer = new Customer(email, firstname, lastname, password, addressline1, addressline2, city, state, postcode);
        session.setAttribute("customer", customer);
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
              <li><a>Account</a></li>
              <li><a href="./logout.jsp">Logout</a></li>
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
            //tos is agreed to
        } else {
        %>
        <h1 class="main_title">Welcome, <%=firstname%> <%=lastname%>!</h1>
        <div class="landing_body"><p>Your registration details</p></div>
            <table class="displayTable">
                <tr>
                    <td>Email: </td><td><%=email%></td>
                </tr>
                <tr>
                    <td>Address: </td><td><%=addressline1%></td>
                </tr>
                <tr>
                    <td></td><td><%=addressline2%></td>
                </tr>
                <tr>
                    <td></td><td><%=city%>, <%=state%> <%=postcode%></td>
                </tr>
            </table></br>
            <div class="landing_body">
                <a>View Account</a>
                <a>Start Browsing</a>
            </div>
        <%
            }
        %>
    </body>
</html>
