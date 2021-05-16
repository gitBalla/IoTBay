<%-- 
    Document   : staffAddProduct
    Created on : 16/05/2021, 11:26:31 AM
    Author     : hamartillano
--%>

<%@page import="isd.iotbay.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <title>Add Product to Catalogue</title>
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
              <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
              <li><a href="LogoutServlet">Logout</a></li>
              <li><a href="CatalogueServlet">Browse Catalogue</a></li>
              <li><a href="./staff.jsp"> Staff Menu</a></li>
                <%
                if(user.isAdmin()) {
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
            <form action="AddProductServlet" method="post">
                <table>
                    <tr>
                        <td>
                            <label for name="productid">Product ID: </label>
                        </td>
                        <td>
                            <input type="text" id="productid" name="productid" required><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for name="productname">Product Name: </label>
                        </td>
                        <td>
                            <input type="text" id="productname" name="productname" required><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for name="description">Description: </label>
                        </td>
                        <td>
                            <input type="text" id="description" name="description" required><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for name="price">Product Price: </label>
                        </td>
                        <td>
                            <input type="text" id="price" name="price" required><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for name="stock">Available Stock: </label>
                        </td>
                        <td>
                            <input type="text" id="stock" name="stock" required><br>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="Add New Product">
            </form>
            <br>
                <a href="./staff.jsp">Back to Staff Menu</a>
            <br>
        </main>
    </body>
</html>