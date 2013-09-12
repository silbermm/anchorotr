package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.AccountDao;
import co.silbersoft.anchor.dao.RoleDao;
import co.silbersoft.anchor.dao.UserDao;
import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.Role;
import java.util.HashSet;
import java.util.Set;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;

@Service
@Transactional(readOnly = true)
public class AccountService {
    
    @Transactional(readOnly = false)
    public boolean registerUser(String username, String password, String authority){
        userDao.create(username, password, authority);        
        return true;        
    }

    @Transactional(readOnly = true)
    public Account getAccountByUsername(String username) {
        Account account = accountDao.findByUsername(username);
        if (account != null) { Hibernate.initialize(account.getRoles()); }
        return account;
    }

    @Transactional(readOnly = false)
    public boolean registerAccount(Account account, String password, Errors errors) {
        validateUsername(account.getUsername(), errors);
        boolean valid = !errors.hasErrors();

        if (valid) {
            Set<Role> roles = new HashSet<Role>();
            roles.add(roleDao.findByName("user"));
            account.setRoles(roles);
            accountDao.create(account, password);
        }

        return valid;
    }

    @Transactional(readOnly = false)
    public boolean createUser(Account account, String pass) {
        if (accountDao.findByUsername(account.getUsername()) != null) {
            return false;
        }
        accountDao.create(account, pass);
        return true;
    }

    @Transactional(readOnly = true)
    private void validateUsername(String username, Errors errors) {
        if (accountDao.findByUsername(username) != null) {
            errors.rejectValue("username", "error.duplicate", new String[]{username}, null);
        }
    }
    
    @Autowired UserDao userDao;
    @Autowired
    AccountDao accountDao;
    @Autowired RoleDao roleDao;
}
