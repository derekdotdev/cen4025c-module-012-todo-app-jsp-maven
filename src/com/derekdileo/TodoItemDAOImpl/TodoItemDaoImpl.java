package com.derekdileo.TodoItemDAOImpl;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.derekdileo.DAO.TodoItemDao;
import com.derekdileo.pojo.TodoItem;

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

//	@Override
//	public void updateTodoItem(TodoItem item) {
//
//		Session session = getSession();
//		session.beginTransaction();
//
//		try {
//			
//			item.setDescription(description);
//
//			session.update(item);
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
	public void updateTodoItem(int id, String description) {

		Session session = getSession();
		session.beginTransaction();

		try {

			TodoItem item = (TodoItem) session.load(TodoItem.class, id);
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


}
