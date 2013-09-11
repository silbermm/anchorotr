package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Menu;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDaoImpl extends AbstractDao<Menu> implements MenuDao {

    @Autowired
    public MenuDaoImpl(SessionFactory sf){
        this.setSessionFactory(sf);
    }
    
    public Menu findByName(String name) {
        return (Menu) getSession().createQuery("from Menu where name = :name").setString("name", name).uniqueResult();
    }
    
}
