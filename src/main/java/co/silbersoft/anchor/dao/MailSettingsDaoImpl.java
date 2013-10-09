package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.MailSettings;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailSettingsDaoImpl extends AbstractDao<MailSettings> implements MailSettingsDao {

    @Autowired
    public MailSettingsDaoImpl(SessionFactory sf){
        this.setSessionFactory(sf);
    }
    
    @Override
    public MailSettings getSettings() {
        Query q = getSession().createQuery("from MailSettings");
        q.setFirstResult(0);
        q.setMaxResults(1);
        return (MailSettings) q.uniqueResult();
    }
    
}
