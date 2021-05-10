/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.cart;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class CartDTO implements Serializable{
    String nameID;
    String nameProduct;
    int quantity;
    float price;

    public CartDTO(String nameID, String nameProduct, int quantity, float price) {
        this.nameID = nameID;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.price = price;
    }

    public String getNameID() {
        return nameID;
    }

    public void setNameID(String nameID) {
        this.nameID = nameID;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
    
}
