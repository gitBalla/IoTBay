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
import isd.iotbay.model.dao.DBManager;

import java.time.LocalDate;    

public class EditPaymentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        HttpSession session = request.getSession();
        Payment payment = (Payment)session.getAttribute("payment");
        Order order = (Order)session.getAttribute("order");
        String paymentMethod = request.getParameter("paymentMethod");
        int ccNumber = Integer.parseInt(request.getParameter("ccNumber"));
        String ccExpiry = request.getParameter("ccExpiry");
        int ccSecurity = Integer.parseInt(request.getParameter("ccSecurity"));
        String paymentEmail = request.getParameter("paymentEmail");
        float paymentAmount = payment.getPayAmount();
        String paymentDate = payment.getPayDate();
        int orderID = order.getOrderID();

        DBManager manager= (DBManager) session.getAttribute("manager");

        try {   
            if (payment != null) {
                manager.updatePayment(paymentMethod, ccNumber,  ccExpiry,  ccSecurity, paymentEmail, paymentAmount, paymentDate, orderID);
                payment = manager.findPayment(orderID);
                session.setAttribute("payment", payment);
                request.getRequestDispatcher("paymentDetails.jsp").include(request, response);
            } else {                    
                request.getRequestDispatcher("paymentDetails.jsp").include(request, response);
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}