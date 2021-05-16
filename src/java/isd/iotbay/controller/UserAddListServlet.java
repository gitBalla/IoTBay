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
import isd.iotbay.model.Product;
import isd.iotbay.model.User;
import isd.iotbay.model.dao.DBManager;
import java.util.ArrayList;

/**
 *
 * @author reeve
 */

public class UserAddListServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //5- retrieve the manager instance from session
        DBManager manager= (DBManager) session.getAttribute("manager");
        ArrayList<User> users = null;
        
        try {
            users = manager.fetchUsers();
            if(users != null) {
                //13-save the object to the session
                session.setAttribute("users",users);
                //14- send table to jsp
                request.getRequestDispatcher("userAddList.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "Does not exist");
                request.getRequestDispatcher("userAddList.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String userFirstName = request.getParameter("fName");
            String userLastName = request.getParameter("lName");
            String userAddressLine1 = request.getParameter("address1");
            String userAddressLine2 = request.getParameter("address2");
            String userCity = request.getParameter("city");
            String userState = request.getParameter("state");
            String userPostCode = request.getParameter("postCode");
            String userPhoneNum = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            boolean userIsStaff = request.getParameter("isStaff").equals("staff")?true:false;
            boolean userIsAdmin = request.getParameter("isStaff").equals("staff")?false:true;
            DBManager manager= (DBManager)session.getAttribute("manager");
            manager.addUser(email, userFirstName, userLastName, password, userAddressLine1, userAddressLine2, 
                    userCity, userState, userPostCode, userPhoneNum, userIsStaff, userIsAdmin);
            request.getRequestDispatcher("admin.jsp").include(request, response);
            
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("admin.jsp").include(request, response);
        }
    }
}