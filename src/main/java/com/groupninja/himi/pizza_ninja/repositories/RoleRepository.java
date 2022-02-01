package com.groupninja.himi.pizza_ninja.repositories;

import com.groupninja.himi.pizza_ninja.models.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {
    List<Role> findAll();
    List<Role> findByName(String name);
    Role findRoleById(Long id);
}
