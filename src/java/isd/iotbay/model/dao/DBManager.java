package isd.iotbay.model.dao;

/**
 *
 * @author johnballa
 */

import isd.iotbay.model.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/* 
* DBManager is the primary DAO class to interact with the database. 
*/

public class DBManager {

private Statement st;
   
public DBManager(Connection conn) throws SQLException {       
   st = conn.createStatement();   
}

//Find user by email and password in the database   
public User findUser(String email, String password) throws SQLException {       
    //setup the select sql query string   
    String fetch = "SELECT * FROM IOTBAYUSER.USER_T WHERE EMAIL = '" + email + "' AND PASSWORD= '" + password + "'";
    //execute this query using the statement field and add the results to a ResultSet       
    ResultSet rs = st.executeQuery(fetch);
    //search the ResultSet for a user using the parameters
    while(rs.next()) {
        String userEmail = rs.getString(2);//number is the order of the field in the database
        String userPass = rs.getString(5);//so password is the 5th field
        if(userEmail.equals(email) && userPass.equals(password)) {
            int userID = rs.getInt(1);
            String userFirstName = rs.getString(3);
            String userLastName = rs.getString(4);
            String userAddressLine1 = rs.getString(6);
            String userAddressLine2 = rs.getString(7);
            String userCity = rs.getString(8);
            String userState = rs.getString(9);
            String userPostCode = rs.getString(10);
            String userPhoneNum = rs.getString(11);
            boolean userIsStaff = rs.getBoolean(12);
            boolean userIsAdmin = rs.getBoolean(13);
            return new User(userID, userEmail, userFirstName, userLastName, userPass, 
                    userAddressLine1, userAddressLine2, userCity, userState, 
                    userPostCode, userPhoneNum, userIsStaff, userIsAdmin);
        }
    }
    return null;   
}

//Add a user-data into the database   
public void addUser(String email, String firstName, String lastName, String password, String addressLine1, String addressLine2, String city, String state, String postCode, String phoneNum) throws SQLException {                   
    //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.USER_T(EMAIL,FIRSTNAME,LASTNAME,PASSWORD,ADDRESS1,ADDRESS2,CITY,STATELOC,POSTCODE,PHONE,IS_STAFF,IS_ADMIN) " 
            + "VALUES ('" + email + "', '" + firstName + "', '" + lastName + "', '" + password + "', '" + addressLine1 + "', '" + addressLine2 + "', '" + city + "', '" + state + "', '" + postCode + "', '" + phoneNum + "', '" + false + "', '" + false + "')");   

}

//update a user details in the database   
public void updateUser(String email, String firstName, String lastName, String password, String addressLine1, String addressLine2, String city, String state, String postCode, String phoneNum, boolean isStaff, boolean isAdmin, String currentEmail) throws SQLException {       
    //code for update-operation   
    st.executeUpdate("UPDATE IOTBAYUSER.USER_T SET EMAIL='" + email + "', FIRSTNAME='" + firstName + "', LASTNAME='" + lastName + "', PASSWORD='" + password + "', ADDRESS1='" + addressLine1 + "', ADDRESS2='" + addressLine2 + "', CITY='" + city + "', STATELOC='" + state + "', POSTCODE='" + postCode + "', PHONE='" + phoneNum + "', IS_STAFF='" + isStaff + "', IS_ADMIN='" + isAdmin + "' WHERE EMAIL='" + currentEmail + "'");
}

//delete a user from the database   
public void deleteUser(int userID) throws SQLException{       
    //code for delete-operation
    st.executeUpdate("DELETE FROM IOTBAYUSER.USER_T WHERE USERID=" + userID);
}

public ArrayList<User> fetchUsers() throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.USER_T";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<User> temp = new ArrayList();
    
    while(rs.next()) {
        int userID = rs.getInt(1);
        String userEmail = rs.getString(2);
        String userPass = rs.getString(5);
        String userFirstName = rs.getString(3);
        String userLastName = rs.getString(4);
        String userAddressLine1 = rs.getString(6);
        String userAddressLine2 = rs.getString(7);
        String userCity = rs.getString(8);
        String userState = rs.getString(9);
        String userPostCode = rs.getString(10);
        String userPhoneNum = rs.getString(11);
        boolean userIsStaff = rs.getBoolean(12);
        boolean userIsAdmin = rs.getBoolean(13);
        temp.add(new User(userID, userEmail, userFirstName, userLastName, userPass, 
                    userAddressLine1, userAddressLine2, userCity, userState, 
                    userPostCode, userPhoneNum, userIsStaff, userIsAdmin));
        }
    return temp; 
}

public boolean checkUser(String email) throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.USER_T WHERE EMAIL = '" + email + "'";
    ResultSet rs = st.executeQuery(fetch);
    
    while(rs.next()) {
        String userEmail = rs.getString(2);
        if(userEmail.equals(email)) {
            return true;
        }
    }
    return false;   
}

//Add a user log entry into the database   
public void addUserLog(Integer userID, String logEvent) throws SQLException {                   
    //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.USER_LOG_T(USERID,LOGEVENT) "
            + "VALUES (" + userID + ", '" + logEvent + "')");
}

//delete a user from the database   
public void deleteUserLog(int userID) throws SQLException{       
    //code for delete-operation
    st.executeUpdate("DELETE FROM IOTBAYUSER.USER_LOG_T WHERE USERID=" + userID);
}

public ArrayList<UserLog> fetchUserLogs(int userID) throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.USER_LOG_T WHERE USERID=" + userID;
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<UserLog> temp = new ArrayList();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); //date converter in
    SimpleDateFormat newFormatter = new SimpleDateFormat("dd MMM yyyy"); //date converter out
    
    while(rs.next()) {
        String currentDate = rs.getString(3);
        try { //try date conversion on currentDate
            currentDate = newFormatter.format(formatter.parse(currentDate));
        } catch (ParseException ex) {
            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        String currentTime = rs.getString(4);
        String logEvent = rs.getString(5);
        temp.add(new UserLog(currentDate,currentTime,logEvent));
        }
    return temp; 
}

public Payment findPayment(int order) throws SQLException {       
    //setup the select sql query string       
    String fetch = "SELECT * FROM IOTBAYUSER.PAYMENT_T WHERE ORDERID = " + order + "";
    //execute this query using the statement field
    //add the results to a ResultSet   
    ResultSet rs = st.executeQuery(fetch);
    //search the ResultSet for a user using the parameters

    while (rs.next()) {
        int orderID = rs.getInt(9);
        if (orderID == order) {
            String paymentMethod = rs.getString(2);
            int ccNumber = rs.getInt(3);
            String ccExpiry = rs.getString(4);
            int ccSecurity = rs.getInt(5);
            String paymentEmail = rs.getString(6);
            int paymentAmount = rs.getInt(7);
            String paymentDate = rs.getString(8);
            return new Payment(paymentMethod, ccNumber, ccExpiry, ccSecurity, paymentEmail, paymentAmount, paymentDate, orderID);
        }
    }
    return null;   
}


public void addPayment(String method, int ccNumber, String ccExp, int ccSecurity, String payEmail, int amount, String date, int orderID) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.PAYMENT_T(PAYMETHOD, CCNUMBER, CCEXP, CCSECURITY, PAYEMAIL, PAYAMOUNT, PAYDATE, ORDERID) " 
            + "VALUES ('" + method + "', " + ccNumber + ", '" + ccExp + "', " + ccSecurity + ", '" + payEmail + "', " + amount + ", '" + date + "', " + orderID + ")");
}

public void updatePayment(String method, int ccNumber, String ccExp, int ccSecurity, String payEmail, int amount, String date, int orderID) throws SQLException {       
    st.executeUpdate("UPDATE IOTBAYUSER.PAYMENT_T SET PAYMETHOD='" + method + "', CCNUMBER=" + ccNumber + ", CCEXP='" + ccExp + "', CCSECURITY=" + ccSecurity + ", PAYEMAIL='" + payEmail + "', PAYAMOUNT=" + amount + ", PAYDATE='" + date + "', ORDERID=" + orderID + " WHERE ORDERID=" + orderID + "");
}

public void deletePayment(int orderID) throws SQLException{       
    st.executeUpdate("DELETE FROM IOTBAYUSER.PAYMENT_T WHERE ORDERID=" + orderID + "");
}

public ArrayList<Payment> fetchPayments(int userid) throws SQLException{
    String fetch = "SELECT * FROM PAYMENT_T " +
                   "LEFT JOIN ORDER_T ON PAYMENT_T.ORDERID=ORDER_T.ORDERID " +
                   "LEFT JOIN USER_T ON ORDER_T.USERID=USER_T.USERID " +
                   "WHERE ORDER_T.USERID = " + userid + "";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<Payment> temp = new ArrayList();
    
    while(rs.next()) {
        String paymentMethod = rs.getString(2);
        int ccNumber = rs.getInt(3);
        String ccExpiry = rs.getString(4);
        int ccSecurity = rs.getInt(5);
        String paymentEmail = rs.getString(6);
        int paymentAmount = rs.getInt(7);
        String paymentDate = rs.getString(8);
        int orderID = rs.getInt(9);
        temp.add(new Payment(paymentMethod, ccNumber, ccExpiry, ccSecurity, paymentEmail, paymentAmount, paymentDate, orderID));
    }
    return temp; 
}

public Order latestOrder() throws SQLException {       
    //setup the select sql query string       
    String fetch = "SELECT MAX(ORDERID) FROM ORDER_T";
    //execute this query using the statement field
    //add the results to a ResultSet   
    ResultSet rs = st.executeQuery(fetch);
    //search the ResultSet for a user using the parameters

    if(rs.next()) {
        int orderID = rs.getInt(1);
        return new Order(orderID); 
    }
    return null;
}

public void addOrder() throws SQLException {
    st.executeUpdate("INSERT INTO ORDER_T(USERID) VALUES (NULL)");
}

public void addOrder(int userID) throws SQLException {
    st.executeUpdate("INSERT INTO ORDER_T(USERID) VALUES (" + userID + ")");
}


//Add a product-data into the database   
public void addProduct(int productID, String name, String description, float price, int stock) throws SQLException {                   
    //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.PRODUCT_T(PRODUCTID,NAME,DESCRIPTION,PRICE,STOCK) " 
            + "VALUES (" + productID + ", '" + name + "', '" + description + "', " + price + ", " + stock + ")");   

}

//update a product details in the database   
public void updateProduct(int productID, String name, String description, float price, int stock) throws SQLException {       
    //code for update-operation   
    st.executeUpdate("UPDATE IOTBAYUSER.PRODUCT_T SET PRODUCTID=" + productID + ", NAME='" + name + "', DESCRIPTION='" + description + "', PRICE=" + price + ", STOCK=" + stock + "");
}

//delete a product from the database   
public void deleteProduct(int productID) throws SQLException{       
    //code for delete-operation
    st.executeUpdate("DELETE FROM IOTBAYUSER.PRODUCT_T WHERE PRODUCTID=" + productID + "");
}

public ArrayList<Product> fetchProducts() throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.PRODUCT_T";
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<Product> temp = new ArrayList();
    
    while(rs.next()) {
        int productid = rs.getInt("productid");
        String name = rs.getString("name");
        String description = rs.getString("description");
        float price = rs.getFloat("price");
        int stock = rs.getInt("stock");
        temp.add(new Product(productid, name, description, price, stock));
    }
    return temp; 
}

}