package com.groupninja.himi.pizza_ninja.repositories;

import com.groupninja.himi.pizza_ninja.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    List<User> findAll();
    User findByUsername(String username);
    User findByFirstName(String firstName);
    boolean existsByUsername(String username);
}
