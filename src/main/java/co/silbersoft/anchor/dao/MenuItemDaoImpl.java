package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.MenuItem;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuItemDaoImpl extends AbstractDao<MenuItem> implements MenuItemDao {

    @Autowired
    public MenuItemDaoImpl(SessionFactory sf){
        this.setSessionFactory(sf);
    }
    
    
    public List<MenuItem> findItemsByMenu(Long menuId) {
        return (List<MenuItem>) getSession().createQuery("from MenuItem where menu_id=:id").setLong("id", menuId).list();
    }

    public List<MenuItem> findItemsByMenuAndCatagory(Long menuid, String catagory) {
        return (List<MenuItem>) getSession().createQuery("from MenuItem where menu_id=:id and catagory=:catagory")
                .setString("catagory", catagory)
                .setLong("id", menuid)
                .list();
    }
    
}
