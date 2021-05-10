/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblUser;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import phatvh.ultilities.DBHelper;

/**
 *
 * @author ASUS
 */
public class tblUserDAO implements Serializable {

    public boolean checkLogin(String username, String password) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select userID "
                        + "from tblUser "
                        + "where userID = ? and password=? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

    public String getLastName(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String fullname = "";
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select fullname "
                        + "from tblUser "
                        + "where userID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                rs = pst.executeQuery();
                if(rs.next()){
                    fullname = rs.getString("fullname");
                    return fullname;
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
    
    public boolean getRole(String username) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean role;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select isAdmin "
                        + "from tblUser "
                        + "where userID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                rs = pst.executeQuery();
                if(rs.next()){
                    role = rs.getBoolean("isAdmin");
                    return role;
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public tblUserDTO getInfo(String username) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select fullname, phoneNo, email "
                        + "from tblUser "
                        + "where userID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, username);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String phone = rs.getString("phoneNo");
                    String mail = rs.getString("email");
                    tblUserDTO dto = new tblUserDTO(fullname, phone, mail);
                    return dto;
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
        return null;
    }
}
