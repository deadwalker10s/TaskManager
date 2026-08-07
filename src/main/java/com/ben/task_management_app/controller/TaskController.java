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
import org.springframework.web.bind.annotation.RestController;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.service.TaskService;

/**
 * 
 */
@RestController
@RequestMapping("/api/tasks")
@CrossOrigin(originPatterns = "*")
public class TaskController {

	private final TaskService taskService;

	public TaskController(TaskService taskService) {
		super();
		this.taskService = taskService;
	}

	@GetMapping
	public ResponseEntity<List<Task>> getAllTasks() {
		return ResponseEntity.ok(taskService.getAllTasks());
	}

	@GetMapping("/{id}")
	public ResponseEntity<Task> getTaskById(@PathVariable("id") Integer id) {
		return ResponseEntity.ok(taskService.getTaskById(id));
	}

	@PostMapping
	public ResponseEntity<Task> createTask(@RequestBody Task task) {
		return ResponseEntity.ok(taskService.createTask(task));
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteTask(@PathVariable("id") Integer id) {
		taskService.deleteTask(id);
		return ResponseEntity.noContent().build();
	}
}
