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
          <li><a href="index.jsp">Home</a></li>
          <li><a href="registration.jsp">Register</a></li>
          <li><a href="login.jsp">Login</a></li>
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
    <body>
        <form id="registrationForm" action="./welcome.jsp" method="post">
            <fieldset>
                <legend>IoTBay Account Registration:</legend>
                <table>
                    <tr>
                        <td>Required Fields*</td>
                    </tr>
                    <tr>
                        <td><label for="firstname">First Name*:</label></td>
                        <td><input type="text" id="firstname" name="firstname" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="lastname">Last Name*:</label></td>
                        <td><input type="text" id="lastname" name="lastname" required></input></td>
                    </tr>                    
                    <tr>
                        <td><label for="email">Email*:</label></td>
                        <td><input type="email" id="email" name="email" ></input></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password*:</label></td>
                        <td><input type="password" id="password" name="password" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline1">Address Line 1:</label></td>
                        <td><input type="text" id="addressline1" name="addressline1" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline2">Address Line 2:</label></td>
                        <td><input type="text" id="addressline2" name="addressline2"></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">City:</label></td>
                        <td><input type="text" id="city" name="city" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">Postcode:</label></td>
                        <td><input type="number" id="postcode" name="postcode" minlength="4" maxlength="5" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="state">State/Territory:</label></td>
                        <td><input type="text" id="state" name="state" minlength="2" maxlength="3" pattern="[A-Z]*" title="Please use state abbreviation, i.e. 'NSW','SA'" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="tos">Agree to TOS*:</label></td>
                        <td>
                            <select id="tos" name="tos">
                                <option value="no">No</option> 
                                <option value="yes">Yes</option>
                            </select>
                            <a href="./tos.html" target="_blank">Read the Terms of Service</a>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" id="register" class="submit" name="register" value="Register"></input>
                            <a class="submit" href="./index.jsp">Cancel</a>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </body>
</html>
