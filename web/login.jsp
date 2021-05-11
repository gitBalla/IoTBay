<%-- 
    Document   : login.jsp
    Created on : 27/03/2021, 3:55:59 PM
    Author     : johnballa
--%>
<%@page import="isd.iotbay.model.User"%>
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
    <%
        String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passErr = (String) session.getAttribute("passErr");            
    %>
    <body>
        <header>
            <nav>
                <ul class="menu">
                    <li><a href="./index.jsp">Home</a></li>
                    <li><a href="./registration.jsp">Register</a></li>
                    <li><a href="./login.jsp">Login</a></li>
                    <li><a href="./catalogue.jsp">Browse Catalogue</a></li>
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
            <h1 class="main_title">IoTBay Account Login</h1>
            <div class="landing_body"><span class="message"> <%=(existErr != null ? existErr : "")%> </span><!-- error messages -->
            <form class="user_access_form" action="LoginServlet" method="post">
                <fieldset>
                    <legend>Login Details:</legend>
                    <table>
                        <tr>
                            <td><label for="email">Email:</label></td>
                            <td><input class="formInput" type="email" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" required id="email" name="email"></input></td>
                        </tr>
                        <tr>
                            <td><label for="password">Password:</label></td>
                            <td><input class="formInput" type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" required id="password" name="password"></input></td>
                        </tr>
                    </table>
                    <input type="hidden" name="tos" value="yes">
                </fieldset>
                    <table class="buttonTable">
                        <input type="submit" id="login" class="submit" name="login" value="Login"></input>
                        <a class="submit" href="./index.jsp">Cancel</a>
                    </table>
            </form>
            </div>
        </main>
    </body>
</html>
