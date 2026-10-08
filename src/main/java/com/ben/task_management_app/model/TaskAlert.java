package com.ben.task_management_app.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "task_alert")
public class TaskAlert {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int taskAlertId;
	private String taskAlertMessage;
	private LocalDateTime taskAlertTime;

	// Constructor
	public TaskAlert(int taskAlertId, String taskAlertMessage, LocalDateTime taskAlertTime) {
		super();
		this.taskAlertId = taskAlertId;
		this.taskAlertMessage = taskAlertMessage;
		this.taskAlertTime = taskAlertTime;
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

	@Override
	public String toString() {
		return "TaskAlert [taskAlertId=" + taskAlertId + ", taskAlertMessage=" + taskAlertMessage + ", taskAlertTime="
				+ taskAlertTime + "]";
	}

}
