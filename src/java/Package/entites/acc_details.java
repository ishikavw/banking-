/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Package.entites;

/**
 *
 * @author Adminpc
 */
public class acc_details {
    
    int accountno;
    int Raccountno;
    String name;
    int phone;
    int balance;

    public acc_details() {
    }

    public acc_details(int accountno, int Raccountno,int balance) {
        this.accountno = accountno;
        this.Raccountno = Raccountno;
        this.balance = balance;
    }
    
    public acc_details(int accountno, String name, int phone, int balance) {
        this.accountno = accountno;
        this.name = name;
        this.phone = phone;
        this.balance = balance;
    }



    public int getAccountno() {
        return accountno;
    }

    public void setAccountno(int accountno) {
        this.accountno = accountno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }
    
}
