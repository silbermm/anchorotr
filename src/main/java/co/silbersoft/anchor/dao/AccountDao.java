package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Account;

public interface AccountDao extends Dao<Account> {

    void create(Account account, String password);

    Account findByUsername(String username);
}