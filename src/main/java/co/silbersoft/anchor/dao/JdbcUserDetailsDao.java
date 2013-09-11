package co.silbersoft.anchor.dao;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JdbcUserDetailsDao implements UserDetailsDao {

    @Autowired
    public JdbcUserDetailsDao(DataSource ds){
        this.jdbcTemplate = new JdbcTemplate(ds);
    }
    
    
    private static final String FIND_PASSWORD_SQL =
            "select password from account where username = ?";

    @Override
    public String findPasswordByUsername(String username) {
        return jdbcTemplate.queryForObject(
                FIND_PASSWORD_SQL, new Object[]{username}, String.class);
    }
    
    private JdbcTemplate jdbcTemplate;
}