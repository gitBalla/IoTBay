package isd.iotbay.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import isd.iotbay.model.Product;
import isd.iotbay.model.dao.DBManager;
import java.util.ArrayList;

/**
 *
 * @author homer martillano
 */

public class ListProductsServlet extends HttpServlet {

    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        ArrayList<Product> products = null;

        try {   
            products = manager.fetchProducts();
            if(products != null) {
                //13-save the object to the session           
                session.setAttribute("products",products);
                //14- send table to jsp     
                request.getRequestDispatcher("staffListProducts.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "Does not exist");
                request.getRequestDispatcher("staffListProducts.jsp").include(request, response);
            }
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
