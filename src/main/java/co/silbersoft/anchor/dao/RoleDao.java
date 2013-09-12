package co.silbersoft.anchor.dao;

import co.silbersoft.anchor.models.Role;

public interface RoleDao extends Dao<Role> {
	
	Role findByName(String name);
}
