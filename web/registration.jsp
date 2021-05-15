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
    <% 
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");
        String nameErr = (String) session.getAttribute("nameErr");
    %>
    <body>
        <header>
          <nav>
            <ul class="menu">
              <li><a href="./index.jsp">Home</a></li>
              <li><a href="./registration.jsp">Register</a></li>
              <li><a href="./login.jsp">Login</a></li>
              <li><a href="CatalogueServlet">Browse Catalogue</a></li>
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
            <h1 class="main_title">IoTBay Account Registration</h1>
            <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span>
                <form class="user_access_form" action="RegistrationServlet" method="post">
                    <fieldset>
                        <legend>Registration Details:</legend>
                        <table>
                            <tr>
                                <td><label for="firstName">First Name*:</label></td>
                                <td><input class="formInput" type="text" id="firstName" name="firstName" placeholder="Enter First Name" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="lastName">Last Name*:</label></td>
                                <td><input class="formInput" type="text" id="lastName" name="lastName" placeholder="Enter Last Name" required></input></td>
                            </tr>                    
                            <tr>
                                <td><label for="email">Email*:</label></td>
                                <td><input class="formInput" type="email" id="email" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="password">Password*:</label></td>
                                <td><input class="formInput" type="password" id="password" name="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="addressLine1">Address Line 1:</label></td>
                                <td><input class="formInput" type="text" id="addressLine1" name="addressLine1" placeholder="Enter Address" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="addressLine2">Address Line 2:</label></td>
                                <td><input class="formInput" type="text" id="addressLine2" name="addressLine2" placeholder="Enter Address"></input></td>
                            </tr>
                            <tr>
                                <td><label for="city">City:</label></td>
                                <td><input class="formInput" type="text" id="city" name="city" placeholder="Enter City" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="postCode">Postcode:</label></td>
                                <td><input class="formInput" type="text" id="postCode" name="postCode" minlength="4" maxlength="5" placeholder="Enter Post Code" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="state">State/Territory:</label></td>
                                <td><input class="formInput" type="text" id="state" name="state" minlength="2" maxlength="3" pattern="[A-Z]*" title="Please use state abbreviation, i.e. 'NSW','SA'" placeholder="Enter State" required></input></td>
                            </tr>
                            <tr>
                                <td><label for="phoneNum">Phone Number:</label></td>
                                <td><input class="formInput" type="text" id="phoneNum" name="phoneNum" minlength="7" maxlength="15" placeholder="Enter Phone Number"></input></td>
                            </tr>
                            <tr>
                                <td><label for="tos">Agree to TOS*:</label></td>
                                <td>
                                    <select class="formInput" id="tos" name="tos">
                                        <option value="no">No</option> 
                                        <option value="yes">Yes</option>
                                    </select>
                                    <a href="./tos.html" target="popup" onclick="window.open('./tos.html','popup','width=600,height=400'); return false;">Read the TOS</a>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                        <h3>Note: fields marked with * are mandatory</h3>
                    <table class="buttonTable">
                        <input type="submit" id="register" class="submit" name="register" value="Register"></input>
                        <a class="submit" href="./index.jsp">Cancel</a>
                    </table>
                </form>
            </div>
        </main>
    </body>