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
        
        Integer productid = Integer.parseInt(request.getParameter("productid"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Float price = Float.parseFloat(request.getParameter("price"));
        Integer stock = Integer.parseInt(request.getParameter("stock"));
        
        
        //4- retrieve the manager instance from session      
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        try {   
            if (productid != 0) {
                //update with updateUser method
                manager.updateProduct(productid, name, description, price, stock);
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
        
        /*
        try{
            Boolean exists = manager.checkItem(oldname); //check if item exists in the Inventory
            if (exists) {
                manager.updateProduct(manager.fetchProductid(oldname), newname, newdescription, newprice, newstock);//update the item
                session.setAttribute("updated", "Item has now been updated"); //success message (no error message)
                request.getRequestDispatcher("staffUpdateProduct.jsp").include(request, response); //request coming from updateItem.jsp
                response.sendRedirect("staffUpdateProduct.jsp");//user is redirected back to this page with the success
            }
            else {
                session.setAttribute("updated", "Item has not been updated");//error message if item is not found in the Inventory
                request.getRequestDispatcher("staffUpdateProduct.jsp").include(request, response);//request is from updateItem.jsp
                response.sendRedirect("staffUpdateProduct.jsp");//user is redirected back to the page with the error message displayed
            }  
        } catch (SQLException ex) {
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());//SQL error is printed should an error occur
        }
        */
    }
}