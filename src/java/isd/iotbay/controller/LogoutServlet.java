package isd.iotbay.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import isd.iotbay.model.dao.DBManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import isd.iotbay.model.User;

/**
 *
 * @author johnballa
 */

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession(false);
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager)session.getAttribute("manager");
        
        User user = null;
        
        try {       
            if(session != null) {
                //get user from session
                user = (User) session.getAttribute("user");
                
                if(user != null) {
                    //update the userlog that there has been an logout
                    manager.addUserLog(user.getUserID(), "LOGOUT");
                    //16- invalidate session and redirect to logout.jsp       
                    session.invalidate();
                } else {
                //16- invalidate session anyway       
                session.invalidate();
                }
            }
            //16- redirect to logout.jsp since either way   
            request.getRequestDispatcher("logout.jsp").include(request,response);
        } catch (SQLException ex) {           
              Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }        
    }
}
