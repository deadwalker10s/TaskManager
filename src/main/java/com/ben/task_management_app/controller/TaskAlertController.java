/**
 * 
 */
package com.ben.task_management_app.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ben.task_management_app.model.TaskAlert;
import com.ben.task_management_app.service.TaskAlertService;

/**
 * Controller Class for TaskAlert
 */
@RestController
@RequestMapping("api/tasks")
@CrossOrigin(origins = "*")
public class TaskAlertController {

	private final TaskAlertService taskAlertService;

	public TaskAlertController(TaskAlertService taskAlertService) {
		super();
		this.taskAlertService = taskAlertService;
	}

	@GetMapping
	public ResponseEntity<List<TaskAlert>> getAllTasks() {
		return ResponseEntity.ok(taskAlertService.getAllAlerts());
	}

	@GetMapping("/{id}")
	public ResponseEntity<TaskAlert> getById(@PathVariable Integer id) {
		// Just fetch the object directly and wrap it in the ResponseEntity
		TaskAlert alert = taskAlertService.getAlertById(id);
		return ResponseEntity.ok(alert);
	}

	@PostMapping
	public ResponseEntity<TaskAlert> createTaskAlert(@RequestBody TaskAlert alert) {
		return ResponseEntity.ok(taskAlertService.createAlert(alert));
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteAlert(@PathVariable Integer id) {
		taskAlertService.deleteTaskAlert(id);
		return ResponseEntity.noContent().build();
	}
}
