package com.libreria.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.libreria.spring.dao.AuthorDAO;
import com.libreria.spring.model.Author;

@Service
public class AuthorServiceImpl implements AuthorService {

	private AuthorDAO authorDAO;

	@Override
	@Transactional
	public void registro(Author p) {
		this.authorDAO.registro(p);
	}

	@Override
	@Transactional
	public void actualiza(Author p) {
		this.authorDAO.actualiza(p);
	}

	@Override
	@Transactional
	public List<Author> lista() {
		return this.authorDAO.lista();
	}

	@Override
	@Transactional
	public Author obtiene(int id) {
		return this.authorDAO.obtiene(id);
	}

	@Override
	@Transactional
	public void elimina(int id) {
		this.authorDAO.elimina(id);
	}

	public AuthorDAO getPersonDAO() {
		return authorDAO;
	}

	@Autowired(required = false)
	public void setPersonDAO(AuthorDAO personDAO) {
		this.authorDAO = personDAO;
	}
}
