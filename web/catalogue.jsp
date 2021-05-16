<%-- 
    Document   : catalogue
    Created on : 27/04/2021, 4:49:12 PM
    Author     : hamartillano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <title>IoT Bay Catalogue</title>
    </head>
    <%
      User user = (User)session.getAttribute("user");
      String existErr = (String) session.getAttribute("existErr");
    %>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <main><span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <div>
                <h1>IoTBay Catalogue</h1>
                <table class="displayTable">
                    <tr>
                        <th>
                            <b>Product Name</b>
                        </th>
                        <th>
                            <b>Product Description</b>
                        </th>
                        <th>
                            <b>Price</b>
                        </th>
                        <th>
                            <b>Stock</b>
                        </th>
                    </tr>
                    <c:forEach var="item" items="${products}">
                        <tr>
                            <td><c:out value="${item.name}" /></td>
                            <td><c:out value="${item.description}" /></td>
                            <td><c:out value="$${item.price}" /></td>
                            <td><c:out value="${item.stock}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>
    </body>
</html>
