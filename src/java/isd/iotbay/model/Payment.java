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
    protected String payMethod;
    int payAmount;
    protected String payDate;

    public Payment(String payMethod, int payAmount, String payDate) {
        this.payMethod = payMethod;
        this.payAmount = payAmount;
        this.payDate = payDate;
    }

    public int getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(int payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }
}
