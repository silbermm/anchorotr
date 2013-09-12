package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.UserDetailsAdapter;
import javax.sql.DataSource;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl extends AbstractDao<Account> implements AccountDao {

    private static final Logger log = Logger.getLogger(AccountDaoImpl.class);
    private static final String UPDATE_PASSWORD_SQL =
            "update account set password = ? where username = ?";

    @Autowired
    public AccountDaoImpl(SessionFactory sf, DataSource ds) {
        this.setSessionFactory(sf);
        this.jdbcTemplate = new JdbcTemplate(ds);
    }

    public void create(Account account, String password) {
        log.debug("Creating account: " + account);
        create(account);

        log.debug("Updating password");
        Object salt = saltSource.getSalt(new UserDetailsAdapter(account));
        String encPassword = passwordEncoder.encodePassword(password, salt);
        jdbcTemplate.update(UPDATE_PASSWORD_SQL, encPassword, account.getUsername());
    }

    public Account findByUsername(String username) {
        Query q = getSession().createQuery("from Account where username = :username");
        q.setString("username", username);
        return (Account) q.uniqueResult();
    }

    private JdbcTemplate jdbcTemplate;
    @Autowired
    ShaPasswordEncoder passwordEncoder;
    @Autowired
    SaltSource saltSource;
}
