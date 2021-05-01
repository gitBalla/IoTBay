package isd.iotbay.model.dao;

/**
 *
 * @author johnballa
 */

import isd.iotbay.model.User;
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
            String userFirstName = rs.getString(3);
            String userLastName = rs.getString(4);
            String userAddressLine1 = rs.getString(6);
            String userAddressLine2 = rs.getString(7);
            String userCity = rs.getString(8);
            String userState = rs.getString(9);
            String userPostCode = rs.getString(10);
            String userPhoneNum = rs.getString(11);
            return new User(userEmail, userFirstName, userLastName, userPass, 
                    userAddressLine1, userAddressLine2, userCity, userState, 
                    userPostCode, userPhoneNum);
        }
    }
    return null;   
}

//Add a user-data into the database   
public void addUser(String email, String name, String password, String gender, String favcol) throws SQLException {                   
    //code for add-operation       
  st.executeUpdate("sql query");   

}

//update a user details in the database   
public void updateUser( String email, String name, String password, String gender, String favcol) throws SQLException {       
   //code for update-operation   

}       

//delete a user from the database   
public void deleteUser(String email) throws SQLException{       
   //code for delete-operation   

}


 

}