package com.libreria.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.libreria.spring.dao.PersonDAO;
import com.libreria.spring.model.Person;

@Service
public class PersonServiceImpl implements PersonService {

	private PersonDAO personDAO;

	@Override
	@Transactional
	public void registro(Person p) {
		this.personDAO.registro(p);
	}

	@Override
	@Transactional
	public void actualiza(Person p) {
		this.personDAO.actualiza(p);
	}

	@Override
	@Transactional
	public List<Person> lista() {
		return this.personDAO.lista();
	}

	@Override
	@Transactional
	public Person obtiene(int id) {
		return this.personDAO.obtiene(id);
	}

	@Override
	@Transactional
	public void elimina(int id) {
		this.personDAO.elimina(id);
	}

	public PersonDAO getPersonDAO() {
		return personDAO;
	}

	@Autowired(required = true)
	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}
}
