package isd.iotbay.model.dao;

/**
 *
 * @author johnballa
 */

import java.sql.Connection;

/** 
* Super class of DAO classes that stores the database information 
*/

public abstract class DB {   
    protected String URL = "jdbc:derby://localhost:1527/";//replace this string with your jdbc:derby local host url   
    protected String db = "iotbaydb";//name of the database   
    protected String dbuser = "iotbayuser";//db root user   
    protected String dbpass = "antelope"; //db root password   
    protected String driver = "org.apache.derby.jdbc.ClientDriver"; //jdbc client driver - built in with NetBeans   
    protected Connection conn; //connection null-instance to be initialized in sub-classes
}