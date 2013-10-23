package co.silbersoft.anchor.models;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.DynamicInsert;

@Entity
@Table(name="menuitem")
@DynamicInsert
public class MenuItem implements Serializable {
    
    private Long id;
    private String itemName;
    private String itemDesc;
    private String catagory;
    private String price;
    private Long menuId;
    private int weight;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="itemName")
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    @Column(name="itemDesc")
    public String getItemDesc() {
        return itemDesc;
    }

    public void setItemDesc(String itemDesc) {
        this.itemDesc = itemDesc;
    }
    
    @Column(name="catagory")
    public String getCatagory() {
        return catagory;
    }

    public void setCatagory(String catagory) {
        this.catagory = catagory;
    }

    @Column(name="price")
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Column(name="menu_id")
    public Long getMenu() {
        return this.menuId;
    }

    public void setMenu(Long menu) {
        this.menuId = menu;
    }

    @Column(nullable=false,columnDefinition = "int default 0")
    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }
    
    
    
}
