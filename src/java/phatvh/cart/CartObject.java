/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatvh.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class CartObject implements Serializable{
    private Map<String, Integer> items;
    
    public Map<String, Integer> getItems(){
        return items;
    }
    
    public void addItems(String id, int quantityCurrent){
        if(this.items == null) {
            this.items = new HashMap<>();
        }
        int quantity = 1;
        if(this.items.containsKey(id)){
            quantity = quantityCurrent + items.get(id);
        } else {
            quantity = quantityCurrent;
        }
        items.put(id, quantity);
    }
    
    public void removeItem(String id) {
        if (this.items == null) {
            return;
        }

        if (this.items.containsKey(id)) {
            this.items.remove(id);
            if (this.items.isEmpty()) {
                this.items = null;
            }
        }
    }
}
