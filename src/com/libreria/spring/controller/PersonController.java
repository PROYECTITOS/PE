package com.libreria.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.libreria.spring.model.Person;
import com.libreria.spring.service.PersonService;

@Controller
public class PersonController {

	private String _DIR = "Example/";
	private String _OBJ = "person";
	private String _LST = "listPersons";

	private PersonService personService;

	@Autowired(required = true)
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	@RequestMapping(value = "/inicio")
	public String index(Model model) {
		model.addAttribute(_OBJ, new Person());
		return _DIR + "person";
	}

	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute(_OBJ, new Person());
		model.addAttribute(_LST, this.personService.lista());
		return _DIR + "person";
	}

	@RequestMapping(value = "/person/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("person") Person p) {
		if (p.getId() == 0) {
			this.personService.registro(p);
		} else {
			this.personService.actualiza(p);
		}
		return "redirect:/persons";
	}

	@RequestMapping("/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		this.personService.elimina(id);
		return "redirect:/persons";
	}

	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute(_OBJ, this.personService.obtiene(id));
		model.addAttribute(_LST, this.personService.lista());
		return _DIR + "person";
	}

	public PersonService getPersonService() {
		return personService;
	}

}
