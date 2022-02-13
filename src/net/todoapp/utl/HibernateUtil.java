package net.todoapp.utl;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import net.todoapp.model.TodoItem;

public class HibernateUtil {

	private static SessionFactory sessionFactory;

	static {

		try {
			// Create the SessionFactory from hibernate.cfg.xml
			Configuration configuration = new Configuration().configure("/hibernate.cfg.xml");
			configuration.addAnnotatedClass(TodoItem.class);

			StandardServiceRegistryBuilder srb = new StandardServiceRegistryBuilder();

			srb.applySettings(configuration.getProperties());
			ServiceRegistry serviceRegistry = srb.build();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);

		} catch (Throwable ex) {
			// Log the exception
			System.err.println("Intitial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);

		}

	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void shutdown() {
		// Close caches and connection pools
		getSessionFactory().close();
	}

}