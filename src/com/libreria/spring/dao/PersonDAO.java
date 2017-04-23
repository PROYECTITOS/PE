package com.libreria.spring.dao;

import java.util.List;

import com.libreria.spring.model.Person;

public interface PersonDAO {

	public void registro(Person p);

	public void actualiza(Person p);

	public List<Person> lista();

	public Person obtiene(int id);

	public void elimina(int id);

}
