/**
 * 
 */
package com.ben.task_management_app.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.service.TaskService;

import jakarta.servlet.http.HttpServletRequest;

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

	/*
	 * @GetMapping("/lists") public ModelAndView getAllTasks() { ModelAndView
	 * modelAndView = new ModelAndView("tasklist"); List<Task> tasks =
	 * taskService.getAllTasks(); modelAndView.addObject("tasks", tasks); return
	 * modelAndView; }
	 */

	@GetMapping("/lists")
	public ModelAndView getTaskListPage() {
		return new ModelAndView("tasklist");
	}

	@GetMapping("/json") // raw data for Tabulator
	@ResponseBody
	public List<Task> getAllTasksJson() {

		return taskService.getAllTasks();
	}

	@GetMapping("/addform")
	public ModelAndView getAddTaskForm() {
		ModelAndView modelAndView = new ModelAndView("taskform");
		modelAndView.addObject("task", new Task());
		return modelAndView;
	}

	// get Task statistics
	@GetMapping("/stats")
	@ResponseBody
	public Object dashboardStats(HttpServletRequest request) {
		// 1. Fetch the raw map statistics from your service
		Map<String, Object> dataMetrics = taskService.getDashboardStats();

		// 2. Check if the incoming request specifies a target view parameter
		String view = request.getParameter("view");
		if (view != null && !view.isBlank()) {
			// Serve the JSP file view directly ("taskdashboard" or "taskform")
			ModelAndView modelAndView = new ModelAndView(view);

			// Pack data variables so they are accessible using standard JSP EL expression
			// tags like ${totalTasks}
			modelAndView.addObject("totalTasks", dataMetrics.get("totalTasks"));
			modelAndView.addObject("completedTasks", dataMetrics.get("completedTasks"));
			modelAndView.addObject("completionRate", dataMetrics.get("completionRate"));
			modelAndView.addObject("inProgressTasks", dataMetrics.get("inProgressTasks"));
			modelAndView.addObject("onHoldTasks", dataMetrics.get("onHoldTasks"));
			modelAndView.addObject("alert", dataMetrics.get("alert"));
			modelAndView.addObject("users", dataMetrics.get("users"));
			return modelAndView;
		}

		// 3. If NO view parameter is provided, return the raw Map data as JSON (for
		// your JS fetch call)
		return dataMetrics;
	}

	@GetMapping("/{id}")
	public ResponseEntity<Task> getTaskById(@PathVariable("id") Integer id) {
		return ResponseEntity.ok(taskService.getTaskById(id));
	}

	@PostMapping
	public Object createTask(@ModelAttribute Task task, HttpServletRequest request) {
		System.out.println("Received task: " + task);
		// 1. Save the new task to the database via your service layer
		taskService.createTask(task);

		// 2. Fetch fresh dashboard data metrics to display on the reloaded dashboard
		// view
		Map<String, Object> dataMetrics = taskService.getDashboardStats();

		// 3. Return the taskdashboard view immediately so the UI refreshes with updated
		// counts
		ModelAndView modelAndView = new ModelAndView("taskdashboard");
		modelAndView.addObject("totalTasks", dataMetrics.get("totalTasks"));
		modelAndView.addObject("completedTasks", dataMetrics.get("completedTasks"));
		modelAndView.addObject("completionRate", dataMetrics.get("completionRate"));
		modelAndView.addObject("inProgressTasks", dataMetrics.get("inProgressTasks"));
		modelAndView.addObject("onHoldCount", dataMetrics.get("onHoldTasks"));

		return modelAndView;
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteTask(@PathVariable("id") Integer id) {
		taskService.deleteTask(id);
		return ResponseEntity.noContent().build();
	}
}
