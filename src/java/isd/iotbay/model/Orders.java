/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.iotbay.model;

import java.io.Serializable;

public class Orders implements Serializable{
    private static int numberOfOrders = 0;
    private int orderID;
    private int userID;
    private String orderDate;
    private double tax;
    private double totalPrice;
    private String shippingAddress;
    private String billingAddress;
    
    
    public Orders() {
    
    }

    public Orders(int userID) {
        
        this.orderID = Orders.numberOfOrders;
        Orders.numberOfOrders++;
        this.userID = userID;
    }

    public Orders(int orderID, int userID, String orderDate, double tax, double totalPrice, String shippingAddress, String billingAddress) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.tax = tax;
        this.totalPrice = totalPrice;
        this.shippingAddress = shippingAddress;
        this.billingAddress = billingAddress;
    }
    
    
    
    
    public int getOrderID() {
        return orderID;
    }
    
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }


    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTax() {
        return tax;
    }

    public void setTax(double tax) {
        this.tax = tax;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }
    
    public void updatePrice(double price, int quantity) {
        this.totalPrice = this.totalPrice + (price*quantity);
    }
    
    public void deleteOrderLine(double totalPrice) {
        this.totalPrice = this.totalPrice - totalPrice;
    }
}    