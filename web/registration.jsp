<%-- 
    Document   : registration
    Created on : 20/03/2021, 4:42:23 PM
    Author     : johnballa & hamartillano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay Registration</title>   
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <header>
      <nav>
        <ul class="menu">
          <li><a href="index.html">Home</a></li>
          <li><a href="registration.jsp">Register</a></li>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="">Browse Catalogue</a></li>
          <div class="search-container">
            <form action="">
              <button type="submit">Submit</button>
              <input id="searchbar" type="text" placeholder="Search.." />
            </form>
          </div>
        </ul>
      </nav>
    </header>
    <!-- initialize parameters and if statement for welcome page, followed by else statement for registration form -->
    <%
        //parameter variable declarations and requests (only the ones that are currently required/being used)
        String submitted = request.getParameter("submitted");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String tos = request.getParameter("tos");

        //if form has been submitted from this page, present welcome page
        if (submitted != null && submitted.equals("yes")) {
    %>
    <body>
        <%
            //if the required fields have not been filled out
            if (firstname.equals("") || lastname.equals("") || email.equals("") || password.equals("")) {
        %>
        <h1>Please fill out the required fields to continue.</h1>
        <form action="./registration.jsp">
            <input type="submit" id="register" value="return to registration"></input>
        <%
            //if the required fields have been filled out, but the tos has not been agreed to
        } else if (tos.equals("no")) {
        %>
        <h1>Please agree to the terms of service to continue.</h1>
        <form action="./registration.jsp">
            <input type="submit" id="register" value="return to registration"></input>
        <%
            //everything else (which means required fields are complete and tos is agreed)
        } else {
        %>
        <h1>Welcome, <%=firstname%> <%=lastname%>!</h1>
        <h3>Your account is registered with <%=email%>.</h3>
        <%
            } //end of welcome page scenarios
        %>
    </body>
    <%
        //if the registration form was not submitted to reach this page (aka first visit this session), present reg form
    } else {
    %>
    <body>
        <form action="./registration.jsp" method="post"> <!-- links the form back to itself for the first if statement -->
            <fieldset>
                <legend>IoTBay Account Registration:</legend>
                <table>
                    <tr>
                        <td>Required Fields*</td>
                    </tr>
                    <tr>
                        <td><label for="firstname">First Name*:</label></td>
                        <td><input type="text" id="firstname" name="firstname"></input></td>
                    </tr>
                    <tr>
                        <td><label for="lastname">Last Name*:</label></td>
                        <td><input type="text" id="lastname" name="lastname"></input></td>
                    </tr>                    
                    <tr>
                        <td><label for="email">Email*:</label></td>
                        <td><input type="email" id="email" name="email"></input></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password*:</label></td>
                        <td><input type="password" id="password" name="password"></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline1">Address Line 1:</label></td>
                        <td><input type="text" id="addressline1" name="addressline1"></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline2">Address Line 2:</label></td>
                        <td><input type="text" id="addressline2" name="addressline2"></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">City:</label></td>
                        <td><input type="text" id="city" name="city"></input></td>
                    </tr>
                    <tr>
                        <td><label for="state">State/Territory:</label></td>
                        <td>
                            <select id="state" name="state">
                                <option></option> <!-- keeps the field blank to start-->                            
                                <option value="NSW">NSW</option>
                                <option value="ACT">ACT</option>
                                <option value="WA">WA</option>
                                <option value="QLD">QLD</option>
                                <option value="NT">NT</option>                                
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="tos">Agree to TOS*:</label></td>
                        <td>
                            <select id="tos" name="tos">
                                <option value="no">No</option> 
                                <option value="yes">Yes</option>
                            </select>
                            <a href="./tos.html" target="_blank"> Read the TOS </a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" id="register" name="register" value="Register"></input></td>
                    </tr>
                </table>
                <input type="hidden" id="submitted" name="submitted" value="yes">
            </fieldset>
        </form>
    </body>
    <% }%>
</html>
