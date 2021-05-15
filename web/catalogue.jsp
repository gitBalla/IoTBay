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
            <nav>
              <ul class="menu">
                <li><a href="./index.jsp">Home</a></li>
                <%
                    if (user != null) {
                %>
                <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
                <li><a href="./logout.jsp">Logout</a></li>
                <%
                    } else {
                %>
                <li><a href="./registration.jsp">Register</a></li>
                <li><a href="./login.jsp">Login</a></li>
                <%
                    }
                %>
                <li><a href="CatalogueServlet">Browse Catalogue</a></li>
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
        <main><span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <div>
                <table class="displayTable">
                    <c:forEach var="item" items="${products}">
                        <tr>
                            <td><c:out value="${item.name}" /></td>
                            <td><c:out value="${item.description}" /></td>
                            <td><c:out value="$${item.price}" /></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </main>
    </body>
</html>
