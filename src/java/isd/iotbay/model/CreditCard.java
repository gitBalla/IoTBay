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
public class CreditCard extends Payment {
    private String ccType;
    private int ccNumber;
    private String ccExp;
    private int ccSecurity;
    private String payEmail;

    public CreditCard(String ccType, int ccNumber, String ccExp, int ccSecurity, String payEmail, String payMethod) {
        super(payMethod);
        this.ccType = ccType;
        this.ccNumber = ccNumber;
        this.ccExp = ccExp;
        this.ccSecurity = ccSecurity;
        this.payEmail = payEmail;
    }

    public String getCcType() {
        return ccType;
    }

    public void setCcType(String ccType) {
        this.ccType = ccType;
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
}
