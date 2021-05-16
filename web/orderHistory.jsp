<%-- 
    Document   : viewOrderHistory
    Created on : 4 Jun 2020, 1:18:35 pm
    Author     : tayla
--%>

<%@page import="isd.iotbay.model.OrderLine"%>
<%@page import="isd.iotbay.model.dao.OrderLineDBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="isd.iotbay.model.Orders"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Order History</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
    </head>
    <% 
        ArrayList<Orders> orders = (ArrayList<Orders>)session.getAttribute("orders");
        session.setAttribute("orders", orders);
        request.setAttribute("orders", orders);
    %>
    <body>
        <header>
            <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <h1>Order History</h1>
        <form action="GetOrderLines" method="post">
            <table>
                <tr>
                    <td><label for="searchOrderID">Search:</label></td>
                    <td><input type="text" name="searchOrderID"></td>
                    <td><input type="submit" value="Search"></td>
                </tr>
            </table>
        </form>
        <table>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total Price</th>
                </tr>
        <c:forEach items="${orders}" var="order">            
                <tr>
                    <td>${order.orderID}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.totalPrice}</td>
                </tr>
                
            
        </c:forEach>
                </table>
    </body>
</html>