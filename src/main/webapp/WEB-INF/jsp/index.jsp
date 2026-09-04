<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Task Manager | Dashboard</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!--begin::Theme Init (prevents flash of incorrect theme on load, #6043)-->
<script>
      (() => {
        'use strict';
        const STORAGE_KEY = 'lte-theme';
        let stored = null;
        try {
          stored = localStorage.getItem(STORAGE_KEY);
        } catch {
          // localStorage may be unavailable (private mode, sandboxed iframe).
        }
        const prefersDark = globalThis.matchMedia('(prefers-color-scheme: dark)').matches;
        // Mirror the resolution in _scripts.astro: explicit "dark"/"light" win,
        // otherwise ("auto" or unset) fall back to the OS preference.
        let resolved = 'light';
        if (stored === 'dark' || stored === 'light') {
          resolved = stored;
        } else if (prefersDark) {
          resolved = 'dark';
        }
        document.documentElement.setAttribute('data-bs-theme', resolved);
        document.documentElement.style.colorScheme = resolved;
      })();
    </script>
<!--end::Theme Init-->

<!--begin::Accessibility Meta Tags-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<meta name="color-scheme" content="light dark" />
<meta name="theme-color" content="#007bff"
	media="(prefers-color-scheme: light)" />
<meta name="theme-color" content="#1a1a1a"
	media="(prefers-color-scheme: dark)" />
<!--end::Accessibility Meta Tags-->

<!--begin::Primary Meta Tags-->
<meta name="title" content="AdminLTE v4 | Dashboard" />
<meta name="author" content="ColorlibHQ" />
<meta name="description"
	content="AdminLTE is a free Bootstrap 5 admin dashboard template with almost 50 example pages, built with vanilla JS and designed with accessibility in mind." />
<meta name="keywords"
	content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard, accessible admin panel" />
<!--end::Primary Meta Tags-->

<!--begin::Accessibility Features-->
<!-- Skip links will be dynamically added by accessibility.js -->
<meta name="supported-color-schemes" content="light dark" />
<link rel="preload" href="./css/adminlte.css" as="style" />
<!--end::Accessibility Features-->

<!--begin::Fonts-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
	integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q="
	crossorigin="anonymous" media="print" onload="this.media = 'all'" />
<!--end::Fonts-->

<!--begin::Third Party Plugin(OverlayScrollbars)-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css"
	crossorigin="anonymous" />
<!--end::Third Party Plugin(OverlayScrollbars)-->

<!--begin::Third Party Plugin(Bootstrap Icons)-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
	crossorigin="anonymous" />
<!--end::Third Party Plugin(Bootstrap Icons)-->

<!--begin::Required Plugin(AdminLTE)-->
<link rel="stylesheet" href="./css/adminlte.css" />
<!--end::Required Plugin(AdminLTE)-->

<!-- apexcharts -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css"
	integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0="
	crossorigin="anonymous" />

<!-- jsvectormap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css"
	integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4="
	crossorigin="anonymous" />
</head>
<!--end::Head-->
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
	<!--begin::App Wrapper-->
	<div class="app-wrapper">
		<!--begin::Header-->
		<nav class="app-header navbar navbar-expand bg-body">
			<!--begin::Container-->
			<div class="container-fluid">
				<!--begin::Start Navbar Links-->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						data-lte-toggle="sidebar" href="#" role="button"
						aria-label="Toggle sidebar"> <i class="bi bi-list"></i>
					</a></li>

					<li class="nav-item d-none d-md-block"><a href="#"
						class="nav-link"> <i class="bi bi-grid-1x2 me-1"
							aria-hidden="true"></i> Live preview
					</a></li>
				</ul>
				<!--end::Start Navbar Links-->

				<!--begin::End Navbar Links-->
				<ul class="navbar-nav ms-auto">
					<!--begin::Notifications Dropdown Menu-->
					<li class="nav-item dropdown"><a class="nav-link"
						data-bs-toggle="dropdown" href="#"
						aria-label="Notifications: 15 unread"> <i
							class="bi bi-bell-fill"></i> <span
							class="navbar-badge badge text-bg-warning">15</span>
					</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
							<span class="dropdown-item dropdown-header">15
								Notifications</span>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"> <i
								class="bi bi-envelope me-2"></i> 4 new messages <span
								class="float-end text-secondary fs-7">3 mins</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"> <i
								class="bi bi-people-fill me-2"></i> 8 friend requests <span
								class="float-end text-secondary fs-7">12 hours</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"> <i
								class="bi bi-file-earmark-fill me-2"></i> 3 new reports <span
								class="float-end text-secondary fs-7">2 days</span>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item dropdown-footer"> See All
								Notifications </a>
						</div></li>
					<!--end::Notifications Dropdown Menu-->

					<!--begin::Fullscreen Toggle-->
					<li class="nav-item"><a class="nav-link" href="#"
						data-lte-toggle="fullscreen" aria-label="Toggle fullscreen"> <i
							data-lte-icon="maximize" class="bi bi-arrows-fullscreen"></i> <i
							data-lte-icon="minimize" class="bi bi-fullscreen-exit d-none"></i>
					</a></li>
					<!--end::Fullscreen Toggle-->

					<!--begin::Color Mode Toggle (#6010)-->
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="bd-theme" aria-label="Toggle color scheme"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="bi bi-sun-fill" data-lte-theme-icon="light"></i> <i
							class="bi bi-moon-fill d-none" data-lte-theme-icon="dark"></i> <i
							class="bi bi-circle-half d-none" data-lte-theme-icon="auto"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="bd-theme" style="--bs-dropdown-min-width: 8rem">
							<li>
								<button type="button"
									class="dropdown-item d-flex align-items-center"
									data-bs-theme-value="light" aria-pressed="false">
									<i class="bi bi-sun-fill me-2"></i> Light <i
										class="bi bi-check-lg ms-auto d-none"></i>
								</button>
							</li>
							<li>
								<button type="button"
									class="dropdown-item d-flex align-items-center"
									data-bs-theme-value="dark" aria-pressed="false">
									<i class="bi bi-moon-fill me-2"></i> Dark <i
										class="bi bi-check-lg ms-auto d-none"></i>
								</button>
							</li>
							<li>
								<button type="button"
									class="dropdown-item d-flex align-items-center active"
									data-bs-theme-value="auto" aria-pressed="true">
									<i class="bi bi-circle-half me-2"></i> Auto <i
										class="bi bi-check-lg ms-auto d-none"></i>
								</button>
							</li>
						</ul></li>
					<!--end::Color Mode Toggle-->

					<!--begin::User Menu Dropdown-->
					<li class="nav-item dropdown user-menu"><a href="#"
						class="nav-link dropdown-toggle" data-bs-toggle="dropdown"> <img
							src="./assets/img/user2-160x160.jpg"
							class="user-image rounded-circle shadow" alt="Alexander Pierce" />
							<span class="d-none d-md-inline">Alexander Pierce</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
							<!--begin::User Image-->
							<li class="user-header text-bg-primary"><img
								src="./assets/img/user2-160x160.jpg"
								class="rounded-circle shadow" alt="Alexander Pierce" />
								<p>
									Alexander Pierce - Web Developer <small>Member since
										Nov. 2023</small>
								</p></li>
							<!--end::User Image-->
							<!--begin::Menu Body-->
							<li class="user-body">
								<!--begin::Row-->
								<div class="row">
									<div class="col-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-4 text-center">
										<a href="#">Friends</a>
									</div>
								</div> <!--end::Row-->
							</li>
							<!--end::Menu Body-->
							<!--begin::Menu Footer-->
							<li class="user-footer"><a href="#"
								class="btn btn-outline-secondary">Profile</a> <a href="#"
								class="btn btn-outline-danger float-end">Sign out</a></li>
							<!--end::Menu Footer-->
						</ul></li>
					<!--end::User Menu Dropdown-->
				</ul>
				<!--end::End Navbar Links-->
			</div>
			<!--end::Container-->
		</nav>
		<!--end::Header-->
		<!--begin::Sidebar-->
		<jsp:include page="sidebar.jsp" />
		<!--end::Sidebar-->
		<!--begin::App Main-->
		<!-- Added id="app-main" -->
		<main class="app-main" id="app-main">
			<jsp:include page="taskdashboard.jsp" />
		</main>
		<!--end::App Main-->
		<!--begin::Footer-->
		<footer class="app-footer">
			<!--begin::To the end-->
			<div class="float-end d-none d-sm-inline">Anything you want</div>
			<!--end::To the end-->
			<!--begin::Copyright-->
			<strong> Copyright &copy; 2014-2026&nbsp; <a
				href="https://adminlte.io" class="text-decoration-none">AdminLTE.io</a>.
			</strong> All rights reserved.
			<!--end::Copyright-->
		</footer>
		<!--end::Footer-->
	</div>
	<!--end::App Wrapper-->
	<!--begin::Script-->
	<!--begin::Third Party Plugin(OverlayScrollbars)-->
	<script
		src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js"
		crossorigin="anonymous"></script>
	<!--end::Third Party Plugin(OverlayScrollbars)-->
	<!--begin::Required Plugin(popperjs for Bootstrap 5)-->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		crossorigin="anonymous"></script>
	<!--end::Required Plugin(popperjs for Bootstrap 5)-->
	<!--begin::Required Plugin(Bootstrap 5)-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
		crossorigin="anonymous"></script>
	<!--end::Required Plugin(Bootstrap 5)-->
	<!--begin::Required Plugin(AdminLTE)-->
	<script src="./js/adminlte.js"></script>
	<!--end::Required Plugin(AdminLTE)-->
	<!--begin::OverlayScrollbars Configure-->
	<script>
      const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
      const Default = {
        scrollbarTheme: 'os-theme-light',
        scrollbarAutoHide: 'leave',
        scrollbarClickScroll: true,
      };
      document.addEventListener('DOMContentLoaded', function () {
        const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);

        // Disable OverlayScrollbars on mobile devices to prevent touch interference
        const isMobile = window.innerWidth <= 992;

        if (
          sidebarWrapper &&
          OverlayScrollbarsGlobal?.OverlayScrollbars !== undefined &&
          !isMobile
        ) {
          OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
            scrollbars: {
              theme: Default.scrollbarTheme,
              autoHide: Default.scrollbarAutoHide,
              clickScroll: Default.scrollbarClickScroll,
            },
          });
        }
      });
    </script>
	<!--end::OverlayScrollbars Configure-->

	<!--begin::Color Mode Toggle-->
	<!-- The light/dark/auto switcher ships in adminlte.js as the ColorMode
     module (since 4.1) — no page script needed. Only the no-flash snippet
     in <head> stays inline, because it must run before first paint. -->
	<!--end::Color Mode Toggle-->

	<!-- OPTIONAL SCRIPTS -->

	<!-- sortablejs -->
	<script
		src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"
		crossorigin="anonymous"></script>
	<!-- sortablejs -->
	<script>
      new Sortable(document.querySelector('.connectedSortable'), {
        group: 'shared',
        handle: '.card-header',
      });

      const cardHeaders = document.querySelectorAll('.connectedSortable .card-header');
      cardHeaders.forEach((cardHeader) => {
        cardHeader.style.cursor = 'move';
      });
    </script>
	<!-- jsvectormap -->

	<script>
	//Function 1: Fetch and display the empty Task Form layout view
	function loadTaskForm(event) {
	    event.preventDefault();
	    
	    // Hits your combined stats endpoint to retrieve the taskform HTML fragment securely
	    fetch('${pageContext.request.contextPath}/api/tasks/stats?view=taskform')
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Could not load taskform component view framework');
	            }
	            return response.text();
	        })
	        .then(htmlContent => {
	        	console.log('no Error');
	            // Inject the form layout HTML inside your main body frame container
	            document.querySelector('.app-main').innerHTML = htmlContent;
	        })
	        .catch(error => console.error('Error rendering form view:', error));
	}

	
 function submitTaskForm(event) {
	    event.preventDefault(); // Stop default form submission behavior
	    const $form = $('#TaskCreationForm');
	    const $submitBtn = $form.find('button[type="submit"]');

	    // Disable the submit button to prevent double-clicking
	    $submitBtn.prop('disabled', true);

	    // Serialize all form fields into a URL-encoded text string
	    const formData = $form.serialize();
	    console.log("Query String format:", formData); 
	    $.ajax({
	        url: '${pageContext.request.contextPath}/api/tasks',
	        type: 'POST',
	        data: formData,
	        success: function(dashboardHtml) {
	            // Your controller returns the rendered 'taskdashboard' HTML layout.
	            // Instantly inject it into your main window frame container:
	            $('.app-main').html(dashboardHtml);
	        },
	        error: function(xhr, status, error) {
	            // Re-enable button on error so user can correct and retry
	            $submitBtn.prop('disabled', false);
	            console.error("Task submission failed:", error);
	            alert("Failed to create the task. Please try again.");
	        }
	    });
	}


</script>
</body>
</html>