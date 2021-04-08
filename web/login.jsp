<%-- 
    Document   : login.jsp
    Created on : 27/03/2021, 3:55:59 PM
    Author     : johnballa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
            />
    </head>
    <header>
        <nav>
            <ul class="menu">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="registration.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a>Browse Catalogue</a></li>
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
        <form action="" method="post">
            <fieldset>
                <legend>IoTBay Account Login</legend>
                <table>
                    <tr>
                        <td><label for="loginType">Login Type:</label></td>
                        <td>
                            <select id="loginType" name="loginType">
                                <option value="user">User</option>
                                <option value="staff">Staff</option>                             
                            </select>
                        </td>
                    </tr>
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
                        <td><input type="submit" id="login" name="login" value="Login"></input></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </body>
</html>
