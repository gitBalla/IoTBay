<%-- 
    Document   : payment.jsp
    Created on : 28/04/2021, 1:37:35 PM
    Author     : vince
--%>

<%@page import="isd.iotbay.model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Payment</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./iotbayStyle.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
      rel="stylesheet"
    />
  </head>
  <%
      Customer customer = (Customer)session.getAttribute("customer");
  %>
  <body>
    <header>
      <nav>
        <ul class="menu">
          <li><a href="./index.jsp">Home</a></li>
          <%
              if (customer != null) {
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
          <li><a href="./catalogue.jsp">Browse Catalogue</a></li>
          <div class="search-container">
            <form action="">
              <button type="submit">Submit</button>
              <input id="searchbar" type="text" placeholder="Search.." />
            </form>
          </div>
        </ul>
      </nav>
    </header>
    <h1>Select your payment method</h1>
    <script type="text/javascript">
        function showMe() {
            if (document.getElementById('mastercard').checked) {
                document.getElementById('mastercard-details').style.display = 'block';
                document.getElementById('bankaccount-details').style.display = 'none';
                document.getElementById('paypal-details').style.display = 'none';
            } else if (document.getElementById('bankaccount').checked) {
                document.getElementById('mastercard-details').style.display = 'none';
                document.getElementById('bankaccount-details').style.display = 'block';
                document.getElementById('paypal-details').style.display = 'none';
            } else if (document.getElementById('paypal').checked) {
                document.getElementById('mastercard-details').style.display = 'none';
                document.getElementById('bankaccount-details').style.display = 'none';
                document.getElementById('paypal-details').style.display = 'block';
            }
        }
    </script>
    <form action="POST">
        <input type="radio" onclick="showMe()" id="mastercard" name="paymentmethod" value="mastercard">
        <label for="mastercard">MasterCard</label>
        <input type="radio" onclick="showMe()" id="bankaccount" name="paymentmethod" value="bankaccount">
        <label for="bankaccount">Bank Account</label>
        <input type="radio" onclick="showMe()" id="paypal" name="paymentmethod" value="paypal">
        <label for="paypal">PayPal</label>
        <div id="mastercard-details" style="display:none">
            <h1>placeholder 1</h1>
        </div>
        <div id="bankaccount-details" style="display:none">
            <h1>placeholder 2</h1>
        </div>
        <div id="paypal-details" style="display:none">
            <h1>placeholder 3</h1>
        </div>
    </form>
  </body>
</html>