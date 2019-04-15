/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;


/**
 *
 * @author Ali Raza
 */
@Entity
@Table(name = "orders")
public class NewOrders {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
     private int id;
    
    @Column (name = "itemname")
    private String itemname;
      
    @Column (name = "price")
    private String price;
   
    @Column (name = "quantity")
    private String quantity;
    
    @Column (name = "total")
    private int total;
    
    @Column (name = "status")
    private String status;
    
    @Column (name = "c_id")
    private String c_id;
    
    @Column (name = "s_id")
    private String s_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

 

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }
    
    
    
}
