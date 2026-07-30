package com.ben.task_management_app.model;

import java.util.ArrayList;
import java.util.List;

public class User {

	private int userId;
	private String userName;
	private List<Task> tasks;

	// Constructor
	public User(int userId, String userName, List<Task> tasks) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.tasks = new ArrayList<Task>();
	}

	// Business Methods to manage the user's tasks
	public void addTask(Task task) {
		this.tasks.add(task);
	}

	public void removeTask(int taskId) {
		this.tasks.removeIf(task -> task.getTaskId() == taskId);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", tasks=" + tasks + "]";
	}

}
