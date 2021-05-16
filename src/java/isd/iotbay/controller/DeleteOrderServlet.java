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
import isd.iotbay.model.Order;
import isd.iotbay.model.dao.DBManager;

public class DeleteOrderServlet extends HttpServlet {

    @Override   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        //1- retrieve the current session
        HttpSession session = request.getSession(false);
        //5- retrieve the manager instance from session      
        DBManager manager= (DBManager) session.getAttribute("manager");

        Order order = (Order)session.getAttribute("order");
        int orderID = order.getOrderID();

        try {   
            if (order != null) {
                manager.deleteOrder(orderID);
                request.getSession().removeAttribute("order");
                request.getRequestDispatcher("index.jsp").include(request, response);
            } else {                    
                request.getRequestDispatcher("index.jsp").include(request, response);
            }   
        } catch (SQLException ex) {           
            Logger.getLogger(DeleteOrderServlet.class.getName()).log(Level.SEVERE, null, ex);       
        }
    }
}