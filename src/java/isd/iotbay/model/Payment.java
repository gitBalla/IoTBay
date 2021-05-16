/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isd.iotbay.model;

/**
 *
 * @author vince
 */
public class Payment implements java.io.Serializable {
    private String payMethod;
    private int ccNumber;
    private String ccExp;
    private int ccSecurity;
    private String payEmail;
    private float payAmount;
    private String payDate;
    private int orderID;

    public Payment(String payMethod, int ccNumber, String ccExp, int ccSecurity, String payEmail, float payAmount, String payDate, int orderID) {
        this.payMethod = payMethod;
        this.ccNumber = ccNumber;
        this.ccExp = ccExp;
        this.ccSecurity = ccSecurity;
        this.payEmail = payEmail;
        this.payAmount = payAmount;
        this.payDate = payDate;
        this.orderID = orderID;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public int getCcNumber() {
        return ccNumber;
    }

    public void setCcNumber(int ccNumber) {
        this.ccNumber = ccNumber;
    }

    public String getCcExp() {
        return ccExp;
    }

    public void setCcExp(String ccExp) {
        this.ccExp = ccExp;
    }

    public int getCcSecurity() {
        return ccSecurity;
    }

    public void setCcSecurity(int ccSecurity) {
        this.ccSecurity = ccSecurity;
    }

    public String getPayEmail() {
        return payEmail;
    }

    public void setPayEmail(String payEmail) {
        this.payEmail = payEmail;
    }

    public float getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(float payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    
}
