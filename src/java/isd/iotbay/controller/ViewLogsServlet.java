package isd.iotbay.controller;

import isd.iotbay.model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import isd.iotbay.model.UserLog;
import isd.iotbay.model.dao.DBManager;
import java.util.ArrayList;

/**
 *
 * @author johnballa
 */

public class ViewLogsServlet extends HttpServlet {

    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");
        User user = (User) session.getAttribute("user");
        ArrayList<UserLog> userLogs = null;

        try {   
            userLogs = manager.fetchUserLogs(user.getUserID());
            if(userLogs != null) {
                //13-save the object to the session           
                session.setAttribute("userLogs",userLogs);
                //14- send table to jsp     
                request.getRequestDispatcher("userAccessLogs.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "Error retrieving logs: May not exist");
                request.getRequestDispatcher("userAccessLogs.jsp").include(request, response);
                request.getSession().removeAttribute("existErr");
            }
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}