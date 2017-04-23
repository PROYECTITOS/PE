package com.libreria.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.libreria.spring.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {

	// Enviar mensajes en consola (Se pueden desactivar)
	private static Logger log = LoggerFactory.getLogger(PersonDAOImpl.class);

	// En persistencia session es conexion
	private SessionFactory sessionFactory;

	@Override
	public void registro(Person p) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(p);
		log.info("Se registró correctamente : " + p.getName());
	}

	@Override
	public void actualiza(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		log.info("Persona updated successfully, Person Details=" + p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> lista() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		for (Person p : personsList) {
			log.info("Persona List::" + p);
		}
		return personsList;
	}

	@Override
	public Person obtiene(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		log.info("Persona loaded successfully, Person details=" + p);
		return p;
	}

	@Override
	public void elimina(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
		log.info("Persona deleted successfully, person details=" + p);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired(required = true)
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

}
