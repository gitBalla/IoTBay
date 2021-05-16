<%-- 
    Document   : staff
    Created on : 09/05/2021, 3:17:08 PM
    Author     : johnballa
--%>
<%@page import="isd.iotbay.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff Menu</title>
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
    %>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>    
        <main>
            <%
            if(user.isStaff()) {
            %>
            <h1 class="main_title">Staff Menu</h1>
            <div class="landing_body">
                <table class="buttonTable">
                    <a class='formButton' href="./staffAddProduct.jsp">Add New Product</a>
                    <a class='formButton' href="./staffListProducts.jsp">List Product</a>
                    <a class='formButton' href="./staffUpdateProduct.jsp">Edit Product</a>            
                    <a class='formButton' href="">Delete Product</a>
                </table>
            </div>
            <%
            } else {
            %>
            <h1 class="main_title">UNAUTHORIZED ACCESS</h1>
            <%
            }
            %>
        </main>
    </body>
</html>
