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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession(false);
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        User user = null;       

        if(session != null) {
            //get user from session
            user = (User) session.getAttribute("user");

            if (user != null) {                     
                //14- redirect user back to the edit.jsp     
                request.getRequestDispatcher("editAccount.jsp").include(request, response);
            } else {                       
                //16- redirect user back to the index.jsp       
                request.getRequestDispatcher("index.jsp").include(request, response);
            }   
        } else {
            //16- redirect user back to the index.jsp       
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
    }
}