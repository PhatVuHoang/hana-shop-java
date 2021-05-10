/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblHistoryModifier;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import phatvh.ultilities.DBHelper;

/**
 *
 * @author ASUS
 */
public class tblHistoryModifierDAO implements Serializable {

    public void insertHistoryModify(String fullname, String dateModify, String action, int idProduct) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into tblHistoryModifier(nameAdmin,dateModify,actionModify,IdProduct) "
                        + "values(?,?,?,?) ";
                pst = con.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, dateModify);
                pst.setString(3, action);
                pst.setInt(4, idProduct);
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
}
