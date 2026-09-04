<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--begin::App Content Header-->
<div class="app-content-header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6">
				<h1 class="mb-0 fs-3">Task Management</h1>
			</div>
			<div class="col-sm-6">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb float-sm-end">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Dashboard</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>
<!--end::App Content Header-->

<!--begin::App Content-->
<div class="app-content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-primary">
					<div class="inner">
						<h3 id="total-tasks-count">--</h3>
						<p>Total Tasks</p>
					</div>
					<svg class="small-box-icon" fill="currentColor" viewBox="0 0 24 24"
						xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
							<path
							d="M2.25 2.25a.75.75 0 000 1.5h1.386c.17 0 .318.114.362.278l2.558 9.592a3.752 3.752 0 00-2.806 3.63c0 .414.336.75.75.75h15.75a.75.75 0 000-1.5H5.378A2.25 2.25 0 017.5 15h11.218a.75.75 0 00.674-.421 60.358 60.358 0 002.96-7.228.75.75 0 00-.525-.965A60.864 60.864 0 005.68 4.509l-.232-.867A1.875 1.875 0 003.636 2.25H2.25zM3.75 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0zM16.5 20.25a1.5 1.5 0 113 0 1.5 1.5 0 01-3 0z"></path>
						</svg>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-success">
					<div class="inner">
						<h3 id="completed-tasks-count">--</h3>
						<p>Completed Tasks</p>
					</div>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-secondary">
					<div class="inner">
						<h3>
							<span id="completion-rate">--</span><sup class="fs-5">%</sup>
						</h3>
						<p>Completion Rate</p>
					</div>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-warning">
					<div class="inner">
						<h3 id="in-progress-count">--</h3>
						<p>Inprogress Tasks</p>
					</div>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-light">
					<div class="inner">
						<h3 id="on-hold-count">--</h3>
						<p>Task On Hold</p>
					</div>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-danger">
					<div class="inner">
						<h3 id="alerts-count">65</h3>
						<p>Alerts</p>
					</div>
					<a href="#" class="small-box-footer link-light">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>

			<div class="col-lg-3 col-6">
				<div class="small-box text-bg-info">
					<div class="inner">
						<h3 id="active-users-count">44</h3>
						<p>Active Users</p>
					</div>
					<a href="#" class="small-box-footer link-dark">More info <i
						class="bi bi-link-45deg"></i></a>
				</div>
			</div>
		</div>
		<!--end::Row-->

		<div class="row">
			<div class="col-lg-7 connectedSortable">
				<div class="card mb-4">
					<div class="card-header">
						<h3 class="card-title">Tasks Managed</h3>
					</div>
					<div class="card-body">
						<div id="revenue-chart"></div>
					</div>
				</div>
			</div>
		</div>
		<!--end::Row-->
	</div>
	<!--end::Container-->
</div>
<!--end::App Content-->


<script>
function loadDashboardStats() {
    // Hits the controller and returns raw JSON data because NO ?view parameter is passed
    fetch("${pageContext.request.contextPath}/api/tasks/stats")
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok: " + response.status);
            }
            return response.json();
        })
        .then(data => {
            document.getElementById("total-tasks-count").textContent = data.totalTasks;
            document.getElementById("completed-tasks-count").textContent = data.completedTasks;
            document.getElementById("completion-rate").textContent = data.completionRate;
            document.getElementById("in-progress-count").textContent = data.inProgressTasks;
            document.getElementById("on-hold-count").textContent = data.onHoldTasks;
        })
        .catch(error => {
            console.error("Failed to load dashboard stats:", error);
        });
}

document.addEventListener("DOMContentLoaded", loadDashboardStats);
</script>