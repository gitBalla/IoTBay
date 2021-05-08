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
//        //parameter variable declarations and requests (only the ones that are currently required/being used)
//        String firstname = request.getParameter("firstname");
//        String lastname = request.getParameter("lastname");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String addressline1 = request.getParameter("addressline1");
//        String addressline2 = request.getParameter("addressline2");
//        String city = request.getParameter("city");
//        String postcode = request.getParameter("postcode");
//        String state = request.getParameter("state");
//        String phoneNum = request.getParameter("phoneNum");
        String tos = request.getParameter("tos");
        
//        User user = new User(email, firstname, lastname, password, addressline1, addressline2, city, state, postcode, phoneNum);
//        session.setAttribute("user", user);
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
              <li><a href="./account.jsp">Account</a></li>
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
        session.invalidate(); //invalidates session from top of page if tos not agreed to
            //tos is agreed to
        } else {
        %>
        <h1 class="main_title">Welcome, <%=user.getFirstName()%> <%=user.getLastName()%>!</h1>
        <div class="landing_body">
            <p>User Options:</p>
            <a href="./account.jsp">View Account</a>
            <a href="./editAccount.jsp">Edit Account</a>
            <a href="./userAccessLogs.jsp">View Logs</a>            
            <a href="./catalogue.jsp">Start Browsing</a>
        </div>
        <%
            }
        %>
    </body>
</html>
