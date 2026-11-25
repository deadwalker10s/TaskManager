<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- mode is set by the controller: "add" or "edit" --%>
<c:set var="isEdit" value="${mode == 'edit'}" />

<div class="task-tabs">
	<a href="#" class="tab-btn"
		onclick="loadTaskPage('${pageContext.request.contextPath}/api/tasks/lists?view=tasklist', this); return false;">Task
		List</a> | <a href="#" class="tab-btn ${isEdit ? '' : 'active'}"
		onclick="loadTaskPage('${pageContext.request.contextPath}/api/tasks/addform?view=taskform', this); return false;">Add
		Task</a>
	<c:if test="${isEdit}">
		| <a href="#" class="tab-btn active" onclick="return false;">Edit
			Task</a>
	</c:if>
</div>

<!--begin::App Content Header-->
<div class="app-content-header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<h1 class="mb-0 fs-3">${isEdit ? 'Edit Task' : 'Task Creation'}</h1>
			</div>
			<div class="col-sm-6">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb float-sm-end">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">${isEdit ? 'Edit Task' : 'Create Task'}</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="col-md-6 col-md-offset-3">
	<div class="card card-primary card-outline mb-4">
		<div class="card-header">
			<div class="card-title fw-bold">${isEdit ? 'Edit Task' : 'Create Task'}</div>
		</div>

		<form id="TaskCreationForm" onsubmit="return false;">

			<%-- id is only sent in edit mode --%>
			<c:if test="${isEdit}">
				<input type="hidden" id="taskId" name="taskId"
					value="${task.taskId}" />
			</c:if>

			<div class="card-body">
				<div class="mb-3">
					<label for="inputTitle" class="form-label fw-bold">Title</label> <input
						type="text" class="form-control" id="inputTitle" name="taskTitle"
						value="<c:out value='${task.taskTitle}'/>" required />
				</div>

				<div class="mb-3">
					<label for="inputDescription" class="form-label fw-bold">Description</label>
					<input type="text" class="form-control" id="inputDescription"
						name="taskDescription"
						value="<c:out value='${task.taskDescription}'/>" required />
				</div>

				<div class="mb-3">
					<label class="form-label d-block fw-bold">Priority Level</label>

					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityCritical" value="CRITICAL"
							${task.taskPriority == 'CRITICAL' ? 'checked' : ''} required />
						<label class="form-check-label" for="priorityCritical">Critical</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityHigh" value="HIGH"
							${task.taskPriority == 'HIGH' ? 'checked' : ''} /> <label
							class="form-check-label" for="priorityHigh">High</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityMedium" value="MEDIUM"
							${task.taskPriority == 'MEDIUM' ? 'checked' : ''} /> <label
							class="form-check-label" for="priorityMedium">Medium</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="taskPriority"
							id="priorityLow" value="LOW"
							${task.taskPriority == 'LOW' ? 'checked' : ''} /> <label
							class="form-check-label" for="priorityLow">Low</label>
					</div>
				</div>

				<div class="input-group mb-3">
					<select class="form-select" id="inputGroupSelect02"
						name="taskStatus" required>
						<option value="" ${isEdit ? '' : 'selected'} disabled>Choose
							option...</option>
						<option value="COMPLETED"
							${task.taskStatus == 'COMPLETED' ? 'selected' : ''}>Completed</option>
						<option value="INPROGRESS"
							${task.taskStatus == 'INPROGRESS' ? 'selected' : ''}>InProgress</option>
						<option value="ONHOLD"
							${task.taskStatus == 'ONHOLD' ? 'selected' : ''}>OnHold</option>
					</select> <label class="input-group-text" for="inputGroupSelect02">Completion
						Type</label>
				</div>

				<div class="card-footer">
					<button type="submit" class="btn btn-primary"
						onclick="submitTaskForm(event)">${isEdit ? 'Update' : 'Submit'}</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	// Remove this block if submitTaskForm already exists in your main JS
	function submitTaskForm(event) {
		event.preventDefault();

		var form = document.getElementById('TaskCreationForm');
		if (!form.checkValidity()) {
			form.reportValidity();
			return;
		}

		var taskIdField = document.getElementById('taskId'); // null in add mode
		var isEdit = taskIdField !== null;
		var base = '${pageContext.request.contextPath}/api/tasks';

		var data = {
			title : form.taskTitle.value,
			description : form.taskDescription.value,
			priority : form.taskPriority.value,
			status : form.taskStatus.value
		};

		fetch(isEdit ? base + '/' + taskIdField.value : base, {
			method : isEdit ? 'PUT' : 'POST',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(data)
		}).then(function(r) {
			if (!r.ok) {
				throw new Error('Request failed: ' + r.status);
			}
			return r.json();
		}).then(function() {
			loadTaskPage(base + '/lists?view=tasklist');
		}).catch(function(err) {
			alert(err.message);
		});
	}
</script>
