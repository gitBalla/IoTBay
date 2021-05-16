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
import isd.iotbay.model.Order;
import isd.iotbay.model.User;
import isd.iotbay.model.dao.DBManager;
 

public class CheckoutServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession();
        //2- create an instance of the Validator class    
        //Validator validator = new Validator();
        //3- capture the posted email, firstName, lastName, password, addressLine1, addressLine2, city, state, postCode, phoneNum      
        User user = (User)session.getAttribute("user");
        Order order = (Order)session.getAttribute("order");
        int userID = 1;
        if (user != null) {
            userID = user.getUserID();
        }
        //4- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        int orderID = 1;
        
        try {   
            if (user != null && order == null) {
                manager.addOrder(userID);
                order = manager.latestOrder();
                orderID = order.getOrderID();
                session.setAttribute("order", order);
            } else if (order == null){
                manager.addOrder();
                order = manager.latestOrder();
                orderID = order.getOrderID();
                session.setAttribute("order", order);
            }
        } catch (SQLException ex) {           
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
        
        try {   
            Payment payment = manager.findPayment(orderID);    
            if (payment != null) {
                session.setAttribute("payment", payment);
                request.getRequestDispatcher("payment_test.jsp").include(request, response);
            } else {                    
                request.getRequestDispatcher("payment.jsp").include(request, response);
            } 
        } catch (SQLException ex) {           
            Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}
