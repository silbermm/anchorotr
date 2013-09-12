package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Role;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl extends AbstractDao<Role> implements RoleDao {
    
    @Autowired
    public RoleDaoImpl(SessionFactory sessionFactory){
        this.setSessionFactory(sessionFactory);
    }

    public Role findByName(String name) {
        Query q = getSession().createQuery("from Role where name=:name").setString("name", name);        
        return (Role) q.uniqueResult();
    }
}
