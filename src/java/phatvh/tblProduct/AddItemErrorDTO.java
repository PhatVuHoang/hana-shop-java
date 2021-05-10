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
public class AddItemErrorDTO implements Serializable{
    String nameProductErr;
    String imgProductErr;
    String descriptionErr;
    String invalidDateErr;
    String invalidDateEmpty;
    String priceIsEmpty;
    String priceErr;
    String quantityIsEmpty;
    String quantityErr;

    public AddItemErrorDTO() {
    }

    public AddItemErrorDTO(String nameProductErr, String imgProductErr, String descriptionErr, String invalidDateErr, String invalidDateEmpty, String priceIsEmpty, String priceErr, String quantityIsEmpty, String quantityErr) {
        this.nameProductErr = nameProductErr;
        this.imgProductErr = imgProductErr;
        this.descriptionErr = descriptionErr;
        this.invalidDateErr = invalidDateErr;
        this.invalidDateEmpty = invalidDateEmpty;
        this.priceIsEmpty = priceIsEmpty;
        this.priceErr = priceErr;
        this.quantityIsEmpty = quantityIsEmpty;
        this.quantityErr = quantityErr;
    }

    public String getNameProductErr() {
        return nameProductErr;
    }

    public void setNameProductErr(String nameProductErr) {
        this.nameProductErr = nameProductErr;
    }

    public String getImgProductErr() {
        return imgProductErr;
    }

    public void setImgProductErr(String imgProductErr) {
        this.imgProductErr = imgProductErr;
    }

    public String getDescriptionErr() {
        return descriptionErr;
    }

    public void setDescriptionErr(String descriptionErr) {
        this.descriptionErr = descriptionErr;
    }

    public String getInvalidDateErr() {
        return invalidDateErr;
    }

    public void setInvalidDateErr(String invalidDateErr) {
        this.invalidDateErr = invalidDateErr;
    }

    public String getInvalidDateEmpty() {
        return invalidDateEmpty;
    }

    public void setInvalidDateEmpty(String invalidDateEmpty) {
        this.invalidDateEmpty = invalidDateEmpty;
    }

    public String getPriceIsEmpty() {
        return priceIsEmpty;
    }

    public void setPriceIsEmpty(String priceIsEmpty) {
        this.priceIsEmpty = priceIsEmpty;
    }

    public String getPriceErr() {
        return priceErr;
    }

    public void setPriceErr(String priceErr) {
        this.priceErr = priceErr;
    }

    public String getQuantityIsEmpty() {
        return quantityIsEmpty;
    }

    public void setQuantityIsEmpty(String quantityIsEmpty) {
        this.quantityIsEmpty = quantityIsEmpty;
    }

    public String getQuantityErr() {
        return quantityErr;
    }

    public void setQuantityErr(String quantityErr) {
        this.quantityErr = quantityErr;
    }

    
}
