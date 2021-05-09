<%-- 
    Document   : userLogTable
    Created on : 09/05/2021, 7:50:08 PM
    Author     : johnballa
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="isd.iotbay.model.UserLog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>View Access Logs</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
          href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
          rel="stylesheet"
        />
    </head>
    <%
      ArrayList<UserLog> userLogs = (ArrayList)session.getAttribute("userLog");
    %>
    <body>
        <table class="displayTable">
            <thead>
                <tr>
                    <th>Event</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${userLogs}">
                <tr>
                    <td><c:out value="${item.logEvent}" /></td>
                    <td><c:out value="${item.currentDate}" /></td>
                    <td><c:out value="${item.currentTime}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
