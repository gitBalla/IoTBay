package isd.iotbay.controller;

import isd.iotbay.model.Product;
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
import java.util.ArrayList;

/**
 *
 * @author homer martillano
 */

public class DeleteProductServlet extends HttpServlet {
    @Override //Create and instance of DBConnector for the deployment session
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager)session.getAttribute("manager");
        ArrayList<Product> products = null;
                
        //collected parameters from the AddNewItem.jsp
        Integer productid = Integer.parseInt(request.getParameter("productid"));
        
        try {
            products = manager.fetchProducts();
            if(products != null) {
                session.setAttribute("products",products);    
                request.getRequestDispatcher("staffDeleteProduct.jsp").include(request, response);
                
                manager.deleteProduct(productid);
            } else {
                session.setAttribute("delete", "Item has not been delete");
                request.getRequestDispatcher("staffDeleteProduct.jsp").include(request, response);
            }

        } catch (SQLException ex){
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}