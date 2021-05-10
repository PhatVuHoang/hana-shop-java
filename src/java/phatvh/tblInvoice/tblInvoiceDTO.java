/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.tblInvoice;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class tblInvoiceDTO implements Serializable{
    private String productName;
    private int quantity;
    private float price;
    private String dateOrder;

    public tblInvoiceDTO(String productName, int quantity, float price, String dateOrder) {
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
        this.dateOrder = dateOrder;
    }

    /**
     * @return the productName
     */
    public String getProductName() {
        return productName;
    }

    /**
     * @param productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the dateOrder
     */
    public String getDateOrder() {
        return dateOrder;
    }

    /**
     * @param dateOrder the dateOrder to set
     */
    public void setDateOrder(String dateOrder) {
        this.dateOrder = dateOrder;
    }
    
    
}
