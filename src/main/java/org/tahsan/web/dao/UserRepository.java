package org.tahsan.web.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.tahsan.web.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{

}
