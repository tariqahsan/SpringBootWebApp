package org.tahsan.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloRestController {
	
	@GetMapping("/hello")
	public String sayHi() {
		return "Hello Everyone!";
	}
}
