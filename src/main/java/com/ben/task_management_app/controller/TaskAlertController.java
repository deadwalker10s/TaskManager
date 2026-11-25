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
import org.springframework.web.servlet.ModelAndView;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.model.TaskAlert;
import com.ben.task_management_app.service.TaskAlertService;

/**
 * Controller Class for TaskAlert
 */
@RestController
@RequestMapping("api/alerts")
@CrossOrigin(origins = "*")
public class TaskAlertController {

	private final TaskAlertService taskAlertService;

	public TaskAlertController(TaskAlertService taskAlertService) {
		super();
		this.taskAlertService = taskAlertService;
	}

	// listing all the alert
	@GetMapping("/lists")
	public ModelAndView getTaskAlertList() {
		return new ModelAndView("alertlist");
	}

	@GetMapping("/json") // raw data for Tabulator
	@ResponseBody
	public List<TaskAlert> getAllTasksAlertJson() {

		return taskAlertService.getAllAlerts();
	}

	@GetMapping("/addform")
	public ModelAndView getAddTaskForm() {
		ModelAndView modelAndView = new ModelAndView("alertform");
		modelAndView.addObject("task", new Task()); // blank object
		return modelAndView;
	}

	@GetMapping("/editform/{id}")
	public ModelAndView editForm(@PathVariable("id") Integer id) {
		ModelAndView mav = new ModelAndView("alertform");
		mav.addObject("task", taskAlertService.getAlertById(id));
		mav.addObject("mode", "edit");
		return mav;
	}

	@PostMapping
	public ResponseEntity<TaskAlert> createTaskAlert(@RequestBody TaskAlert alert) {
		return ResponseEntity.ok(taskAlertService.createAlert(alert));
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteAlert(@PathVariable("id") Integer id) {
		taskAlertService.deleteTaskAlert(id);
		return ResponseEntity.noContent().build();
	}
}
