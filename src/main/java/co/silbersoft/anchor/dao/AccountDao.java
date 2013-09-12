package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Account;

public interface AccountDao {

    void create(Account account, String password);

    Account findByUsername(String username);
}