<%-- 
    Document   : editAccount
    Created on : 26/04/2021, 2:20:26 AM
    Author     : johnballa
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Edit Account</title>
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
      String updated = (String)session.getAttribute("updated");
  %>
  <body>
    <header>
      <nav>
        <ul class="menu">
          <li><a href="./index.jsp">Home</a></li>
          <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
          <li><a href="LogoutServlet">Logout</a></li>
          <li><a href="catalogue.jsp">Browse Catalogue</a></li>
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
      <h1 class="main_title">Edit Account Details</h1>
      <div class="landing_body"><span class="message"> <%= (updated != null ? updated : "" )%></span>
        <form class="user_access_form" action="UpdateServlet" method="post">
            <fieldset>
                <legend>My Account Details:</legend>
                <table>
                    <tr>
                        <td><label for="firstName">First Name*:</label></td>
                        <td><input type="text" id="firstName" name="firstName" value="${user.firstName}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="lastName">Last Name*:</label></td>
                        <td><input type="text" id="lastName" name="lastName" value="${user.lastName}" required></input></td>
                    </tr>                    
                    <tr>
                        <td><label for="email">Email*:</label></td>
                        <td><input type="email" id="email" name="email" value="${user.email}" pattern='([a-zA-Z0-9]+)(([._-])([a-zA-Z0-9]+))*(@)([a-z]+)(.)([a-z]{3})((([.])[a-z]{0,2})*)' title='Please use a valid email address' required></input></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password*:</label></td>
                        <td><input type="password" id="password" name="password" value="${user.password}" pattern='^(?=.*[A-Za-z])(?=.*[0-9]).{5,}$' title='Minimum length 5 characters, including one letter and one number' required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressLine1">Address Line 1:</label></td>
                        <td><input type="text" id="addressLine1" name="addressLine1" value="${user.addressLine1}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressLine2">Address Line 2:</label></td>
                        <td><input type="text" id="addressLine2" name="addressLine2" value="${user.addressLine2}"></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">City:</label></td>
                        <td><input type="text" id="city" name="city" value="${user.city}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="postCode">Postcode:</label></td>
                        <td><input type="number" id="postCode" name="postCode" value="${user.postCode}" minlength="4" maxlength="5" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="state">State/Territory:</label></td>
                        <td><input type="text" id="state" name="state" value="${user.state}" minlength="2" maxlength="3" pattern="[A-Z]*" title="Please use state abbreviation, i.e. 'NSW','SA'" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="phoneNum">Phone Number:</label></td>
                        <td><input type="text" id="phoneNum" name="phoneNum" value="${user.phoneNum}" minlength="7" maxlength="15"></input></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <a class="submit" href="./account.jsp?email='<%= user.getEmail()%>'&password='<%=user.getPassword()%>'">Go Back</a>
                            <input type="submit" id="update" class="submit" name="update" value="Update"></input></a>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
      </div>
    </main>
  </body>
</html>