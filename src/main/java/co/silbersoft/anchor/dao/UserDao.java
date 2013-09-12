package co.silbersoft.anchor.dao;

import org.springframework.security.core.userdetails.User;

public interface UserDao {
 
    void create(String username, String password, String authority);
    void delete(String username);
    
    void addAuthority(String username, String authority);
    void removeAuthority(String username, String authority);
    
    void changePassword(String username, String password);
    
    User findUser(String username);
    
}
