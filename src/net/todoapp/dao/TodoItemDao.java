package net.todoapp.dao;

import java.util.List;

import net.todoapp.model.TodoItem;

public interface TodoItemDao {

	public boolean dbEmpty();

	public void saveTodoItem(TodoItem item);

	public List<TodoItem> showAllTodoItems();

	public void updateTodoItem(int id, String description);

	public void deleteTodoItem(TodoItem item);

}
