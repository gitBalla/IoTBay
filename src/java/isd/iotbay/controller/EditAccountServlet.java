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

public class EditAccountServlet extends HttpServlet {

    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //3- capture the posted email      
        String email = request.getParameter("email");
        //4- capture the posted password    
        String password = request.getParameter("password");
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        User user = null;       

        try {       
            //6- find user by email and password
            user = manager.findUser(email, password);
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }

        if (user != null) {                     
            //13-save the logged in user object to the session           
            session.setAttribute("user",user);
            //14- redirect user back to the edit.jsp     
            request.getRequestDispatcher("editAccount.jsp").include(request, response);
        } else {                       
            //15-set user does not exist error to the session           
            session.setAttribute("existErr","User does not exist in our database.");
            //16- redirect user back to the edit.jsp       
            request.getRequestDispatcher("editAccount.jsp").include(request, response);
        }   
    }
}