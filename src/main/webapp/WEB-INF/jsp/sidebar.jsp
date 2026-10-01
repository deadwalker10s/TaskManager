<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--begin::Sidebar-->
<aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark">
	<!--begin::Sidebar Brand-->
	<div class="sidebar-brand">
		<!--begin::Brand Link-->
		<a href="./index.html" class="brand-link"> <!--begin::Brand Image-->
			<!-- <img
              src="./assets/img/AdminLTELogo.png"
              alt="AdminLTE Logo"
              class="brand-image opacity-75 shadow"
            /> --> <!--end::Brand Image--> <!--begin::Brand Text--> <span
			class="brand-text fw-light">Task Manager</span> <!--end::Brand Text-->
		</a>
		<!--end::Brand Link-->
	</div>
	<!--end::Sidebar Brand-->
	<!--begin::Sidebar Wrapper-->
	<div class="sidebar-wrapper">
		<nav class="mt-2" aria-label="Main navigation">
			<!--begin::Sidebar Menu-->
			<ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview"
				data-accordion="false" id="navigation">
				<li class="nav-item menu-open"><a href="#"
					class="nav-link active"> <i class="nav-icon bi bi-speedometer"></i>
						<p>
							Task Management <i class="nav-arrow bi bi-chevron-right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#"
							onclick="loadDashboard(event);" class="nav-link active"> <i
								class="nav-icon bi bi-list-task"></i>
								<p>Dashboard</p>
						</a></li>
						<li class="nav-item"><a href="#"
							onclick="loadAlertForm(event);" class="nav-link"> <i
								class="nav-icon bi bi-bell"></i>
								<p>Alert</p>
						</a></li>
						<li class="nav-item"><a href="#" onclick="loadTask(event);"
							class="nav-link"> <i class="nav-icon bi bi-pencil-square"></i>
								<p>Task</p>
						</a></li>
					</ul></li>

				<li class="nav-header">SETTINGS</li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon bi bi-file-earmark-text"></i>
						<p>
							Pages <i class="nav-arrow bi bi-chevron-right"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="dist/pages/profile.html"
							class="nav-link"> <i class="nav-icon bi bi-person-circle"></i>
								<p>Profile</p>
						</a></li>
						<li class="nav-item"><a href="dist/pages/settings.html"
							class="nav-link"> <i class="nav-icon bi bi-gear-fill"></i>
								<p>Settings</p>
						</a></li>
						<li class="nav-item"><a href="dist/generate/theme.html"
							class="nav-link"> <i class="nav-icon bi bi-palette"></i>
								<p>Theme Generate</p>
						</a></li>
						<li class="nav-item"><a href="dist/pages/calendar.html"
							class="nav-link"> <i class="nav-icon bi bi-calendar"></i>
								<p>Calendar</p>
						</a></li>
						<li class="nav-item"><a href="dist/pages/kanban.html"
							class="nav-link"> <i class="nav-icon bi bi-kanban-fill"></i>
								<p>Kanban</p>
						</a></li>
						<li class="nav-item"><a href="dist/pages/file-manager.html"
							class="nav-link"> <i class="nav-icon bi bi-folder2-open"></i>
								<p>File Manager</p>
						</a></li>
						<li class="nav-item"><a href="dist/pages/projects.html"
							class="nav-link"> <i class="nav-icon bi bi-card-checklist"></i>
								<p>Projects</p>
						</a></li>
						<!-- ERROR AND MAINTENANCE PAGES -->
						<!-- <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="nav-icon bi bi-circle"></i>
                      <p>Error <i class="nav-arrow bi bi-chevron-right"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="dist/pages/404.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>404</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="dist/pages/500.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>500</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="dist/pages/maintenance.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Maintenance</p>
                        </a>
                      </li>
                    </ul>
                  </li> -->
					</ul></li>
				<li class="nav-item"><a href="users.html" class="nav-link">
						<i class="nav-icon bi bi-people"></i>
						<p>Users</p>
				</a></li>
				<!-- AUTHENTICATION PAGES -->
				<!-- <li class="nav-header">EXAMPLES</li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="nav-icon bi bi-box-arrow-in-right"></i>
                  <p>Auth <i class="nav-arrow bi bi-chevron-right"></i></p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="nav-icon bi bi-box-arrow-in-right"></i>
                      <p>
                        Version 1 <i class="nav-arrow bi bi-chevron-right"></i>
                      </p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="./examples/login.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Login</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="./examples/register.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Register</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a
                          href="./examples/forgot-password.html"
                          class="nav-link"
                        >
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Forgot Password</p>
                        </a>
                      </li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="nav-icon bi bi-box-arrow-in-right"></i>
                      <p>
                        Version 2 <i class="nav-arrow bi bi-chevron-right"></i>
                      </p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="./examples/login-v2.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Login</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="./examples/register-v2.html" class="nav-link">
                          <i class="nav-icon bi bi-circle"></i>
                          <p>Register</p>
                        </a>
                      </li>
                    </ul>
                  </li> -->
				<!-- LOCKSCREEN -->
				<li class="nav-item"><a href="dist/examples/lockscreen.html"
					class="nav-link"> <i class="nav-icon bi bi-lock"></i>
						<p>Lockscreen</p>
				</a></li>
			</ul>
			</li>
			</ul>
			<!--end::Sidebar Menu-->
			<!-- Docs CTA (bottom of sidebar) -->
			<div class="p-3 mt-3 border-top border-secondary border-opacity-25">
				<a href="./docs/introduction.html"
					class="btn btn-sm btn-outline-light w-100 d-flex align-items-center justify-content-center gap-2">
					<i class="bi bi-book" aria-hidden="true"></i> View documentation
				</a>
			</div>
		</nav>
	</div>
	<!--end::Sidebar Wrapper-->
</aside>
<!--end::Sidebar-->