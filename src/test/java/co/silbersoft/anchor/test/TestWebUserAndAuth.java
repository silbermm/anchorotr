package co.silbersoft.anchor.test;

import co.silbersoft.anchor.config.AppContext;
import co.silbersoft.anchor.config.WebConfig;
import co.silbersoft.anchor.dao.AccountDao;
import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.Role;
import co.silbersoft.anchor.services.AccountService;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
            Account a = new Account();
            a.setDateCreated(new Date());
            a.setEmail("silbermm@gmail.com");
            a.setEnabled(true);
            a.setFirstName("Matt");
            a.setLastName("Silbernagel");
            a.setUsername("silbermm");

            Role r = new Role();
            r.setName("Administrator");
            Set<Role> roles = new HashSet<Role>();
            roles.add(r);

            a.setRoles(roles);

            //accountDao.create(a);
            accountService.createUser(a, "othello");

            Account users = accountService.getAccountByUsername("silbermm");
            log.debug("Users silbermm exists in the database!");
            log.debug(users.getFullName());
            Assert.notNull(users);
        }
    }
    @Autowired
    AccountService accountService;
    @Autowired
    AccountDao accountDao;
}
