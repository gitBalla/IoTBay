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
        <jsp:include page="./navBar.jsp" flush="true"/>
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
                <a class="formButton" href="editPayment.jsp">Edit my Payment Details</a>
                <a class="formButton" href="DeletePaymentServlet">Delete my Payment Details</a>
                <a class="formButton" href="SubmitPaymentServlet">Submit Payment</a>
            </table>
        </div>
    </body>
</html>
