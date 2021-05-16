/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    int orderId = (int) session.getAttribute("orderId");
    int userId = (int) session.getAttribute("userId");
%>

<html>
    <head>
        <title>View Order</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
    </head>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <jsp:include page="/OrderLineServlet" flush="true"/>
        <jsp:useBean id="orderLines" type="java.util.ArrayList" scope="session"/>
        <h1>View Order</h1>
        <c:forEach items="${orderLines}" var="orderLine">
            <tr>
                <td>${orderLine.productName}</td> 
                <td>
                    <form method="post" action="QuantityUp">
                    <input type="hidden" id="orderLineId" value="${orderLine.orderLineId}">
                    <input type="hidden" id="productId" value="${orderLine.productId}">
                    <input type="submit" value="Up">
                    </form>
                    </td>                
                <td>${orderLine.quatity}</td>
                <td><form method="post" action="QuantityDown">
                    <input type="hidden" id="orderLineId" value="${orderLine.orderLineId}">
                    <input type="hidden" id="productId" value="${orderLine.productId}">
                    <input type="submit" value="Up">
                    </form></td>
                <td>${orderLine.totalPrice}</td>
            </tr>
            
        </c:forEach>
            <tr>
                <th>Total Price:</th>
                <th><th>
            </tr>
            
        
</html>