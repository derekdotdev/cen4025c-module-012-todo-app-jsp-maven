package com.derekdileo.DAO;

import java.util.List;

import com.derekdileo.pojo.TodoItem;

public interface TodoItemDao {

	public boolean dbEmpty();

	public void saveTodoItem(TodoItem item);

	public List<TodoItem> showAllTodoItems();

	public void updateTodoItem(int id, String description);

	public void deleteTodoItem(TodoItem item);

}
