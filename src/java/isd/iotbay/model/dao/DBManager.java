package isd.iotbay.model.dao;

/**
 *
 * @author johnballa
 */

import isd.iotbay.model.*;
import java.sql.*;
import java.util.ArrayList;

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
public void updateUser(String email, String firstName, String lastName, String password, String addressLine1, String addressLine2, String city, String state, String postCode, String phoneNum) throws SQLException {       
    //code for update-operation   
    st.executeUpdate("UPDATE IOTBAYUSER.USER_T SET EMAIL='" + email + "', FIRSTNAME='" + firstName + "', LASTNAME='" + lastName + "', PASSWORD='" + password + "', ADDRESS1='" + addressLine1 + "', ADDRESS2='" + addressLine2 + "', CITY='" + city + "', STATELOC='" + state + "', POSTCODE='" + postCode + "', PHONE='" + phoneNum + "' WHERE EMAIL='" + email + "'");
}

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
    //code for delete-operation
    st.executeUpdate("DELETE FROM IOTBAYUSER.USER_T WHERE EMAIL='" + email + "'");
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

public boolean checkUser(String email, String password) throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.USER_T WHERE EMAIL = '" + email + "' AND PASSWORD= '" + password + "'";
    ResultSet rs = st.executeQuery(fetch);
    
    while(rs.next()) {
        String userEmail = rs.getString(2);
        String userPass = rs.getString(5);
        if(userEmail.equals(email) && userPass.equals(password)) {
            return true;
        }
    }
    return false;   
}

//Add a user log entry into the database   
public void addUserLog(Integer userID, String logEvent) throws SQLException {                   
    //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.USER_LOG_T(USERID,LOGEVENT) "
            + "VALUES ('" + userID + "', '" + logEvent + "')");
}

public ArrayList<UserLog> fetchUserLogs(int userID) throws SQLException{
    String fetch = "SELECT * FROM IOTBAYUSER.USER_LOG_T WHERE USERID=" + userID;
    ResultSet rs = st.executeQuery(fetch);
    ArrayList<UserLog> temp = new ArrayList();
    
    while(rs.next()) {
        String currentDate = rs.getString(3);
        String currentTime = rs.getString(4);
        String logEvent = rs.getString(5);
        temp.add(new UserLog(currentDate,currentTime,logEvent));
        }
    return temp; 
}

public CreditCard findPayment(String order) throws SQLException {       
       //setup the select sql query string       
       String fetch = "SELECT * FROM IOTBAYUSER.PAYMENT_T INNER JOIN WHERE ORDERID = '" + order + "'";
       //execute this query using the statement field
       //add the results to a ResultSet   
       ResultSet rs = st.executeQuery(fetch);
       //search the ResultSet for a user using the parameters

       while (rs.next()) {
           String orderID = rs.getString(1);
           if (orderID.equals(order)) {
               String paymentMethod = rs.getString(2);
               int paymentAmount = rs.getInt(3);
               String paymentDate = rs.getString(4);
               String ccType = rs.getString(6);
               int ccNumber = rs.getInt(7);
               String ccExpiry = rs.getString(8);
               int ccSecurity = rs.getInt(9);
               String paymentEmail = rs.getString(10);
               return new CreditCard(ccType, ccNumber, ccExpiry, ccSecurity, paymentEmail, paymentMethod, paymentAmount, paymentDate);
           }
       }
       return null;   
    }


public void addCreditCard(String method, int amount, String date, String ccType, int ccNumber, String ccExp, int ccSecurity, String payEmail) throws SQLException {                   //code for add-operation       
    st.executeUpdate("INSERT INTO IOTBAYUSER.PAYMENT_T(PAYMETHOD, PAYAMOUNT, PAYDATE) VALUES ('" + method + "', " + amount + ", '" + date + "')");
    ResultSet rs = st.executeQuery("SELECT MAX(PAYID) AS id FROM PAYMENT_T");
    rs.next();
    int lastid = rs.getInt("id");
    st.executeUpdate("INSERT INTO IOTBAYUSER.CREDIT_CARD_T(PAYID, CCTYPE, CCNUMBER, CCEXP, CCSECURITY, PAYEMAIL) VALUES (" + lastid + ", '" + ccType + "', " + ccNumber + ", '" + ccExp + "', " + ccSecurity + ", '" + payEmail + "')");
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

}