<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="task-tabs">

	<a href="#" class="tab-btn"
		onclick="loadTaskPage('${pageContext.request.contextPath}/api/tasks/lists?view=tasklist', this); return false;">Task
		List</a> | <a href="#" class="tab-btn active"
		onclick="loadTaskPage('${pageContext.request.contextPath}/api/tasks/addform?view=taskform', this); return false;">
		Add Task </a>

</div>

<!--begin::App Content Header-->
<div class="app-content-header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<h1 class="mb-0 fs-3">Task Creation</h1>
			</div>
			<div class="col-sm-6">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb float-sm-end">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Create
							Task</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="col-md-6  col-md-offset-3">
	<div class="card card-primary card-outline mb-4">
		<div class="card-header">
			<div class="card-title fw-bold">Create Task</div>
		</div>
		<form id="TaskCreationForm" onsubmit="return false;">
			<div class="card-body">
				<div class="mb-3">
					<label for="inputTitle" class="form-label fw-bold">Title</label> <input
						type="text" class="form-control" id="inputTitle" name="taskTitle" />
				</div>
				<div class="mb-3">
					<label for="inputDescription" class="form-label fw-bold">Description</label>
					<input type="text" class="form-control" id="inputDescription"
						name="taskDescription" />
				</div>

				<div class="mb-3">
					<label class="form-label d-block fw-bold">Priority Level</label>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityCritical" value="CRITICAL" required /> <label
							class="form-check-label" for="priorityCritical">Critical</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityHigh" value="HIGH" /> <label
							class="form-check-label" for="priorityHigh">High</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityMedium" value="MEDIUM" /> <label
							class="form-check-label" for="priorityMedium">Medium</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityLow" value="LOW" /> <label class="form-check-label"
							for="priorityLow">Low</label>
					</div>
				</div>

				<div class="input-group mb-3">
					<select class="form-select" id="inputGroupSelect02"
						name="taskStatus">
						<option selected disabled>Choose option...</option>
						<option value="COMPLETED">Completed</option>
						<option value="INPROGRESS">InProgress</option>
						<option value="ONHOLD">OnHold</option>
					</select> <label class="input-group-text" for="inputGroupSelect02">Completion
						Type</label>
				</div>

				<div class="card-footer">
					<button type="submit" class="btn btn-primary"
						onclick="javascript:submitTaskForm(event)">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	
</script>