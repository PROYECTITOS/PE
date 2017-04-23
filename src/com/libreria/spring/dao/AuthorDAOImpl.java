package com.libreria.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.libreria.spring.model.Author;

@Repository
public class AuthorDAOImpl implements AuthorDAO {

	// Enviar mensajes en consola (Se pueden desactivar)
	private static Logger log = LoggerFactory.getLogger(AuthorDAOImpl.class);

	// En persistencia session es conexion
	private SessionFactory sessionFactory;

	@Override
	public void registro(Author p) {
		Session session = sessionFactory.getCurrentSession();
		session.persist(p);
		log.info("Se registró correctamente : " + p.getName());
	}

	@Override
	public void actualiza(Author p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		log.info("Persona updated successfully, Person Details=" + p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> lista() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Author> personsList = session.createQuery("from Author").list();
		for (Author p : personsList) {
			log.info("Persona List::" + p);
		}
		return personsList;
	}

	@Override
	public Author obtiene(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Author p = (Author) session.load(Author.class, new Integer(id));
		log.info("Persona loaded successfully, Person details=" + p);
		return p;
	}

	@Override
	public void elimina(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Author p = (Author) session.load(Author.class, new Integer(id));
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
