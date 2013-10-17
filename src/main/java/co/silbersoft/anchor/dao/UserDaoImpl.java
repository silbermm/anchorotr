package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.exceptions.UserAlreadyExistsException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    public UserDaoImpl(DataSource ds) {
        this.jdbcTemplate = new JdbcTemplate(ds);
    }

    @Override
    public void create(String username, String password, String authority) {
        if (findUser(username) != null) {
            // a user already exists
            throw new UserAlreadyExistsException(username + " already exists");
        }
        String encPassword = passwordEncoder.encodePassword(password, username);
        jdbcTemplate.update("INSERT INTO users (username, password, enabled) VALUES (?,?,?)", username, encPassword, true);
        jdbcTemplate.update("INSERT INTO authorities (username, authority) VALUES(?,?)", username, authority);
    }

    @Override
    public void delete(String username) {
        jdbcTemplate.update("DELETE FROM authorities WHERE username = ?", username);
        jdbcTemplate.update("DELETE FROM users WHERE username = ?", username);
    }

    @Override
    public void addAuthority(String username, String authority) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeAuthority(String username, String authority) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void changePassword(String username, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User findUser(String username) {

        Integer rowCount = this.jdbcTemplate.queryForObject("select count(*) from users where username = ?", Integer.class, username);
        if (rowCount > 0) {
            final List<GrantedAuthority> authorities = jdbcTemplate.query("SELECT * FROM users join authorities on users.username = authorities.username WHERE users.username = ?",
                    new String[]{username},
                    new RowMapper<GrantedAuthority>() {
                @Override
                public GrantedAuthority mapRow(ResultSet rs, int i) throws SQLException {
                    return new SimpleGrantedAuthority(rs.getString("authority"));
                }
            });

            User u = jdbcTemplate.queryForObject("SELECT * FROM users where username = ?",
                    new String[]{username}, new RowMapper<User>() {
                @Override
                public User mapRow(ResultSet rs, int i) throws SQLException {
                    return new User(rs.getString("username"), rs.getString("password"), authorities);
                }
            });
            return u;
        } else {
            return null;        
        }

    }
    @Autowired
    ShaPasswordEncoder passwordEncoder;
    @Autowired
    SaltSource saltSource;
    private JdbcTemplate jdbcTemplate;
}
