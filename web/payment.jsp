<%-- 
    Document   : payment.jsp
    Created on : 28/04/2021, 1:37:35 PM
    Author     : vince
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
  </head>
  <%
      User user = (User)session.getAttribute("user");
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
          <li><a>Account</a></li>
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
    <script type="text/javascript">
        function showMe() {
            if (document.getElementById('creditcardButton').checked) {
                document.getElementById('creditcard-details').style.display = 'block';
                document.getElementById('bankaccount-details').style.display = 'none';
                document.getElementById('paypal-details').style.display = 'none';
            } else if (document.getElementById('bankaccount').checked) {
                document.getElementById('creditcard-details').style.display = 'none';
                document.getElementById('bankaccount-details').style.display = 'block';
                document.getElementById('paypal-details').style.display = 'none';
            } else if (document.getElementById('paypal').checked) {
                document.getElementById('creditcard-details').style.display = 'none';
                document.getElementById('bankaccount-details').style.display = 'none';
                document.getElementById('paypal-details').style.display = 'block';
            }
        }
    </script>
    <h1 class="main_title">Select your payment method</h1>
    <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span></div>
    <div class="landing_body">
        <input type="radio" onclick="showMe()" id="creditcardButton" name="paymentmethod" value="creditcardButton">
        <label for="creditcardButton">Credit Card</label>
        <input type="radio" onclick="showMe()" id="bankaccount" name="paymentmethod" value="bankaccount">
        <label for="bankaccount">Bank Account</label>
        <input type="radio" onclick="showMe()" id="paypal" name="paymentmethod" value="paypal">
        <label for="paypal">PayPal</label>
    </div>
    <form class="user_access_form" id="creditcard-details" action="PaymentServlet" method="post" style="display:none">
        <fieldset>
            <table>
                <tr>
                    <td><label for="ccNumber">Card Number*:</label></td>
                    <td><input class="formInput" type="text" id="ccNumber" name="ccNumber" placeholder="Enter Card Number" required></input></td>
                </tr>
                <tr>
                    <td><label for="ccExpiry">Expiry Date*:</label></td>
                    <td><input class="formInput" type="text" id="ccExpiry" name="ccExpiry" placeholder="Enter Expiry Date" required></input></td>
                </tr>                    
                <tr>
                    <td><label for="ccSecurity">Security Code*:</label></td>
                    <td><input class="formInput" type="text" id="ccSecurity" name="ccSecurity" placeholder="Enter Security Code" required></input></td>
                </tr>
                <tr>
                    <td><label for="paymentEmail">Payment Email*:</label></td>
                    <td><input class="formInput" type="text" id="paymentEmail" name="paymentEmail" placeholder="Enter Email" required></input></td>
                </tr>
                <tr>
                    <td><label for="paymentAmount">Placeholder Amount*:</label></td>
                    <td><input class="formInput" type="text" id="paymentAmount" name="paymentAmount" placeholder="Enter Amount" required></input></td>
                </tr>
                <tr>
                    <td><label for="orderID">Placeholder Order ID* (21-25):</label></td>
                    <td><input class="formInput" type="text" id="orderID" name="orderID" placeholder="Enter orderID" required></input></td>
                </tr>
            </table>
        </fieldset>
        <table class="buttonTable">
            <button class="submit" name="paymentMethod" value="Credit Card" type="submit">Pay</button>
        </table>
    </form>
    <div class="landing_body" id="bankaccount-details" style="display:none">
        <h1>Iteration 2</h1>
    </div>
    <div class="landing_body" id="paypal-details" style="display:none">
        <h1>Iteration 2</h1>
    </div>
  </body>
</html>