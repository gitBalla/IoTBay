/**
 *
 * @author hamartillano
 */

package isd.iotbay.controller;

import isd.iotbay.model.dao.DBConnector;
import isd.iotbay.model.dao.DBManager;
import java.sql.*;
import java.util.*;
import java.util.logging.*;

public class TestDB_Catalogue {
    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {
        try {
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            System.out.print("Product ID: ");
            int productID = Integer.parseInt(in.nextLine());

            System.out.print("Product name: ");
            String name = in.nextLine();

            System.out.print("Product description: ");
            String description = in.nextLine();

            System.out.print("Product price: ");
            float price = Integer.parseInt(in.nextLine());
            
            System.out.print("Product stock: ");
            int stock = Integer.parseInt(in.nextLine());

            db.addProduct(productID, name, description, price, stock);
            System.out.println("Product is added to the database.");

            connector.closeConnection();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestDB_Catalogue.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}