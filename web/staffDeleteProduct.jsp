<%-- 
    Document   : staffDeleteProduct
    Created on : 16/05/2021, 8:03:13 PM
    Author     : hamartillano
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete Product</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
          href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
          rel="stylesheet"
        />
    </head>
    <%
        User user = (User) session.getAttribute("user");
        Product product = (Product) session.getAttribute("product");
        boolean deleted = Boolean.parseBoolean(request.getParameter("deleted"));
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
                    <li><a href="LogoutServlet">Logout</a></li>
                    <%
                        } else {
                    %>
                    <li><a href="./registration.jsp">Register</a></li>
                    <li><a href="./login.jsp">Login</a></li>
                    <%
                        }
                    %>
                    <li><a href='./catalogue.jsp'>Browse Catalogue</a></li>
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
        <main>
            <div>
                <h1 class="main_title">Delete Inventory Item</h1>
                <form class="user_access_form" action="DeleteProductServlet" method="post">
                    <fieldset>
                        <legend>Item to delete:</legend>
                        <label for="productid">Product ID: </label>
                        <input class="formInput" type="text" id="productid" name="productid" required>
                        <p>Are you sure you want to delete this item?</p>
                    </fieldset>
                    <table class="buttonTable">
                        <input type="submit" id="delete" class="submit" name="delete" value="delete"></input></a>
                        <a class="submit" href="./staff.jsp">Go Back</a>
                    </table>
                </form>
            </div>
        </main>
    </body>
</html>
