<%-- 
    Document   : userAccessLogs
    Created on : 26/04/2021, 1:56:57 AM
    Author     : johnballa
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.UserLog"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <script type="text/javascript" src="./javascript/IoTBayJS.js"></script>
  </head>
  <%
      String existErr = (String) session.getAttribute("existErr");
  %>
  <body onload="resetSearchTable()">
    <header>
    <jsp:include page="./navBar.jsp" flush="true"/>
    </header>
    <main>
      <h1 class="main_title">Access Logs</h1>
      <div class="landing_body"><span class="message"> <%= (existErr != null ? existErr : "")%></span>
        <label class="user_access_form">Search Log Entries:</label>
        <input class="formInput" type="text" name="logSearchInput" id="logSearchInput" onkeyup="searchLogTable()" placeholder="Enter date"></input>
        <div class="overflowTable">
            <jsp:include page="./userLogTable.jsp" flush="true"/>
        </div>
        <table class="buttonTable">
          <a class='formButton' href="./account.jsp">View Account</a>
          <a class='formButton' href="LogoutServlet">Logout</a>
        </table>
      </div>
    </main>
  </body>
</html>
