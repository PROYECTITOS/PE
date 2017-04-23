package com.libreria.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.libreria.spring.model.Author;
import com.libreria.spring.service.AuthorService;

@Controller
public class AuthorController {

	private String _DIR = "Author/";
	private String _OBJ = "author";
	private String _LST = "lstAuthor";
	
	private AuthorService authorService;

	@Autowired(required = false)
	public void setPersonService(AuthorService personService) {
		this.authorService = personService;
	}

	@RequestMapping(value = "/autor")
	public String index(Model model) {
		model.addAttribute(_OBJ, new Author());
		return _DIR + "index"; 
	}

	@RequestMapping(value = "/autores", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute(_OBJ, new Author());
		model.addAttribute(_LST, this.authorService.lista());
		return _DIR + "list"; 
	}

	@RequestMapping(value = "/autor/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("author") Author p) {
		if (p.getId() == 0) {
			this.authorService.registro(p);
		} else {
			this.authorService.actualiza(p);
		}
		return "redirect:/autores";
	}

	@RequestMapping("/autor/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		this.authorService.elimina(id);
		return "redirect:/autores";
	}

	@RequestMapping("/autor/edit/{id}")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute(_OBJ, this.authorService.obtiene(id));
		model.addAttribute(_LST, this.authorService.lista());
		return "person";
	}

	public AuthorService getPersonService() {
		return authorService;
	}

}
