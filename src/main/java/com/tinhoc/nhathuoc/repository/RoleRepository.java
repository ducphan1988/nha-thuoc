package com.tinhoc.nhathuoc.repository;

import com.tinhoc.nhathuoc.entity.Role;
import org.springframework.data.repository.CrudRepository;

public interface RoleRepository extends CrudRepository<Role,Long> {
    Role findByName(String name);
}
