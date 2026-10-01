<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="task-tabs">

	<a href="#" class="tab-btn"
		onclick="loadTaskPage('alertlist.jsp', this); return false;">
		Alert List </a> | <a href="#" class="tab-btn active"
		onclick="loadTaskPage('alertform.jsp', this); return false;"> Add
		Alert </a> | <a href="#" class="tab-btn"
		onclick="loadTaskPage('alertedit.jsp', this); return false;"> Edit
		Alert </a>

</div>

<!--begin::App Content Header-->
<div class="app-content-header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<h1 class="mb-0 fs-3">Alert Creation</h1>
			</div>
			<div class="col-sm-6">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb float-sm-end">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Create
							Alert</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="col-md-6">
	<div class="card card-primary card-outline mb-4">
		<div class="card-header">
			<div class="card-title fw-bold">Create Alert</div>
		</div>
		<form id="AlertCreationForm" onsubmit="return false;">
			<div class="card-body">
				<!-- Select task  -->
				<div class="input-group mb-3">
					<select class="form-select" id="inputGroupSelect02"
						name="taskSelect">
						<option selected disabled>Choose Tasks...</option>
					</select> <label class="input-group-text" for="inputGroupSelect02">Tasks
						Selection</label>
				</div>
				<!-- Alert Message -->
				<div class="mb-3">
					<label for="inputMessage" class="form-label fw-bold">Alert
						Message</label> <input type="text" class="form-control" id="inputTitle"
						name="alertMessage" />
				</div>
				<!-- Date and time  -->

				<div class="card-footer">
					<button type="submit" class="btn btn-primary"
						onclick="javascript:submitAlertForm(event)">Submit</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	
</script>