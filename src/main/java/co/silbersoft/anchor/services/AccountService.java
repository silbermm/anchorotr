package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.UserDao;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
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
    
    @Transactional(readOnly=false)
    public void updateUser(String username, String password, Errors errors){
        User user = getAccountByUsername(username);
        if(user != null){
            userDao.delete(username);
            userDao.create(username, password, "Administrator");
        }             
    }

    @Transactional(readOnly = true)
    public User getAccountByUsername(String username) {
        User user = userDao.findUser(username);        
        if (user != null) { Hibernate.initialize(user.getAuthorities()); }
        return user;
    }

    @Transactional(readOnly = false)
    public boolean registerAccount(User account, String password, Errors errors) {
        validateUsername(account.getUsername(), errors);
        boolean valid = !errors.hasErrors();
        if (valid) {
            userDao.create(account.getUsername(), password, "user");
        }

        return valid;
    }

    @Transactional(readOnly = true)
    private void validateUsername(String username, Errors errors) {
        if (userDao.findUser(username) != null) {
            errors.rejectValue("username", "error.duplicate", new String[]{username}, null);
        }
    }
    
    @Autowired UserDao userDao;
}
