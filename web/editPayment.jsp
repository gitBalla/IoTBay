
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Payment Details</title>
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
    </head>
    <%
      User user = (User)session.getAttribute("user");
      Payment payment = (Payment)session.getAttribute("payment");
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
                <li><a href="./logout.jsp">Logout</a></li>
                <%
                    } else {
                %>
                <li><a href="./registration.jsp">Register</a></li>
                <li><a href="./login.jsp">Login</a></li>
                <%
                    }
                %>
                <li><a href="CatalogueServlet">Browse Catalogue</a></li>
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
    <h1 class="main_title">Edit ${payment.payMethod} Details</h1>
    <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span></div>
    <form class="user_access_form" action="EditPaymentServlet" method="post">
        <fieldset>
            <table>
                <tr>
                    <td><label for="ccNumber">Card Number*:</label></td>
                    <td><input class="formInput" type="text" id="ccNumber" name="ccNumber" value="${payment.ccNumber}" required></input></td>
                </tr>
                <tr>
                    <td><label for="ccExpiry">Expiry Date*:</label></td>
                    <td><input class="formInput" type="text" id="ccExpiry" name="ccExpiry" value="${payment.ccNumber}" required></input></td>
                </tr>                    
                <tr>
                    <td><label for="ccSecurity">Security Code*:</label></td>
                    <td><input class="formInput" type="text" id="ccSecurity" name="ccSecurity" value="${payment.ccNumber}" required></input></td>
                </tr>
                <tr>
                    <td><label for="paymentEmail">Payment Email*:</label></td>
                    <td><input class="formInput" type="text" id="paymentEmail" name="paymentEmail" value="${payment.ccNumber}" required></input></td>
                </tr>
            </table>
        </fieldset>
        <table class="buttonTable">
            <button class="submit" name="paymentMethod" value="Credit Card" type="submit">Update</button>
        </table>
    </form>
  </body>
</html>