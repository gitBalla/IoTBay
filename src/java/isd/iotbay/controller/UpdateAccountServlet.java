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
import isd.iotbay.model.User;
import isd.iotbay.model.dao.DBManager;

/**
 *
 * @author johnballa
 */

public class UpdateAccountServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- capture the posted email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postCode = request.getParameter("postCode");
        String phoneNum = request.getParameter("phoneNum");
        //use the old email/pass to find the user
        User currentUser = (User) session.getAttribute("user");
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        try {   
            if (currentUser != null) {
                //update with updateUser method
                manager.updateUser(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum, currentUser.isStaff(), currentUser.isAdmin(), currentUser.getEmail());
                //save the logged in user object to the session 
                currentUser = manager.findUser(email, password);
                session.setAttribute("user",currentUser);
                //update the userlog that there has been an update
                manager.addUserLog(currentUser.getUserID(), "UPDATE");
                session.setAttribute("updated", " Update was successful.");
                //7- redirect user back to edit.jsp     
                request.getRequestDispatcher("editAccount.jsp").include(request, response);
                request.getSession().removeAttribute("updated");
            } else {
                //8-send update failure message           
                session.setAttribute("updated"," Update was not successful.");
                //9- redirect user back to the edit.jsp       
                request.getRequestDispatcher("editAccount.jsp").include(request, response);
                request.getSession().removeAttribute("updated");
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}