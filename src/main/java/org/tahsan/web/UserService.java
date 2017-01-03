package org.tahsan.web;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.tahsan.web.dao.UserRepository;
import org.tahsan.web.model.User;

@Service
@Transactional
public class UserService {

	private final UserRepository userRepository;
	
	public UserService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	public List<User> findAll() {
		
		List<User> users = new ArrayList<User>();
		for(User user : userRepository.findAll()){
			System.out.println("User -> " + user.getFirstname());
			users.add(user);
		}
		return users;
		
	}
	
	public User findUser(int id) {
		return userRepository.findOne(id);
	}
	
	public void save (User user) {
		 userRepository.save(user);
	}
	
	public void delete(int id) {
		userRepository.delete(id);
	}
}
