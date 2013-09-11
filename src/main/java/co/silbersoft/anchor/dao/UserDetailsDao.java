package co.silbersoft.anchor.dao;

public interface UserDetailsDao {
    String findPasswordByUsername(String username);
}