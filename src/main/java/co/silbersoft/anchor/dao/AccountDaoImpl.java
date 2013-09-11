package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.UserDetailsAdapter;
import javax.sql.DataSource;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl extends AbstractDao<Account> implements AccountDao {

    @Autowired
    public AccountDaoImpl(SessionFactory sf, DataSource ds) {
        this.setSessionFactory(sf);
    }

    public void create(Account account, String password) {
        Object salt = saltSource.getSalt(new UserDetailsAdapter(account));
        String encPassword = passwordEncoder.encodePassword(password, salt);
        account.setPassword(encPassword);
        create(account);
    }

    public Account findByUsername(String username) {
        Query q = getSession().createQuery("from Account where username = :username");
        q.setString("username", username);
        return (Account) q.uniqueResult();
    }
    @Autowired
    ShaPasswordEncoder passwordEncoder;
    @Autowired
    SaltSource saltSource;
}
