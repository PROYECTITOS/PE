package com.libreria.spring.service;

import java.util.List;

import com.libreria.spring.model.Person;

public interface PersonService {

	public void registro(Person p);

	public void actualiza(Person p);

	public List<Person> lista();

	public Person obtiene(int id);

	public void elimina(int id);

}
