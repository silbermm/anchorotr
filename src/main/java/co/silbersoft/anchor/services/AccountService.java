package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.AccountDao;
import co.silbersoft.anchor.models.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;

@Service
@Transactional(readOnly = true)
public class AccountService {

    @Transactional(readOnly = true)
    public Account getAccountByUsername(String username) {
        return accountDao.findByUsername(username);
    }

    @Transactional(readOnly = false)
    public boolean registerAccount(Account account, String password, Errors errors) {
        validateUsername(account.getUsername(), errors);
        boolean valid = !errors.hasErrors();
        if (valid) {
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
    @Autowired
    AccountDao accountDao;
}
