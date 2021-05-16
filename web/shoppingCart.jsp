/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
<%@page import="isd.iotbay.model.dao.OrderLineDBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="isd.iotbay.model.OrderLine"%>
<%@page import="isd.iotbay.model.Orders"%>
<%@page import="isd.iotbay.model.Product"%>
<% 
    Orders order = (Orders)session.getAttribute("order");
    ArrayList<OrderLine> orderLines = (ArrayList<OrderLine>) session.getAttribute("orderLines");
    request.setAttribute("orderLines", orderLines);
    session.setAttribute("orderLines", orderLines);
            %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <title>Shopping Cart</title>     
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
        <h1>View Cart</h1>
        <table>
                <tr>
                    <th>Product Name</th>
                    <th></th>
                    <th>Quantity</th>
                    <th></th>
                    <th>Total Price</th>
                </tr>
        <c:forEach items="${orderLines}" var="orderLine">
            
            <tr>
                <td>${orderLine.productName}</td> 
                <td>
                    <form method="post" action="QuantityUp">
                    <input type="hidden" name="orderLineID" value="${orderLine.orderlineID}">
                    <input type="hidden" name="productID" value="${orderLine.productID}">
                    <input type="submit" value="Up">
                    </form>
                    </td>                
                <td>${orderLine.quantity}</td>
                <td><form method="post" action="QuantityDown">
                    <input type="hidden" name="orderLineID" value="${orderLine.orderlineID}">
                    <input type="hidden" name="productID" value="${orderLine.productID}">
                    <input type="submit" value="Down">
                    </form></td>
                <td>${orderLine.totalPrice}</td>
            </tr>
            
            
        </c:forEach>
            <tr></tr>
            <tr>
                <td>Total Price:</td>
                <td>${order.totalPrice}<td>
            </tr>
            <tr>
                <td>Tax: </td>
                <td>${order.tax}</td>
            </tr>
            </table>
            <% 
            session.setAttribute("totalPrice", order.getTotalPrice());
            session.setAttribute("tax", order.getTax());
            %>
        <form action="ShippingServlet" method="post">
            <input type="submit" value="Continue to Shipping">
        </form>
    </body>
</html>