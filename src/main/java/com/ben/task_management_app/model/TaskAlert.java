package com.ben.task_management_app.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "task_alert")
public class TaskAlert {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer taskAlertId;
	private String taskAlertMessage;
	private LocalDateTime taskAlertTime;

	@OneToOne
	@JoinColumn(name = "task_id", nullable = false, unique = true) // actually enforces "one task can only have one
																	// alert" at the database level.
	private Task task;

	protected TaskAlert() {
	}

	// Constructor
	public TaskAlert(String taskAlertMessage, LocalDateTime taskAlertTime, Task task) {
		this.taskAlertMessage = taskAlertMessage;
		this.taskAlertTime = taskAlertTime;
		this.task = task;
	}

	public int getTaskAlertId() {
		return taskAlertId;
	}

	public void setTaskAlertId(int taskAlertId) {
		this.taskAlertId = taskAlertId;
	}

	public String getTaskAlertMessage() {
		return taskAlertMessage;
	}

	public void setTaskAlertMessage(String taskAlertMessage) {
		this.taskAlertMessage = taskAlertMessage;
	}

	public LocalDateTime getTaskAlertTime() {
		return taskAlertTime;
	}

	public void setTaskAlertTime(LocalDateTime taskAlertTime) {
		this.taskAlertTime = taskAlertTime;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	@Override
	public String toString() {
		return "TaskAlert [taskAlertId=" + taskAlertId + ", taskAlertMessage=" + taskAlertMessage + ", taskAlertTime="
				+ taskAlertTime + "]";
	}

}
