package co.silbersoft.anchor.models;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="menu", uniqueConstraints={
    @UniqueConstraint(columnNames="name")
})
@JsonAutoDetect
public class Menu implements Serializable {
    
    private Long menuId;
    private String name;

    public Menu() {}
    
    public Menu(String name){
        this.name = name;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="menu_id")
    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long id) {
        this.menuId = id;
    }

    @Column(name="name", unique=true, nullable=false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
}
