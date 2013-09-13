package co.silbersoft.anchor.test;

import co.silbersoft.anchor.config.AppContext;
import co.silbersoft.anchor.config.WebConfig;
import co.silbersoft.anchor.services.AccountService;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.util.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {WebConfig.class, AppContext.class})
public class TestWebUserAndAuth {

    private static final Logger log = Logger.getLogger(TestWebUserAndAuth.class);

    @Test
    //@Transactional(readOnly = false)
    public void testUserJoin() {

        if (accountService.getAccountByUsername("silbermm") != null) {
            Assert.isTrue(true);
        } else {
            Set<GrantedAuthority> s = new HashSet();
            s.add(new SimpleGrantedAuthority("user"));            
            User u = new User("silbermm", "password", s);
            accountService.registerUser("silbermm", "password","user");

            User users = accountService.getAccountByUsername("silbermm");
            log.debug("Users silbermm exists in the database!");
            log.debug(users.getUsername());
            Assert.notNull(users);
        }
    }
    @Autowired
    AccountService accountService;
    
}
