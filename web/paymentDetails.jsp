<%-- 
    Document   : payment_test.jsp
    Created on : 15/05/2021, 4:12:55 PM
    Author     : vince
--%>
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Details</title>
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
        Payment payment = (Payment)session.getAttribute("payment");
        String paymentMethod = request.getParameter("paymentMethod");
        String ccNumber = request.getParameter("ccNumber");
        String ccExpiry = request.getParameter("ccExpiry");
        String ccSecurity = request.getParameter("ccSecurity");
        String paymentEmail = request.getParameter("paymentEmail");
        String paymentAmount = request.getParameter("paymentAmount");
        String paymentDate = request.getParameter("paymentDate");
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
          <li><a href="LogoutServlet">Logout</a></li>
          <%
              } else {
          %>
          <li><a href="./registration.jsp">Register</a></li>
          <li><a href="./login.jsp">Login</a></li>
          <%
              }
          %>
          <li><a href="CatalogueServlet">Browse Catalogue</a></li>
          <li><a href="CheckoutServlet">Checkout</a></li>
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
        <div class="landing_body">
            <h1>Your Email is ${payment.payEmail}</h1>
            <h1>Your payment date is ${payment.payDate}</h1>
            <h1>Your payment amount is ${payment.payAmount}</h1>
            <h1>Your method is ${payment.payMethod}</h1>
            <h1>Your number is ${payment.ccNumber}</h1>
            <h1>Your expiry is ${payment.ccExp}</h1>
            <h1>Your security is ${payment.ccSecurity}</h1> 
            <table class="buttonTable">
                <a class="formButton" href="editPayment">Edit my Payment Details</a>
                <a class="formButton" href="deletePayment">Delete my Payment Details</a>
                <a class="formButton" href="submitPayment">Submit Payment</a>
            </table>
        </div>
    </body>
</html>
