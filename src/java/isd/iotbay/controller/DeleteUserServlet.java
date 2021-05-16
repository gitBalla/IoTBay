package isd.iotbay.controller;

import isd.iotbay.model.dao.DBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author reeve
 */

public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession(false);
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager)session.getAttribute("manager");
        
        try {       
            if(session != null) {
                int id = Integer.valueOf(request.getParameter("id"));
                manager.deleteUser(id);
                request.getRequestDispatcher("admin.jsp").include(request, response);
            } else {
            //16- redirect to index if session is not valid 
            request.getRequestDispatcher("index.jsp").include(request,response);
            }
        } catch (SQLException ex) {           
              Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }   
    }
}