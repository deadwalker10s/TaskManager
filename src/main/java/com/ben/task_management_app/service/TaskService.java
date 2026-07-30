/**
 * 
 */
package com.ben.task_management_app.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.repository.TaskRepository;

/**
 * 
 */
@Service
public class TaskService {

	private final TaskRepository taskRepository;

	public TaskService(TaskRepository taskRepository) {
		super();
		this.taskRepository = taskRepository;
	}

	// Retrieve all users
	public List<Task> getAllTasks() {
		return taskRepository.findAll();
	}

	// find user by ID
	public Task getTaskById(Integer id) {
		return taskRepository.findById(id).orElseThrow(() -> new RuntimeException("Task not found with id: " + id));
	}

	// create or save new Task
	public Task createTask(Task task) {
		return taskRepository.save(task);
	}

	// delete an Task
	public void deleteTask(Integer id) {
		if (!taskRepository.existsById(id)) {
			throw new RuntimeException("Task not found with Id :" + id);
		}
		taskRepository.deleteById(id);
	}

}
