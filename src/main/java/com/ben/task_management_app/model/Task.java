package com.ben.task_management_app.model;

import java.time.LocalDate;

import com.ben.task_management_app.model.enums.TaskPriority;
import com.ben.task_management_app.model.enums.TaskStatus;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tasks")
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer taskId;
	private String taskTitle;
	private String taskDescription;

	@Enumerated(EnumType.STRING)
	private TaskPriority taskPriority;

	private LocalDate taskDuedate;
	@Enumerated(EnumType.STRING)
	private TaskStatus taskStatus;

	protected Task() {
	}

	// Constructor
	public Task(Integer taskId, String taskTitle, String taskDescription, TaskPriority taskPriority,
			LocalDate taskDuedate, TaskStatus taskStatus) {
		super();
		this.taskId = taskId;
		this.taskTitle = taskTitle;
		this.taskDescription = taskDescription;
		this.taskPriority = taskPriority;
		this.taskDuedate = taskDuedate;
		this.taskStatus = taskStatus;
		// taskDuedate intentionally left null unless status is COMPLETED at creation
		if (taskStatus == TaskStatus.COMPLETED) {
			this.taskDuedate = LocalDate.now();
		}
	}

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
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

	public TaskPriority getTaskPriority() {
		return taskPriority;
	}

	public void setTaskPriority(TaskPriority taskPriority) {
		this.taskPriority = taskPriority;
	}

	public LocalDate getTaskDuedate() {
		return taskDuedate;
	}

	public void setTaskDuedate(LocalDate taskDuedate) {
		this.taskDuedate = taskDuedate;
	}

	public TaskStatus getTaskStatus() {
		return taskStatus;
	}

	public void setTaskStatus(TaskStatus taskStatus) {
		this.taskStatus = taskStatus;
		if (taskStatus == TaskStatus.COMPLETED) {
			if (this.taskDuedate == null) {
				this.taskDuedate = LocalDate.now();
			}
		} else {
			this.taskDuedate = null; // clear it if task moves back to inprogress/onhold
		}
	}

	@Override
	public String toString() {
		return "Task [taskId=" + taskId + ", taskTitle=" + taskTitle + ", taskDescription=" + taskDescription
				+ ", taskPriority=" + taskPriority + ", taskDuedate=" + taskDuedate + ", taskStatus=" + taskStatus
				+ "]";
	}

}
