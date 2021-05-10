/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblInvoice;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.NamingException;
import phatvh.ultilities.DBHelper;

/**
 *
 * @author ASUS
 */
public class tblInvoiceDAO implements Serializable {

    public void insertInvoice(String fullname, String phone, String email, String address, String dateOrder) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into tblInvoice(fullname,phone,email,address,dateOrder) "
                        + "values (?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, phone);
                pst.setString(3, email);
                pst.setString(4, address);
                pst.setString(5, dateOrder);
                int row = pst.executeUpdate();
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public String getIdInvoice() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String IdInvoice = "";
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select InvoiceID "
                        + "from tblInvoice "
                        + "where InvoiceID >= all(select InvoiceID from tblInvoice) ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    IdInvoice = rs.getString("InvoiceID");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return IdInvoice;
    }

    public void insertInvoiceDetail(String InvoiceID, String productID, String productName, int quantity, float price) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into tblInvoiceDetail(InvoiceID,productID,productName,quantity,price) "
                        + "values (?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, InvoiceID);
                pst.setString(2, productID);
                pst.setString(3, productName);
                pst.setInt(4, quantity);
                pst.setFloat(5, price);
                int row = pst.executeUpdate();
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    ArrayList<tblInvoiceDTO> listInvoice;
    
    public ArrayList<tblInvoiceDTO> getInvoice(String query) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = query;
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while(rs.next()){
                    String proName = rs.getString("productName");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String orderDate = rs.getString("dateOrder");
                    if(listInvoice == null){
                        listInvoice = new ArrayList<>();
                    }
                    tblInvoiceDTO dto = new tblInvoiceDTO(proName, quantity, price, orderDate);
                    listInvoice.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listInvoice;
    }
}
