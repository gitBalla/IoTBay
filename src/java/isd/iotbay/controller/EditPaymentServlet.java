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
        Validator validator = new Validator();
        Payment payment = (Payment)session.getAttribute("payment");
        Order order = (Order)session.getAttribute("order");
        String paymentMethod = request.getParameter("paymentMethod");
        String ccNumber = request.getParameter("ccNumber");
        String ccExpiry = request.getParameter("ccExpiry");
        String ccSecurity = request.getParameter("ccSecurity");
        String paymentEmail = request.getParameter("paymentEmail");
        String paymentAmount = request.getParameter("paymentAmount");
        String paymentDate = payment.getPayDate();
        int orderID = order.getOrderID();
        
        //validator.clear(session);

        DBManager manager= (DBManager) session.getAttribute("manager");
        if (!validator.validateEmail(paymentEmail)) { /*7-   validate email  */
            //8-set incorrect email error to the session           
            session.setAttribute("emailErr","Error: Email format incorrect");
            //9- redirect user back to the registration.jsp
            request.getRequestDispatcher("editPayment.jsp").include(request, response);
            request.getSession().removeAttribute("emailErr");
            request.getSession().removeAttribute("intErr");
        } else if (!validator.validateInteger(ccNumber)) { /*10-   validate password  */
            //11-set incorrect password error to the session           
            session.setAttribute("intErr","Error: Card Number format incorrect");
            //12- redirect user back to the registration.jsp          
            request.getRequestDispatcher("editPayment.jsp").include(request, response);
            request.getSession().removeAttribute("emailErr");
            request.getSession().removeAttribute("intErr");
        } else if (!validator.validateInteger(ccSecurity)) { /*10-   validate password  */
            //11-set incorrect password error to the session           
            session.setAttribute("intErr","Error: Security format incorrect");
            //12- redirect user back to the registration.jsp          
            request.getRequestDispatcher("editPayment.jsp").include(request, response);
            request.getSession().removeAttribute("emailErr");
            request.getSession().removeAttribute("intErr");
        } else if (!validator.validateInteger(paymentAmount)) { /*10-   validate password  */
            //11-set incorrect password error to the session           
            session.setAttribute("intErr","Error: Amount format incorrect");
            //12- redirect user back to the registration.jsp          
            request.getRequestDispatcher("editPayment.jsp").include(request, response);
            request.getSession().removeAttribute("emailErr");
            request.getSession().removeAttribute("intErr");
        } else {
            try {   
                if (payment != null) {
                    manager.updatePayment(paymentMethod, Integer.parseInt(ccNumber), ccExpiry, Integer.parseInt(ccSecurity), paymentEmail, Float.parseFloat(paymentAmount), paymentDate, orderID);
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
}