package com.libreria.spring.service;

import java.util.List;

import com.libreria.spring.model.Category;

public interface CategoryService {

	public void registro(Category p);

	public void actualiza(Category p);

	public List<Category> lista();

	public Category obtiene(int id);

	public void elimina(int id);

}
