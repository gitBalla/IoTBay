<%-- 
    Document   : catalogue
    Created on : 27/04/2021, 4:49:12 PM
    Author     : reeve
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
        <title>IoT Bay Catalogue Edit</title>
    </head>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <main>
            <h1 class="main_title">Edit Products</h1>
            <div>
                <table class="displayTable">
                    <tr>
                            <td><c:out value="User ID" /></td>
                            <td><c:out value="Email" /></td>
                            <td><c:out value="First Name" /></td>
                            <td><c:out value="Last Name" /></td>
                            <td><c:out value="Password" /></td>
                            <td><c:out value="Address Line 1" /></td>
                            <td><c:out value="Address Line 2" /></td>
                            <td><c:out value="City" /></td>
                            <td><c:out value="State" /></td>
                            <td><c:out value="Post Code" /></td>
                            <td><c:out value="Phone" /></td>
                            <td><c:out value="Is Staff?" /></td>
                            <td><c:out value="Is Admin?" /></td>
                            <td><c:out value="Action" /></td>
                        </tr>
                    <c:forEach var="item" items="${users}">
                        <tr>
                            <td><c:out value="${item.userID}" /></td>
                            <td><c:out value="${item.email}" /></td>
                            <td><c:out value="${item.firstName}" /></td>
                            <td><c:out value="${item.lastName}" /></td>
                            <td><c:out value="${item.password}" /></td>
                            <td><c:out value="${item.addressLine1}" /></td>
                            <td><c:out value="${item.addressLine2}" /></td>
                            <td><c:out value="${item.city}" /></td>
                            <td><c:out value="${item.state}" /></td>
                            <td><c:out value="${item.postCode}" /></td>
                            <td><c:out value="${item.phoneNum}" /></td>
                            <td><c:out value="${item.staff}" /></td>
                            <td><c:out value="${item.admin}" /></td>
                            <td><a href="EditUserServlet?id=${item.userID}">Edit</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>
    </body>
</html>
