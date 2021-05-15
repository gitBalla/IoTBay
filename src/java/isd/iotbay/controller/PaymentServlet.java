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
import isd.iotbay.model.Payment;
import isd.iotbay.model.dao.DBManager;

import java.time.LocalDate;    

public class PaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class    
        //Validator validator = new Validator();
        //3- capture the posted email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum      
        String paymentMethod = request.getParameter("paymentMethod");
        int ccNumber = Integer.parseInt(request.getParameter("ccNumber"));
        String ccExpiry = request.getParameter("ccExpiry");
        int ccSecurity = Integer.parseInt(request.getParameter("ccSecurity"));
        String paymentEmail = request.getParameter("paymentEmail");
        int paymentAmount = Integer.parseInt(request.getParameter("paymentAmount"));
        String paymentDate = LocalDate.now().toString();
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        //5- clear validator
        //validator.clear(session);
        

        try {   
            //6- find user by email and password
            Payment payment = manager.findPayment(orderID);    
            if (payment != null) {
                //15-set user already exist error to the session           
                //session.setAttribute("existErr","Payment already exists in our database.");
                //16- redirect user back to the login.jsp       
                request.getRequestDispatcher("payment.jsp").include(request, response);
            } else {                    
                //create a new student
                manager.addPayment(paymentMethod, ccNumber, ccExpiry, ccSecurity, paymentEmail, paymentAmount, paymentDate, orderID);
                //get actual user that was just created in DB
                payment = manager.findPayment(orderID);
                //13-save the logged in user object to the session           
                session.setAttribute("payment", payment);
                //14- redirect user to the main.jsp     
                request.getRequestDispatcher("payment_test.jsp").include(request, response);
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
