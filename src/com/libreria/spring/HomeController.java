package com.libreria.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.libreria.spring.model.Person;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/home")
	public String inicio(Model model) {
		model.addAttribute("person", new Person());
		return "dashboard"; 
	}
	
}
