/**
 * 
 */
package com.ben.task_management_app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.model.TaskAlert;
import com.ben.task_management_app.model.User;
import com.ben.task_management_app.model.enums.TaskStatus;
import com.ben.task_management_app.repository.TaskAlertRepository;
import com.ben.task_management_app.repository.TaskRepository;
import com.ben.task_management_app.repository.UserRepository;

/**
 * 
 */
@Service
public class TaskService {

	private final TaskRepository taskRepository;
	private final TaskAlertRepository taskAlertRepository;
	private final UserRepository userRepository;

	public TaskService(TaskRepository taskRepository, UserRepository userRepository,
			TaskAlertRepository taskAlertRepository) {
		super();
		this.taskRepository = taskRepository;
		this.userRepository = userRepository;
		this.taskAlertRepository = taskAlertRepository;
	}

	// Retrieve all users
	public List<Task> getAllTasks() {
		return taskRepository.findAll();
	}

	// get Task statistics
	public Map<String, Object> getDashboardStats() {
		List<Task> allTasks = getAllTasks();
		int total = allTasks.size();

		long completed = allTasks.stream().filter(task -> task.getTaskStatus() == TaskStatus.COMPLETED).count();

		long inProgress = allTasks.stream().filter(task -> task.getTaskStatus() == TaskStatus.INPROGRESS).count();

		long onHold = allTasks.stream().filter(task -> task.getTaskStatus() == TaskStatus.ONHOLD).count();

		int completionRate = total == 0 ? 0 : (int) Math.round((completed * 100.0) / total);
		long activeUsers = userRepository.count();
		long allAlerts = taskAlertRepository.count();

		Map<String, Object> stats = new HashMap<>();
		stats.put("totalTasks", total);
		stats.put("completedTasks", completed);
		stats.put("inProgressTasks", inProgress);
		stats.put("onHoldTasks", onHold);
		stats.put("completionRate", completionRate);
		stats.put("alert", allAlerts);
		stats.put("users", activeUsers);

		return stats;
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
