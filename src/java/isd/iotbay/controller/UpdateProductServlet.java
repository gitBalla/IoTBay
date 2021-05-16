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

/**
 *
 * @author hamartillano
 */

public class UpdateProductServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        HttpSession session = request.getSession();
        
        String oldname = request.getParameter("oldname");
        String newname = request.getParameter("newname");
        String olddescription = request.getParameter("olddescription");
        String newdescription = request.getParameter("newdescription");
        Float oldprice = Float.parseFloat(request.getParameter("oldprice"));
        Float newprice = Float.parseFloat(request.getParameter("newprice"));
        Integer oldstock = Integer.parseInt(request.getParameter("oldstock"));
        Integer newstock = Integer.parseInt(request.getParameter("newstock"));
        
        
        //use the old email/pass to find the user
        User currentUser = (User) session.getAttribute("user");
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");
        
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