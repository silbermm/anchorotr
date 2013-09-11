package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Menu;

public interface MenuDao extends Dao<Menu> {
    
    Menu findByName(String name);
    
}
