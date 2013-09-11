package co.silbersoft.anchor.services;

import co.silbersoft.anchor.dao.UserDetailsDao;
import co.silbersoft.anchor.models.Account;
import co.silbersoft.anchor.models.UserDetailsAdapter;
import co.silbersoft.anchor.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
@Transactional(readOnly = true)
public class UserDetailsServiceAdapter implements UserDetailsService {

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountService.getAccountByUsername(username);
        if (account == null) {
            throw new UsernameNotFoundException(
                    "No such user: " + username);
        } else if (account.getRoles().isEmpty()) {
            throw new UsernameNotFoundException(
                    "User " + username + " has no authorities");
        }

        UserDetailsAdapter user = new UserDetailsAdapter(account);
        user.setPassword(
                userDetailsDao.findPasswordByUsername(username));
        return user;
    }
    
    @Autowired
    AccountService accountService;
    @Autowired
    UserDetailsDao userDetailsDao;
}
