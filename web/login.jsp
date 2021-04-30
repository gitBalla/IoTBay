<%-- 
    Document   : login.jsp
    Created on : 27/03/2021, 3:55:59 PM
    Author     : johnballa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <header>
        <nav>
            <ul class="menu">
                <li><a href="./index.jsp">Home</a></li>
                <li><a href="./registration.jsp">Register</a></li>
                <li><a href="./login.jsp">Login</a></li>
                <li><a href="catalogue.jsp">Browse Catalogue</a></li>
                <div class="search-container">
                    <form action="">
                        <button type="submit">Submit</button>
                        <input id="searchbar" type="text" placeholder="Search.." />
                    </form>
                </div>
            </ul>
        </nav>
    </header>
    <body>
        <form class="user_access_form" action="./welcome.jsp" method="post">
            <fieldset>
                <legend>IoTBay Account Login</legend>
                <table>
                    <tr>
                        <td><label for="email">Email:</label></td>
                        <td><input type="email" id="email" name="email"></input></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password:</label></td>
                        <td><input type="password" id="password" name="password"></input></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" id="login" class="submit" name="login" value="Login"></input>
                            <a class="submit" href="./index.jsp">Cancel</a>
                        </td>
                    </tr>
                </table>
                <!-- following values to be removed once database is linked -->
                <input type="hidden" name="firstname" value="John">
                <input type="hidden" name="lastname" value="Smith">
                <input type="hidden" name="addressline1" value="12345 Wallaby Lane">
                <input type="hidden" name="addressline2" value="">
                <input type="hidden" name="city" value="Ultimo">
                <input type="hidden" name="state" value="NSW">
                <input type="hidden" name="postcode" value="2000">
                <input type="hidden" name="tos" value="yes">
            </fieldset>
        </form>
    </body>
</html>
