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
        Product product = (Product)session.getAttribute("product");
                
        //collected parameters from the AddNewItem.jsp
        Integer productid = Integer.parseInt(request.getParameter("productid"));
        
        try {
            if(productid != 0) {
                manager.deleteProduct(productid);
                request.getSession().removeAttribute("product");
                request.getRequestDispatcher("staffDeleteProduct.jsp").include(request, response);
            }
        } catch (SQLException ex){
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}