package isd.iotbay.controller;

/**
 *
 * @author johnballa
 */
import java.sql.*;
import java.util.*;
import java.util.logging.*;
import isd.iotbay.model.dao.*;
import isd.iotbay.model.User;

 


public class TestDB_User {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

        DBConnector connector = new DBConnector();

        Connection conn = connector.openConnection();

        DBManager db = new DBManager(conn);



        System.out.print("User email: ");

        String email = in.nextLine();

//        System.out.print("User first name: ");
//
//        String firstName = in.nextLine();
//        
//        System.out.print("User last name: ");
//
//        String lastName = in.nextLine();
//
        System.out.print("User password: ");

        String password = in.nextLine();
//
//        System.out.print("User address line 1: ");
//
//        String addressLine1 = in.nextLine();
//
//        System.out.print("User address line 2: ");
//
//        String addressLine2 = in.nextLine();
//        
//        System.out.print("User city: ");
//
//        String city = in.nextLine();
//        
//        System.out.print("User state: ");
//
//        String state = in.nextLine();
//        
//        System.out.print("User post code: ");
//
//        String postCode = in.nextLine();
//        
//        System.out.print("User phone number: ");
//
//        String phoneNum = in.nextLine();
//
//        db.addUser(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum);
//
//        System.out.println("User is added to the database.");
        User user = db.findUser(email, password);
        System.out.println("User: " + user.getFirstName() + user.getLastName());

        connector.closeConnection();



        } catch (ClassNotFoundException | SQLException ex) {

        Logger.getLogger(TestDB_User.class.getName()).log(Level.SEVERE, null, ex);

        }

    }
        
}
