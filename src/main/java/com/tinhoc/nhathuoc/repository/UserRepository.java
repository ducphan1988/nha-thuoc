package com.tinhoc.nhathuoc.repository;

import com.tinhoc.nhathuoc.entity.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User,Long> {
    User findByEmail(String email);
}
