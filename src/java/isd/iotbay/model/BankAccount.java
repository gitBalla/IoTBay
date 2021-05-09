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
public class BankAccount extends Payment {
    private int bsbNumber;

    public int getBsbNumber() {
        return bsbNumber;
    }

    public void setBsbNumber(int bsbNumber) {
        this.bsbNumber = bsbNumber;
    }

    public BankAccount(int bsbNumber, String payMethod, int payAmount, String payDate) {
        super(payMethod, payAmount, payDate);
        this.bsbNumber = bsbNumber;
    }
}
