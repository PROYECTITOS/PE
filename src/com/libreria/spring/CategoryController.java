package com.libreria.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.libreria.spring.model.Category;
import com.libreria.spring.service.CategoryService;

@Controller
public class CategoryController {

	private String _DIR = "Category/";
	private String _OBJ = "category";
	private String _LST = "lstCategory";

	private CategoryService categoryService;

	@Autowired(required = true)
	public void setPersonService(CategoryService personService) {
		this.categoryService = personService;
	}

	@RequestMapping(value = "/categoria")
	public String index(Model model) {
		model.addAttribute(_OBJ, new Category());
		return _DIR + "index";
	}

	@RequestMapping(value = "/categorias", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute(_OBJ, new Category());
		model.addAttribute(_LST, this.categoryService.lista());
		return _DIR + "list";
	}

	@RequestMapping(value = "/categoria/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category p) {
		if (p.getId() == 0) {
			this.categoryService.registro(p);
		} else {
			this.categoryService.actualiza(p);
		}
		return "redirect:/categorias";
	}

	@RequestMapping("/categoria/remove/{id}")
	public String remove(@PathVariable("id") int id) {
		this.categoryService.elimina(id);
		return "redirect:/persons";
	}

	@RequestMapping("/categoria/edit/{id}")
	public String edit(@PathVariable("id") int id, Model model) {
		model.addAttribute(_OBJ, this.categoryService.obtiene(id));
		model.addAttribute(_LST, this.categoryService.lista());
		return _DIR + "index";
	}

	public CategoryService getPersonService() {
		return categoryService;
	}

}
