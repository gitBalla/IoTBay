
package isd.iotbay.controller;
 

import java.sql.*;

import java.util.*;

import java.util.logging.*;


import isd.iotbay.model.Payment;

import isd.iotbay.model.dao.*;

public class TestDB_Payment {

    private static Scanner in = new Scanner(System.in);



    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("Payment method: ");

            String method = in.nextLine();

            System.out.print("Payment amount: ");

            int amount = Integer.parseInt(in.nextLine());

            System.out.print("Payment date: ");

            String payDate = in.nextLine();
            
            System.out.print("CreditCard Number: ");

            int ccNumber = Integer.parseInt(in.nextLine());
            
            System.out.print("CreditCard Expiry: ");

            String ccExp = in.nextLine();
            
            System.out.print("CreditCard Security: ");

            int ccSecurity = Integer.parseInt(in.nextLine());
            
            System.out.print("Payment Email: ");

            String payEmail = in.nextLine();
            
            System.out.print("Order ID: ");

            int orderID = Integer.parseInt(in.nextLine());

            db.addPayment( method, ccNumber, ccExp, ccSecurity, payEmail, amount, payDate, orderID );

            System.out.println("Payment is added to the database.");
            
            connector.closeConnection();

        }  catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB_Payment.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}