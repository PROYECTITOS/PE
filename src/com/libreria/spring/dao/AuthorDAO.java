package com.libreria.spring.dao;

import java.util.List;

import com.libreria.spring.model.Author;

public interface AuthorDAO {

	public void registro(Author p);

	public void actualiza(Author p);

	public List<Author> lista();

	public Author obtiene(int id);

	public void elimina(int id);

}
