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
import isd.iotbay.model.dao.DBManager;

/**
 *
 * @author homer martillano
 */

public class AddProductServlet extends HttpServlet {
    @Override //Create and instance of DBConnector for the deployment session
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session      
        DBManager manager = (DBManager)session.getAttribute("manager");
                
        //collected parameters from the AddNewItem.jsp
        Integer productid = Integer.parseInt(request.getParameter("productid"));
        String productname = request.getParameter("productname");
        String description = request.getParameter("description");
        Float price = Float.parseFloat(request.getParameter("price"));
        Integer stock = Integer.parseInt(request.getParameter("stock"));
           
        try {
            if(productname != null) {
                manager.addProduct(productid, productname, description, price, stock);
                session.setAttribute("added", "Item has been added");
                request.getRequestDispatcher("staffAddProduct.jsp").include(request, response);
            } else {
                session.setAttribute("added", "Item has not been added");
                request.getRequestDispatcher("staffAddProduct.jsp").include(request, response);
            }

        } catch (SQLException ex){
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}