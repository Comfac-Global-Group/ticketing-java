<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.util.Base64"%>


<%
HttpSession httpSession = request.getSession();

String firstName = (String) session.getAttribute("firstName");
String middleInitial = (String) session.getAttribute("middleInitial");
String lastName = (String) session.getAttribute("lastName");
String suffix = (String) session.getAttribute("suffix");
String profilePic = (String) session.getAttribute("profilePic");
String username = (String) session.getAttribute("username");
%>

<head>
<link rel="icon" href="img/logo2.png" type="image/x-icon">
</head>

    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #595959;">
        <div class="container-fluid">
            <!-- System Name (Upper Left Corner) -->
            <a class="navbar-brand" href="tickets">
                <img src="img/Ticket-Logo-3.png" height="40px" alt="Logo"> CGG NEXUS
            </a>

            <!-- Navbar Toggler (for responsive behavior) -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar Content (Upper Right Corner) -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto">
                    <!-- User Profile Picture -->
                    <li class="nav-item">
                     <img
					src="<%=session.getAttribute("profilePic") != null
		? "data:image/jpeg;base64," + session.getAttribute("profilePic")
		: request.getContextPath() + "/img/default.jpg"%>"
					alt="User Profile" class="nav-link rounded-circle"
					style="width: 50px; height: 50px;">
                    </li>

                    <!-- User Name -->
                    <li class="nav-item">
                     <a class="nav-link" href="User_Profile.jsp"><%=firstName + " " + (middleInitial != null ? middleInitial + ". " : "") + lastName%></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<style>
.sidebar-link:hover, .sidebar-footer:hover {
	background-color: white;
	color: #FFF;
	/* Set the desired text color for hover state */
}
</style>

<div class="wrapper">
	<aside id="sidebar">
		<div class="d-flex">
			<button class="toggle-btn" type="button">
				<i class="lni lni-grid-alt"></i>
			</button>

		</div>
		<ul class="sidebar-nav">
			<li class="sidebar-item"><a href="tickets"
				class="sidebar-link"> <i class="fa-solid fa-house"></i> <span><strong>TICKETS</strong></span>
			</a></li>
			<li class="sidebar-item"><a href="resolvedtickets.jsp"
				class="sidebar-link"> <i class="fa-solid fa-star"></i> <span><strong>RESOLVED
							TICKETS</strong></span>
			</a></li>
			<li class="sidebar-item"><a href="User_Profile.jsp"
				class="sidebar-link"> <i class="fa fa-gear"></i> <span><strong>SETTINGS</strong></span>
			</a></li>
			<hr style="border-color: white;">
			<div class="sidebar-item">
				<a href="login.jsp" class="sidebar-link"> <i
					class="fa-solid fa-right-from-bracket"></i> <span><strong>LOGOUT</strong></span>
				</a>
			</div>
		</ul>
	</aside>
	<!DOCTYPE html>
	<html lang="en">

<head>
<title>Edit Profile</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/sidebar_navbar.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.lineicons.com/3.0/lineicons.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery and DataTables JavaScript -->
<script defer src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script defer src="js/script.js"></script>

</head>
<style>
body h2 {
	font-family: "Arial", sans-serif;
}

.container {
	margin-top: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 800px;
	/* Increased max-width for better spacing */
	margin: 0 auto;
	/* Center the container */
}

label {
	margin-top: 10px;
	margin-bottom: 5px;
	color: #555;
}

input {
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	width: 100%;
}

button {
	background-color: #007BFF;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

.logs-container {
	margin-top: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	max-width: 800px;
	margin: 0 auto;
}

.nav-tabs-bordered .nav-link:hover {
	background-color: #007bff;
	/* Replace with your preferred color */
	color: #fff;
	/* Text color on hover */
}

/* The message box is shown when the user clicks on the password field */
#message {
	display: none;
	background: #f1f1f1;
	color: #000;
	position: relative;
	padding: 15px;
	margin-top: 9px;
}

#message p {
	padding: 9px 30px;
	font-size: 14px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

.valid:before {
	position: relative;
	left: -35px;
	content: "\2713";
}

/*copy & paste symbol*/
/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color	: red;
}

.invalid:before {
	position: relative;
	left: -35px;
	content: "\274C";
}
</style>
</head>
