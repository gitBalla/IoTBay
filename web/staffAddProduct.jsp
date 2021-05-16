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
        <title>Add Product</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
          href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
          rel="stylesheet"
        />
    </head>
    <%
        String existErr = (String) session.getAttribute("existErr");
        String added = (String) session.getAttribute("added");
    %>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <main>
            <h1 class="main_title">Add new Product</h1>
            <span class="message"> <%= (existErr != null ? existErr : "")%></span>
            <span class="message"> <%= (added != null ? added : "")%></span>
            <form class="user_access_form" action="AddProductServlet" method="post">
                <fieldset>
                    <legend>Add new Product:</legend>
                    <table>
                        <tr>
                            <td>
                                <label for="productid">Product ID: </label>
                            </td>
                            <td>
                                <input type="text" id="productid" name="productid" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="productname">Product Name: </label>
                            </td>
                            <td>
                                <input type="text" id="productname" name="productname" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="description">Description: </label>
                            </td>
                            <td>
                                <input type="text" id="description" name="description" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="price">Product Price: </label>
                            </td>
                            <td>
                                <input type="text" id="price" name="price" required><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="stock">Available Stock: </label>
                            </td>
                            <td>
                                <input type="text" id="stock" name="stock" required><br>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <table class="buttonTable">
                    <input type="submit" id="add" class="submit" name="add" value="Add"></input></a>
                    <a class="submit" href="./staff.jsp">Go Back</a>
                </table>
            </form>
        </main>
    </body>
</html>
