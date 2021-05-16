<%-- 
    Document   : product1
    Created on : 27/04/2021, 4:54:38 PM
    Author     : hamartillano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoT Bay ${item.name}</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="collection product">
                    <form action="cart" method="post">
                        <h2>Name: ${item.name}</h2>
                        <h3>Price: ${item.price}</h3>
                        <h3>Stock: ${item.stock}</h3>
                        <h3>Description:</h3>
                            <p>
                                ${item.description}
                            </p>
                        <button type="submit" name="action" value="atc">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
