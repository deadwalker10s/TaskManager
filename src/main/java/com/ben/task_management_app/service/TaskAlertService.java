/**
 * 
 */
package com.ben.task_management_app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ben.task_management_app.model.TaskAlert;
import com.ben.task_management_app.repository.TaskAlertRepository;

/**
 * Service Class for TaskAlert
 */
@Service
public class TaskAlertService {

	private final TaskAlertRepository taskAlertRepository;

	public TaskAlertService(TaskAlertRepository taskAlertRepository) {
		super();
		this.taskAlertRepository = taskAlertRepository;
	}

	// Retrieve all alerts
	public List<TaskAlert> getAllAlerts() {
		return taskAlertRepository.findAll();
	}

	// find alert by ID
	public TaskAlert getAlertById(Integer id) {
		return taskAlertRepository.findById(id)
				.orElseThrow(() -> new RuntimeException("Task Alert not found with id: " + id));
	}

	// create or save new alert
	public TaskAlert createAlert(TaskAlert alert) {
		return taskAlertRepository.save(alert);
	}

	// delete an alert
	public void deleteTaskAlert(Integer id) {
		if (!taskAlertRepository.existsById(id)) {
			throw new RuntimeException("alert not found in Id :" + id);
		}
		taskAlertRepository.deleteById(id);
	}
}
