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
        //3- make a student object
        User user = new User(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum);      
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        try {   
            if (user != null) {
                //5- save the logged in user object to the session           
                session.setAttribute("user",user);
                //6- update with updateStudent method
                manager.updateUser(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum);
                session.setAttribute("updated", " Update was successful.");
                //7- redirect user back to edit.jsp     
                request.getRequestDispatcher("editAccount.jsp").include(request, response);
            } else {
                //8-send update failure message           
                session.setAttribute("updated"," Update was not successful.");
                //9- redirect user back to the edit.jsp       
                request.getRequestDispatcher("editAccount.jsp").include(request, response);
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
        response.sendRedirect("editAccount.jsp");
    }
}
