package org.tahsan.web.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.tahsan.web.UserService;
import org.tahsan.web.model.User;


@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-users")
	public String allUsers(HttpServletRequest request){
		request.setAttribute("users", userService.findAll());
		request.setAttribute("mode", "MODE_USERS");
		return "index";
	}
	
	@GetMapping("/new-user")
	public String newUser(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-user")
	public String saveUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
		//user.setDateCreated(new Date());
		userService.save(user);
		request.setAttribute("user", userService.findAll());
		request.setAttribute("mode", "MODE_USER");
		return "index";
	}
	
	@GetMapping("/update-user")
	public String updateUser(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("user", userService.findUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request){
		userService.delete(id);
		request.setAttribute("tasks", userService.findAll());
		request.setAttribute("mode", "MODE_TASKS");
		return "index";
	}
	
	/*@GetMapping("/all-users")
	public String getAllUsers() {
		
		System.out.println(userService.findAll().toString());
		return userService.findAll().toString();		
	}

	@GetMapping("/save-user")
	public String saveUser(@RequestParam String firstname, @RequestParam String middlename, @RequestParam String lastname, 
			@RequestParam String address1,@RequestParam String address2, @RequestParam String city,
			@RequestParam String state, @RequestParam String zip5,
			@RequestParam String zip4, @RequestParam String phone,
			@RequestParam String email) {
		
		User user = new User(firstname, middlename, lastname, address1, address2, city, state, zip5, zip4, phone, email);
		userService.save(user);	
		return "User Saved!";
	}
	
	@GetMapping("/delete-user")
	public String deleteUser(@RequestParam int id) {
		userService.delete(id);
		return "User Deleted!";
	}*/
}
