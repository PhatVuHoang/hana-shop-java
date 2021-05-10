/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblUser;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class tblUserDTO implements Serializable {

    private String fullname;
    private String phone;
    private String email;

    public tblUserDTO(String fullname, String phone, String email) {
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
