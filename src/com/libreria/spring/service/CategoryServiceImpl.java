package com.libreria.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.libreria.spring.dao.CategoryDAO;
import com.libreria.spring.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService{

	private CategoryDAO categoryDAO;

	@Override
	@Transactional
	public void registro(Category p) {
		this.categoryDAO.registro(p);
	}

	@Override
	@Transactional
	public void actualiza(Category p) {
		this.categoryDAO.actualiza(p);
	}

	@Override
	@Transactional
	public List<Category> lista() {
		return this.categoryDAO.lista();
	}

	@Override
	@Transactional
	public Category obtiene(int id) {
		return this.categoryDAO.obtiene(id);
	}

	@Override
	@Transactional
	public void elimina(int id) {
		this.categoryDAO.elimina(id);
	}

	public CategoryDAO getPersonDAO() {
		return categoryDAO;
	}

	@Autowired(required = true)
	public void setPersonDAO(CategoryDAO personDAO) {
		this.categoryDAO = personDAO;
	}
}
