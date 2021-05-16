<%-- 
    Document   : staffEditProduct
    Created on : 16/05/2021, 3:28:52 PM
    Author     : hamartillano
--%>

<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
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
        Product product = (Product)session.getAttribute("product");
        String updated = (String)session.getAttribute("updated");
    %>
    <body>
        <header>
            <nav>
              <ul class="menu">
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./account.jsp">${user.firstName}'s Account</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
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
        <main>
            <h1 class="main_title">Edit Product Details</h1>
            <div class="landing_body"><span class="message"> <%= (updated != null ? updated : "" )%></span>
              <form class="staff_edit_product_form" action="UpdateProductServlet" method="post">
                  <fieldset>
                    <legend>Current Product Details:</legend>
                    <table>
                        <tr>
                            <td><label for="oldName">Current Product Name:</label></td>
                            <td><input id="oldName" name="oldName" value="${product.getName()}"></td>
                        </tr>
                        <tr>
                            <td><label for="id">Product ID:</label></td>
                            <td><input type="text" id="id" name="id" value="${product.id}" required></input></td>
                        </tr>
                        <tr>
                            <td><label for="name">Product Name:</label></td>
                            <td><input type="text" id="name" name="name" value="${product.name}" required></input></td>
                        </tr>                    
                        <tr>
                            <td><label for="description">Product Description:</label></td>
                            <td><input type="description" id="email" name="description" value="${product.description}" required></input></td>
                        </tr>
                        <tr>
                            <td><label for="price">Product Price:</label></td>
                            <td><input type="price" id="price" name="price" value="${product.price}" required></input></td>
                        </tr>
                        <tr>
                            <td><label for="stock">Product Stock:</label></td>
                            <td><input type="stock" id="stock" name="stock" value="${product.stock}" required></input></td>
                        </tr>
                    </table>
                </fieldset>
                <table class="buttonTable">
                    <input type="submit" id="update" class="submit" name="update" value="Update"></input></a>
                    <a class="submit" href="./staff.jsp">Go Back</a>
                </table>
                </form>
            </div>
        </main>
    </body>
</html>