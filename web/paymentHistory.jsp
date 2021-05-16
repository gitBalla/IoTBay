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
        <script type="text/javascript" src="./javascript/IoTBayJS.js"></script>
    </head>
    <%
        User user = (User)session.getAttribute("user");
        String existErr = (String) session.getAttribute("existErr");

    %>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <h1 class="main_title">Payment History</h1>
        <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <input class="formInput" type="text" name="logSearchInput" id="logSearchInput" onkeyup="searchLogTable()" placeholder="Enter date"></input>
            <jsp:include page="./paymentHistoryTable.jsp" flush="true"/>
            <table class="buttonTable">
              <a class='formButton' href="./account.jsp">View Account</a>
              <a class='formButton' href="LogoutServlet">Logout</a>
            </table>
        </div>
    </body>
</html>