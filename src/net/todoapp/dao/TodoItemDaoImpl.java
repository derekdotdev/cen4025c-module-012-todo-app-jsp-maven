package net.todoapp.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import net.todoapp.model.TodoItem;
import net.todoapp.utl.HibernateUtil;

public class TodoItemDaoImpl implements TodoItemDao {

	private Session getSession() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		return sessionFactory.openSession();
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean dbEmpty() {

		Session session = getSession();
		session.beginTransaction();

		List<TodoItem> todoItemList = (List<TodoItem>) session.createQuery(

				"FROM TodoItem").list();

		if (todoItemList.isEmpty()) {
			session.close();
			return true;
		} else {
			session.close();
			return false;
		}

	}

	@Override
	public void saveTodoItem(TodoItem item) {
		Session session = getSession();
		session.beginTransaction();
		session.save(item);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TodoItem> showAllTodoItems() {

		if (!dbEmpty()) {
			Session session = getSession();
			session.beginTransaction();
			List<TodoItem> todoItemList = (List<TodoItem>) session.createQuery("FROM TodoItem").list();
			session.getTransaction().commit();
			session.close();
			return todoItemList;

		} else {
			System.err.println("The TDL is currently empty. Please add some items");
			System.out.println("\nThe TDL is currently empty. Please add some items and get to work!");
			return null;
		}

	}

	@Override
	public void updateTodoItem(int id, String description) {
		Session session = getSession();
		session.beginTransaction();

		try {
			TodoItem item = session.load(TodoItem.class, id);
			String tempDesc = item.getDescription();
			item.setDescription(description);

			session.update(item);
			session.getTransaction().commit();
			session.close();
			System.out.println("Todo Item Updated from: [ " + tempDesc + " ] to: [ " + description + " ]");

		} catch (Exception e) {
			System.err.println("No Todo Item found with ID: " + id);
			System.out.println("No Todo Item found with ID: " + id);
			session.close();
		}

	}

//	@SuppressWarnings("deprecation")
//	@Override
//	public void updateTodoItem(int id, String description) {
//
//		Session session = getSession();
//		session.beginTransaction();
//
//		try {
//
//			TodoItem item = session.load(TodoItem.class, id);
//			String tempDesc = item.getDescription();
//			item.setDescription(description);
//
////			// Changed from session.update to SQLQuery<?> (deprecated).
////			// When updating, I can add ' -- ' into the update field.
////			// This sets ALL row descriptions to blank except for item to manage
////
//			String sql = "UPDATE todo_items SET description = '" + description + "' WHERE id = " + id;
//			SQLQuery<?> query = session.createSQLQuery(sql);
//			query.executeUpdate();
//
////			session.update(item);
//			session.getTransaction().commit();
//			session.close();
//			System.out.println("Todo Item Updated from: [ " + tempDesc + " ] to: [ " + description + " ]");
//
//		} catch (Exception e) {
//			System.err.println("No Todo Item found with ID: " + id);
//			System.out.println("No Todo Item found with ID: " + id);
//			session.close();
//
//		}
//
//	}


	@Override
	public void deleteTodoItem(TodoItem item) {

		if (!dbEmpty()) {
			Session session = getSession();
			session.beginTransaction();

			try {

				session.delete(item);
				session.getTransaction().commit();
				session.close();
				System.out.println("Todo Item: [ " + item.getDescription().toString() + " ] Deleted!");

			} catch (Exception e) {
				System.out.println("No Todo Item found with ID: " + item.getId());
				session.close();
			}

		}

	}

	// Note the Rollback option below. Implement this later
	/*
	 * public void insertStudent() { Transaction transaction = null; try (Session
	 * session = HibernateUtil.getSessionFactory().openSession()) { // start a
	 * transaction transaction = session.beginTransaction();
	 * 
	 * String hql = "INSERT INTO Student (firstName, lastName, email) " +
	 * "SELECT firstName, lastName, email FROM Student"; Query query =
	 * session.createQuery(hql); int result = query.executeUpdate();
	 * System.out.println("Rows affected: " + result);
	 * 
	 * // commit transaction transaction.commit(); } catch (Exception e) { if
	 * (transaction != null) { transaction.rollback(); } e.printStackTrace(); } }
	 * 
	 * 
	 */

}
