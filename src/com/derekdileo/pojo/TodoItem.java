package com.derekdileo.pojo;

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

@Entity
@Table(name = "todo_items")
public class TodoItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	protected int id;

	@Column(name = "description")
	protected String description;

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