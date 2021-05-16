package isd.iotbay.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import isd.iotbay.model.User;
import isd.iotbay.model.dao.DBManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hamartillano
 */

public class UpdateProductServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        HttpSession session = request.getSession();
        
        Integer tid = Integer.parseInt(request.getParameter("tid"));
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Float price = Float.parseFloat(request.getParameter("price"));
        Integer stock = Integer.parseInt(request.getParameter("stock"));
        
        
        //4- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {   
            if (tid != 0) {
                //update with updateUser method
                manager.updateProduct(id, name, description, price, stock, tid);
                session.setAttribute("updated", "Item has been updated");
                request.getRequestDispatcher("staffUpdateProduct.jsp").include(request, response);
            } else {
                //8-send update failure message           
                session.setAttribute("updated"," Update was not successful.");
                //9- redirect user back to the edit.jsp       
                request.getRequestDispatcher("staffUpdateProduct.jsp").include(request, response);
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}