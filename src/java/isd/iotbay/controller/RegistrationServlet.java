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

public class RegistrationServlet extends HttpServlet {
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class    
        Validator validator = new Validator();
        //3- capture the posted email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum      
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
        String tos = request.getParameter("tos");
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        //5- clear validator
        validator.clear(session);

        if (!validator.validateEmail(email)) { /*7-   validate email  */
                 //8-set incorrect email error to the session           
                 session.setAttribute("emailErr","Error: Email format incorrect");
                 //9- redirect user back to the registration.jsp
                 request.getRequestDispatcher("registration.jsp").include(request, response);
        } else if (!validator.validatePassword(password)) { /*10-   validate password  */
                 //11-set incorrect password error to the session           
                 session.setAttribute("passErr","Error: Password format incorrect");
                 //12- redirect user back to the registration.jsp          
                 request.getRequestDispatcher("registration.jsp").include(request, response);
        } else {
                try {   
                    //6- find user by email and password
                    User user = manager.findUser(email, password);      
                    if (user != null) {
                        //15-set user already exist error to the session           
                        session.setAttribute("existErr","User already exists in our database.");
                        //16- redirect user back to the login.jsp       
                        request.getRequestDispatcher("register.jsp").include(request, response);
                    } else {                    
                        //create a new student
                        manager.addUser(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum);
                        user = new User(email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum);
                        //13-save the logged in user object to the session           
                        session.setAttribute("user",user);
                        //14- redirect user to the main.jsp     
                        request.getRequestDispatcher("welcome.jsp").include(request, response);
                    }   
                } catch (SQLException ex) {           
                    Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
                }
        }
    }
}
