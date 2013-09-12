package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.Role;
import co.silbersoft.anchor.models.UserDetailsAdapter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.sql.DataSource;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl implements AccountDao {

    @Autowired
    public AccountDaoImpl(DataSource ds) {
        this.jdbc = new JdbcTemplate(ds);
    }

    public void create(Account account, String password) {
        Object salt = saltSource.getSalt(new UserDetailsAdapter(account));
        String encPassword = passwordEncoder.encodePassword(password, salt);
        account.setPassword(encPassword);
        if(findByUsername(account.getUsername()) != null){
            return;
        } else {
            jdbc.update("insert into account set username=?,email=?,enabled=?,firstname=?,lastname=?,password=?,datecreated=?", 
                    account.getUsername(), 
                    account.getEmail(), 
                    account.isEnabled(), 
                    account.getFirstName(), 
                    account.getLastName(), 
                    account.getPassword(),
                    new Date());
        }
    }

    public Account findByUsername(String username) {
        Account a = jdbc.queryForObject("select * from account left join account_roles as ar on ar.user_id = account.user_id left join role as r on r.roleid = ar.role_id where username =?",
                new String[]{username},
                new RowMapper<Account>() {
            @Override
            public Account mapRow(ResultSet rs, int i) throws SQLException {
                Account acct = new Account();
                acct.setDateCreated(rs.getDate("datecreated"));
                acct.setEmail(rs.getString("email"));
                acct.setEnabled(rs.getBoolean("enabled"));
                acct.setFirstName(rs.getString("firstname"));
                acct.setLastName(rs.getString("lastname"));
                acct.setUsername(rs.getString("username"));
                acct.setPassword(rs.getString("password"));
                Set<Role> r = new HashSet();
                acct.setRoles(r);
                return acct;
            }
        });
        return a;
    }
    private JdbcTemplate jdbc;
    @Autowired
    ShaPasswordEncoder passwordEncoder;
    @Autowired
    SaltSource saltSource;
}
