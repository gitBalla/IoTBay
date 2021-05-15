package isd.iotbay.controller;

import isd.iotbay.model.User;
import isd.iotbay.model.dao.DBManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author johnballa
 */

public class DeleteAccountServlet extends HttpServlet {
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
                    //delete the user and userlog (userlog first to avoid FK restraint error)
                    manager.deleteUserLog(user.getUserID());
                    manager.deleteUser(user.getUserID());
                    boolean deleted = true;
                    //16- invalidate session and redirect to deleteAccount.jsp       
                    session.invalidate();
                    //use request dispatcher in this way to pass name after logout for goobye message (not in cleartext either)
                    RequestDispatcher requestdispatcher = getServletContext().getRequestDispatcher("/deleteAccount.jsp?deleted="+deleted);
                    requestdispatcher.forward(request, response);
                } else {
                    //16- return with user not valid error
                    session.setAttribute("deleted",false);
                    session.setAttribute("existErr","Error: User does not exist, try logging in again.");
                    request.getRequestDispatcher("deleteAccount.jsp").include(request,response);
                    request.getSession().removeAttribute("deleted");
                    request.getSession().removeAttribute("existErr");
                }
            } else {
            //16- redirect to index if session is not valid 
            request.getRequestDispatcher("index.jsp").include(request,response);
            }
        } catch (SQLException ex) {           
              Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }   
    }
}
