package net.todoapp.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * TodoItem.java
 * This is a model class which represents a TodoItem entity
 * @author Derek DiLeo
 * */
// Java Bean 
// 1. Implements Serializable
// 2. No argument constructor
// 3. Private members w/ getters and setters

@SuppressWarnings("serial")
@Entity
@Table(name = "todo_items")
public class TodoItem implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "description")
	private String description;

	public TodoItem() {
	}

	public TodoItem(String description) {
		super();
		this.description = description;
	}

	public TodoItem(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "TodoItem [id=" + id + ", description=" + description + "]";
	}

}