/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblProduct;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class tblProductDTO implements Serializable {

    private String productID;
    private String imageProduct;
    private String productName;
    private String description;
    private float price;
    private int quantity;
    private String createDate;
    private String invalidDate;
    private boolean status;
    private String nameCategory;

    public tblProductDTO(String productID, String imageProduct, String productName, String description, float price, int quantity, String createDate, String invalidDate, boolean status, String nameCategory) {
        this.productID = productID;
        this.imageProduct = imageProduct;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.createDate = createDate;
        this.invalidDate = invalidDate;
        this.status = status;
        this.nameCategory = nameCategory;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getInvalidDate() {
        return invalidDate;
    }

    public void setInvalidDate(String invalidDate) {
        this.invalidDate = invalidDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

}
