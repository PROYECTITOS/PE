package com.libreria.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.libreria.spring.model.Category;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	// Enviar mensajes en consola (Se pueden desactivar)
	private static Logger log = LoggerFactory.getLogger(CategoryDAOImpl.class);

	// En persistencia session es conexion
	private SessionFactory sessionFactory;

	@Override
	public void registro(Category p) {
		
		Session session = sessionFactory.getCurrentSession();
		session.persist(p);
		log.info("Se registró correctamente : " + p.getName());
	}

	@Override
	public void actualiza(Category p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		
		log.info("Persona updated successfully, Person Details=" + p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> lista() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Category> personsList = session.createQuery("from Category").list();
		for (Category p : personsList) {
			log.info("Persona List::" + p);
		}
		return personsList;
	}

	@Override
	public Category obtiene(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Category p = (Category) session.load(Category.class, new Integer(id));
		log.info("Persona loaded successfully, Person details=" + p);
		return p;
	}

	@Override
	public void elimina(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Category p = (Category) session.load(Category.class, new Integer(id));
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
