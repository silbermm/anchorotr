package co.silbersoft.anchor.dao;

import java.util.List;

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
        List<MailSettings> mlist = (List<MailSettings>) q.list();
        if (mlist.isEmpty()){
        	return null;
        } else {
        	return (MailSettings) mlist.get(0);
        }
    }
    
}
