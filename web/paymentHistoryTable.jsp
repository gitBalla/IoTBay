<%@page import="isd.iotbay.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Payment History Table</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
          href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
          rel="stylesheet"
        />
    </head>
    <body onload="resetSearchTable()">
        <table class="displayTable long" id="userLogTable">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Amount</th>
                    <th>Method</th>
                    <th>Card Number</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${paymentHistory}">
                <tr>
                    <td><c:out value="${item.payEmail}" /></td>
                    <td><c:out value="${item.payDate}" /></td>
                    <td><c:out value="$${item.payAmount}" /></td>
                    <td><c:out value="${item.payMethod}" /></td>
                    <td><c:out value="${item.ccNumber}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
