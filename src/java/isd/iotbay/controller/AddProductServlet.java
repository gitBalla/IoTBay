package isd.iotbay.controller;

import isd.iotbay.model.dao.DBConnector;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import isd.iotbay.model.dao.DBManager;

/**
 *
 * @author homer martillano
 */

public class AddProductServlet extends HttpServlet {
    private DBManager manager;
    private DBConnector Connector;
    
    @Override //Create and instance of DBConnector for the deployment session
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        //catch exceptions for the DBConnector
        try {
            Connector = new DBConnector();
        } catch (ClassNotFoundException | SQLException ex){
            java.util.logging.Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        
        //catch exceptions for the DBManager
        try {       
            manager = new DBManager(Connector.openConnection());  
        } catch (SQLException ex){
            java.util.logging.Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
                
        //collected parameters from the AddNewItem.jsp
        Integer productid = Integer.parseInt(request.getParameter("productid"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Float price = Float.parseFloat(request.getParameter("price"));
        Integer stock = Integer.parseInt(request.getParameter("stock"));
           
        try {
            if (name != null) {
                manager.addProduct(productid, name, description, price, stock);
                session.setAttribute("added", "Item has been added");
                request.getRequestDispatcher("staffAddProduct.jsp").include(request, response);
                response.sendRedirect("staffAddProduct.jsp");
            } else {
                session.setAttribute("added", "Item has not been added");
                request.getRequestDispatcher("staffAddProduct.jsp").include(request, response);
            }

        } catch (SQLException ex){
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}