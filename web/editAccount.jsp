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
      String updated = request.getParameter("updated");
  %>
  <body>
    <header>
      <nav>
        <ul class="menu">
          <li><a href="./index.jsp">Home</a></li>
          <li><a href="./account.jsp">Account</a></li>
          <li><a href="./logout.jsp">Logout</a></li>
          <li><a href="catalogue.jsp">Browse Catalogue</a></li>
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
      <div class="landing_body">
        <form class="user_access_form" action="./editAccount.jsp" method="post">
            <fieldset>
                <legend>My Account Details: <span> <%= (updated != null) ? "NOW UPDATED!":""  %> </span></legend>
                <table>
                    <tr>
                        <td><label for="firstname">First Name*:</label></td>
                        <td><input type="text" id="firstname" name="firstname" value="${user.firstName}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="lastname">Last Name*:</label></td>
                        <td><input type="text" id="lastname" name="lastname" value="${user.lastName}" required></input></td>
                    </tr>                    
                    <tr>
                        <td><label for="email">Email*:</label></td>
                        <td><input type="email" id="email" name="email" value="${user.email}"></input></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password*:</label></td>
                        <td><input type="password" id="password" name="password" value="${user.password}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline1">Address Line 1:</label></td>
                        <td><input type="text" id="addressline1" name="addressline1" value="${user.addressLine1}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="addressline2">Address Line 2:</label></td>
                        <td><input type="text" id="addressline2" name="addressline2" value="${user.addressLine2}"></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">City:</label></td>
                        <td><input type="text" id="city" name="city" value="${user.city}" required></input></td>
                    </tr>
                    <tr>
                        <td><label for="city">Postcode:</label></td>
                        <td><input type="number" id="postcode" name="postcode" value="${user.postCode}" minlength="4" maxlength="5" required></input></td>
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
                            <a class="submit" href="./account.jsp">Go Back</a>
                            <input type="submit" id="update" class="submit" name="update" value="Update"></input></a>
                            <input type="hidden" id="updated" name="updated" value="updated">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
        <%
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String addressline1 = request.getParameter("addressline1");
            String addressline2 = request.getParameter("addressline2");
            String city = request.getParameter("city");
            String postcode = request.getParameter("postcode");
            String state = request.getParameter("state");
            String phoneNum = request.getParameter("phoneNum");
            user = new User(email, firstname, lastname, password, addressline1, addressline2, city, state, postcode, phoneNum);
            session.setAttribute("user", user);
        %>
      </div>
    </main>
  </body>
</html>