<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment History</title>
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
        <h1 class="main_title">Payment History</h1>
        <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <table class="displayTable">
                <thead>
                    <tr>
                        <th>Event</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${paymentHistory}">
                    <tr>
                        <td><c:out value="${item.payMethod}" /></td>
                        <td><c:out value="${item.payDate}" /></td>
                        <td><c:out value="$${item.payAmount}" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <table class="buttonTable">
              <a class='formButton' href="./account.jsp">View Account</a>
              <a class='formButton' href="LogoutServlet">Logout</a>
            </table>
        </div>
    </body>
</html>