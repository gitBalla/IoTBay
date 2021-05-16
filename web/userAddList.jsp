<%-- 
    Document   : catalogue
    Created on : 27/04/2021, 4:49:12 PM
    Author     : reeve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="isd.iotbay.model.User"%>
<%@page import="isd.iotbay.model.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="iotbayStyle.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto&amp;display=swap"
            rel="stylesheet"
        />
        <title>IoT Bay User Add</title>
    </head>
    <body>
        <header>
        <jsp:include page="./navBar.jsp" flush="true"/>
        </header>
        <main>
            <h1 class="main_title">Add User</h1>
            <form class="user_access_form" action="UserAddListServlet" method="post">
                <fieldset>
                    <legend>User Details:</legend>
                    <table>
                        <tr>
                            <td><label for="email">Email</label></td>
                            <td><input class="formInput" type="email" name="email"></input></td>
                        </tr>
                        <tr>
                            <td><label for="fName">First Name</label></td>
                            <td><input class="formInput" type="text" name="fName"></input></td>
                        </tr>
                        <tr>
                            <td><label for="lName">Last Name</label></td>
                            <td><input class="formInput" type="text" name="lName"></input></td>
                        </tr>
                        <tr>
                            <td><label for="password">Password</label></td>
                            <td><input class="formInput" type="text" name="password"></input></td>
                        </tr>
                        <tr>
                            <td><label for="address1">Address Line 1</label></td>
                            <td><input class="formInput" type="text" name="address1"></input></td>
                        </tr>
                        <tr>
                            <td><label for="address2">Address Line 2</label></td>
                            <td><input class="formInput" type="text" name="address2"></input></td>
                        </tr>
                        <tr>
                            <td><label for="city">City</label></td>
                            <td><input class="formInput" type="text" name="city"></input></td>
                        </tr>
                        <tr>
                            <td><label for="state">State</label></td>
                            <td><input class="formInput" type="text" name="state"></input></td>
                        </tr>
                        <tr>
                            <td><label for="postCode">Post Code</label></td>
                            <td><input class="formInput" type="text" name="postCode"></input></td>
                        </tr>
                        <tr>
                            <td><label for="phone">Phone</label></td>
                            <td><input class="formInput" type="text" name="phone"></input></td>
                        </tr>
                        <tr>
                            <td><label for="staff">Is Staff</label></td>
                            <td><input type="radio" id="staff" name="isStaff" value="staff"></input></td>
                        </tr>
                        <tr>
                            <td><label for="admin">Is Admin</label></td>
                            <td><input type="radio" id="admin" name="isStaff" value="admin"></input></td>
                        </tr>
                    </table>
                </fieldset>
                    <table class="buttonTable">
                        <input type="submit" id="add" class="submit" name="submit" value="Add"></input>
                        <a class="submit" href="./staff.jsp">Cancel</a>
                    </table>
            </form>
        </main>
    </body>
</html>
