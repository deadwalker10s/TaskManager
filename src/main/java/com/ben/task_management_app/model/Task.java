package com.ben.task_management_app.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tasks")
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int taskId;
	private String taskTitle;
	private String taskDescription;
	private String taskPriority;
	private LocalDate taskDuedate;
	private boolean taskIsCompleted;

	// Constructor
	public Task(int taskId, String taskTitle, String taskDescription, String taskPriority, LocalDate taskDuedate,
			boolean taskIsCompleted) {
		super();
		this.taskId = taskId;
		this.taskTitle = taskTitle;
		this.taskDescription = taskDescription;
		this.taskPriority = taskPriority;
		this.taskDuedate = taskDuedate;
		this.taskIsCompleted = false;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}

	public String getTaskPriority() {
		return taskPriority;
	}

	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}

	public LocalDate getTaskDuedate() {
		return taskDuedate;
	}

	public void setTaskDuedate(LocalDate taskDuedate) {
		this.taskDuedate = taskDuedate;
	}

	public boolean isTaskIsCompleted() {
		return taskIsCompleted;
	}

	public void setTaskIsCompleted(boolean taskIsCompleted) {
		this.taskIsCompleted = taskIsCompleted;
	}

	@Override
	public String toString() {
		return "Task [taskId=" + taskId + ", taskTitle=" + taskTitle + ", taskDescription=" + taskDescription
				+ ", taskPriority=" + taskPriority + ", taskDuedate=" + taskDuedate + ", taskIsCompleted="
				+ taskIsCompleted + "]";
	}

}
