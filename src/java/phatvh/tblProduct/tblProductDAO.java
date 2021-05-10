/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblProduct;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import phatvh.ultilities.DBHelper;

/**
 *
 * @author ASUS
 */
public class tblProductDAO implements Serializable {

    private ArrayList<tblProductDTO> listProduct;
    private ArrayList<String> listProductCate;
    private ArrayList<tblProductDTO> allProduct;

    public ArrayList<String> loadProductCate() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select categoryName "
                        + "from tblCategory ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String categoryName = rs.getString("categoryName");
                    if (listProductCate == null) {
                        listProductCate = new ArrayList();
                    }
                    listProductCate.add(categoryName);
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
        return listProductCate;
    }

    public ArrayList<tblProductDTO> loadSearchCateValue(String query) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = query;
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String imageProduct = rs.getString("imageProduct");
                    String nameProduct = rs.getString("nameProduct");
                    String description = rs.getString("descriptionProduct");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String invalidDate = rs.getString("invalidDate");
                    boolean status = rs.getBoolean("status");
                    String nameCategory = rs.getString("categoryName");
                    tblProductDTO dto = new tblProductDTO(productID, imageProduct, nameProduct, description, price, quantity, createDate, invalidDate, status, nameCategory);
                    if (listProduct == null) {
                        listProduct = new ArrayList();
                    }
                    listProduct.add(dto);
                }
                return listProduct;
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

    public int countPage(String query) throws SQLException, NamingException {
        int count = 0;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = query;
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    count = rs.getInt(1);
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
        return count;
    }

    public tblProductDTO getInfoProduct(String productID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select productID, imageProduct, nameProduct, descriptionProduct, price, quantity, createDate, invalidDate, status,categoryName "
                        + "from tblProduct a join tblCategory b on a.categoryID = b.categoryID "
                        + "where productID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, productID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String proID = rs.getString("productID");
                    String imgPro = rs.getString("imageProduct");
                    String namePro = rs.getString("nameProduct");
                    String descript = rs.getString("descriptionProduct");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String invalidDate = rs.getString("invalidDate");
                    boolean status = rs.getBoolean("status");
                    String nameCate = rs.getString("categoryName");
                    tblProductDTO dto = new tblProductDTO(proID, imgPro, namePro, descript, price, quantity, createDate, invalidDate, status, nameCate);
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

    public ArrayList<tblProductDTO> getAllProduct() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select productID, imageProduct, nameProduct, descriptionProduct, price, quantity, createDate, invalidDate, status,categoryName "
                        + "from tblProduct a join tblCategory b on a.categoryID = b.categoryID ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String proID = rs.getString("productID");
                    String imgPro = rs.getString("imageProduct");
                    String namePro = rs.getString("nameProduct");
                    String descript = rs.getString("descriptionProduct");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String invalidDate = rs.getString("invalidDate");
                    boolean status = rs.getBoolean("status");
                    String nameCate = rs.getString("categoryName");
                    if (allProduct == null) {
                        allProduct = new ArrayList<>();
                    }
                    tblProductDTO dto = new tblProductDTO(proID, imgPro, namePro, descript, price, quantity, createDate, invalidDate, status, nameCate);
                    allProduct.add(dto);
                }
                return allProduct;
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

    public void updateQuantity(String idProduct, int quantity) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "update tblProduct "
                        + "set quantity = ? "
                        + "where productID = ? ";
                pst = con.prepareStatement(sql);
                pst.setInt(1, quantity);
                pst.setString(2, idProduct);
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

    public String getMaxPrice() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String max = "";
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select MAX(price) "
                        + "from tblProduct ";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    max = rs.getString(1);
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
        return max;
    }

    public ArrayList<tblProductDTO> getProductManage(String query) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = query;
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String proID = rs.getString("productID");
                    String imgPro = rs.getString("imageProduct");
                    String namePro = rs.getString("nameProduct");
                    String descript = rs.getString("descriptionProduct");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String createDate = rs.getString("createDate");
                    String invalidDate = rs.getString("invalidDate");
                    boolean status = rs.getBoolean("status");
                    String nameCate = rs.getString("categoryName");
                    if (allProduct == null) {
                        allProduct = new ArrayList<>();
                    }
                    tblProductDTO dto = new tblProductDTO(proID, imgPro, namePro, descript, price, quantity, createDate, invalidDate, status, nameCate);
                    allProduct.add(dto);
                }
                return allProduct;
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

    public String getIdCate(String cateName) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select categoryID "
                        + "from tblCategory "
                        + "where categoryName like ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + cateName + "%");
                rs = pst.executeQuery();
                if (rs.next()) {
                    String idCate = rs.getString("categoryID");
                    return idCate;
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

    public void updateItem(String name, String description, float price, int quantity, String nameCate, String status, String invalidDate, String idPro) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "update tblProduct "
                        + "set nameProduct = ?, descriptionProduct = ?, price = ?, quantity = ?, categoryID = ?, status = ?, invalidDate = ? "
                        + "where productID = ? ";
                pst = con.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, description);
                pst.setFloat(3, price);
                pst.setInt(4, quantity);
                pst.setString(5, nameCate);
                pst.setString(6, status);
                pst.setString(7, invalidDate);
                pst.setString(8, idPro);
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

    public void AddItem(String image, String name, String description, String price, String quantity, String createDate, String invalidDate, String IdCate) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "insert into tblProduct(imageProduct,nameProduct,descriptionProduct,price,quantity, createDate, invalidDate, categoryID,status)\n"
                        + "values(?,?,?,?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, image);
                pst.setString(2, name);
                pst.setString(3, description);
                pst.setString(4, price);
                pst.setString(5, quantity);
                pst.setString(6, createDate);
                pst.setString(7, invalidDate);
                pst.setString(8, IdCate);
                pst.setBoolean(9, true);
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

    public int getIdHighest() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "select productID "
                        + "from tblProduct "
                        + "where productID >= all (select productID from tblProduct)";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    id = rs.getInt("productID");
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
        return id;
    }

    public void removeItem(String id) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "update tblProduct "
                        + "set status = 0 "
                        + "where productID = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, id);
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
