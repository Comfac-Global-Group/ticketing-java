<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.util.Base64"%>


<%
HttpSession httpSession = request.getSession();

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
String firstName = (String) session.getAttribute("firstName");
String middleInitial = (String) session.getAttribute("middleInitial");
String lastName = (String) session.getAttribute("lastName");
String suffix = (String) session.getAttribute("suffix");
String company = (String) session.getAttribute("company");
String branch = (String) session.getAttribute("branch");
String department = (String) session.getAttribute("department");
String contact = (String) session.getAttribute("contact");
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

<body>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Change
						Profile Picture</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<input type="file" id="profilePictureInput" accept="image/*"
						required>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<!-- Remove the submit button from here -->
				</div>
			</div>
		</div>
	</div>

	<div class="main p-3">
		<div class="container-fluid">

			<main id="main" class="main">
				<section class="section profile">
					<div class="row">
						<div class="col-xl-4">

							<div class="card">
								<div
									class="card-body profile-card pt-4 d-flex flex-column align-items-center">

									<div class="card" style="width: 15rem; background-color: #555;">
										<img
											src="<%=session.getAttribute("profilePic") != null
		? "data:image/jpeg;base64," + session.getAttribute("profilePic")
		: request.getContextPath() + "/img/default.jpg"%>"
											class="card-img-top" alt="Profile"
											style="max-width: 100%; max-height: 220px;">
									</div>
									<h2><%=firstName + " " + (middleInitial != null ? middleInitial + ". " : "") + lastName%></h2>
								</div>
							</div>
						</div>

						<div class="col-xl-8">

							<div class="card">
								<div class="card-body pt-3">
									<!-- Bordered Tabs -->
									<ul class="nav nav-tabs nav-tabs-bordered">

										<li class="nav-item">
											<button class="nav-link active" data-bs-toggle="tab"
												data-bs-target="#profile-overview">Overview</button>
										</li>
										<li class="nav-item">
											<button class="nav-link" data-bs-toggle="tab"
												data-bs-target="#profile-edit">Edit Profile</button>
										</li>
										<li class="nav-item">
											<button class="nav-link" data-bs-toggle="tab"
												data-bs-target="#profile-change-password">Change
												Password</button>
										</li>

									</ul>
									<div class="tab-content pt-2">
										<div class="tab-pane fade show active profile-overview"
											id="profile-overview">
											<br>
											<h5 class="card-title">
												<b>Profile Details: </b>
											</h5>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-user"></i> First Name:
												</div>
												<div class="col-lg-3 col-md-5"><%=firstName != null ? firstName : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-user"></i> Middle Initial:
												</div>
												<div class="col-lg-3 col-md-5"><%=middleInitial != null ? middleInitial : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-user"></i> Last Name:
												</div>
												<div class="col-lg-3 col-md-5"><%=lastName != null ? lastName : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-user"></i> Suffix:
												</div>
												<div class="col-lg-3 col-md-5"><%=suffix != null ? suffix : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-building"></i> Company:
												</div>
												<div class="col-lg-3 col-md-5"><%=company != null ? company : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-code-branch"></i> Branch:
												</div>
												<div class="col-lg-3 col-md-5"><%=branch != null ? branch : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-users"></i> Department:
												</div>
												<div class="col-lg-3 col-md-5"><%=department != null ? department : "N/A"%></div>
											</div>

											<div class="row">
												<div class="col-lg-4 col-md-5 label">
													<i class="fas fa-phone"></i> Contact Number :
												</div>
												<div class="col-lg-4 col-md-5"><%=contact != null ? contact : "N/A"%></div>
											</div>
										</div>


										<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

											<!-- Profile Edit Form -->
											<!-- Main Form for User Profile -->
											<form method="POST" action="UpdateUserServlet"
												enctype="multipart/form-data">
												<input type="hidden" name="action" value="editUser">
												<input type="hidden" name="username"
													value="<%=username != null ? username : ""%>">

												<!-- Profile Image Input -->
												<div class="row mb-3">
													<label for="profileImage"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-id-badge"></i> Profile Image</label>
													<div class="col-md-8 col-lg-8">
														<input type="file" name="profilePicture" accept="image/*">

														<!-- Check if there is an existing image -->
														<%
														String base64Image = (String) request.getAttribute("base64Image");
														if (base64Image != null && !base64Image.isEmpty()) {
														%>
														<!-- Display the current image using Base64 -->
														<img src="data:image/jpeg;base64,<%=base64Image%>"
															alt="Profile Picture" width="100px" height="100px">
														<%
														}
														%>
														<span id="fileNameDisplay" class="ms-2"></span>
														<!-- Space to display the file name -->
													</div>
												</div>
												<!-- First Name -->
												<div class="row mb-3">
													<label for="	" class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-user"></i> First Name</label>
													<div class="col-md-8 col-lg-8">
														<input name="firstName" type="text" class="form-control"
															id="fullName"
															value="<%=firstName != null ? firstName : ""%>" required>
													</div>
												</div>

												<!-- Middle Initial -->
												<div class="row mb-3">
													<label for="middleInitial"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-user"></i> Middle Initial</label>
													<div class="col-md-8 col-lg-8">
														<input name="middleInitial" type="text"
															class="form-control" id="middleInitial"
															value="<%=middleInitial != null ? middleInitial : ""%>">
													</div>
												</div>

												<!-- Last Name -->
												<div class="row mb-3">
													<label for="lastName"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-user"></i> Last Name</label>
													<div class="col-md-8 col-lg-8">
														<input name="lastName" type="text" class="form-control"
															id="lastName"
															value="<%=lastName != null ? lastName : ""%>" required>
													</div>
												</div>

												<!-- Suffix -->
												<div class="row mb-3">
													<label for="suffix"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-user"></i> Suffix</label>
													<div class="col-md-8 col-lg-8">
														<input name="suffix" type="text" class="form-control"
															value="<%=suffix != null ? suffix : ""%>">
													</div>
												</div>

												<!-- Company -->
												<div class="row mb-3">
													<label for="company"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-building"></i> Company</label>
													<div class="col-md-8 col-lg-8">
														<select name="company" class="form-control" id="company">
															<option value="Comfac Global Group"
																<%="Comfac Global Group".equals(company) ? "selected" : ""%>>Comfac
																Global Group</option>
															<option value="Comfac Technology Options (CTO)"
																<%="Comfac Technology Options (CTO)".equals(company) ? "selected" : ""%>>Comfac
																Technology Options (CTO)</option>
															<option value="Cornersteel Systems Corporation"
																<%="Cornersteel Systems Corporation".equals(company) ? "selected" : ""%>>Cornersteel
																Systems Corporation</option>
															<option value="Energy Specialist Company (ESCO)"
																<%="Energy Specialist Company (ESCO)".equals(company) ? "selected" : ""%>>Energy
																Specialist Company (ESCO)</option>
															<option value="Test"
																<%="Test".equals(company) ? "selected" : ""%>>Test</option>
														</select>
													</div>
												</div>
												<div class="row mb-3" id="branchGroup"
													style="display: none;">
													<label for="branch"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-code-branch"></i> Branch</label>
													<div class="col-md-8 col-lg-8">
														<select name="branch" class="form-control" id="branch">
															<option value="<%=branch != null ? branch : "N/A"%>"
																selected></option>
														</select>
													</div>
												</div>

												<div class="row mb-3">
													<label for="department"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-users"></i> Department</label>
													<div class="col-md-8 col-lg-8">
														<select name="department" class="form-control"
															id="department">
															<option value=""
																<%=department == null || department.equals("N/A") ? "selected" : ""%>>Select
																Department</option>
															<option value="Accounting"
																<%="Accounting".equals(department) ? "selected" : ""%>>Accounting</option>
															<option value="HR"
																<%="HR".equals(department) ? "selected" : ""%>>HR</option>
															<option value="System installation"
																<%="System installation".equals(department) ? "selected" : ""%>>System
																installation</option>
															<option value="Purchasing"
																<%="Purchasing".equals(department) ? "selected" : ""%>>Purchasing</option>
															<option value="System Mechanical"
																<%="System Mechanical".equals(department) ? "selected" : ""%>>System
																Mechanical</option>
															<option value="Field Service"
																<%="Field Service".equals(department) ? "selected" : ""%>>Field
																Service</option>
															<option value="Management Info"
																<%="Management Info".equals(department) ? "selected" : ""%>>Management
																Info</option>
															<option value="Test"
																<%="Test".equals(department) ? "selected" : ""%>>Test</option>
															<!-- Add more departments as needed -->
														</select>
													</div>
												</div>
												<!-- Contact Number -->
												<div class="row mb-3">
													<label for="contact"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-phone"></i> Contact Number</label>
													<div class="col-md-8 col-lg-8">
														<input name="contact" type="text" class="form-control"
															maxlength="11"
															value="<%=contact != null ? contact : ""%>" required>
													</div>
												</div>
												<div class="row mb-3">
													<label for="Email" class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-envelope"></i> Email</label>
													<div class="col-md-8 col-lg-8">
														<input type="email" class="form-control" name="email"
															value="<%=email != null ? email : ""%>" readonly required>

													</div>
												</div>
												<!-- Submit button -->
												<div class="text-center">
													<button type="submit" name="saveChanges"
														class="btn btn-primary">Save Changes</button>
												</div>
											</form>
											<!-- End Profile Edit Form -->

										</div>
										<div class="tab-pane fade pt-3" id="profile-change-password">
											<!-- Change Password Form -->
											<form method="POST" action="UpdatePasswordServlet">
												<div class="row mb-3">
													<label for="currentPassword"
														class="col-md-4 col-lg-4 col-form-label"><i
														class="fas fa-lock"></i> Current Password:</label>
													<div class="col-md-5 col-lg-5">
														<input name="currentPassword" type="password"
															class="form-control" id="currentPassword"
															placeholder="Enter your current password">
													</div>
												</div>


												<div class="row mb-3">
													<div class="col-md-5 col-lg-4">
														<label for="newPassword" class="col-form-label"><i
															class="fas fa-lock"></i> New Password: </label>
													</div>
													<div class="col-md-5 col-lg-5">
														<div class="input-group">
															<input type="password" class="form-control"
																name="newPassword" id="password"
																pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
																placeholder="Enter your new password" required>
															<button class="btn btn-outline-secondary" type="button"
																id="togglePassword" style="height: 38px;">
																<i class="fas fa-eye"></i>
															</button>
														</div>
													</div>
													<div id="message">
														<h6>Password must contain:</h6>
														<p id="letter" class="invalid">At least one letter</p>
														<p id="capital" class="invalid">At least one capital
															letter</p>
														<p id="number" class="invalid">At least one number</p>
														<p id="special" class="invalid">At least one special
															character</p>
														<p id="length" class="invalid">Minimum 8 characters</p>
													</div>
												</div>


												<div class="row mb-3">
													<div class="col-md-5 col-lg-4">
														<label for="password" class="col-form-label"><i
															class="fas fa-lock"></i> Re-enter New Password: </label>
													</div>
													<div class="col-md-5 col-lg-5">
														<div class="input-group">
															<input type="password" class="form-control"
																name="ReEnterPassword" id="password"
																pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
																placeholder="Re-enter your new password" required>
															<button class="btn btn-outline-secondary" type="button"
																id="toggleReEnterPassword" style="height: 38px;">
																<i class="fas fa-eye"></i>
															</button>
														</div>
													</div>
												</div>

												<input type="hidden" name="username"
													value="${sessionScope.username}">
												<div class="text-center">
													<button type="submit" name="ChangePassword"
														class="btn btn-primary">Change Password</button>
												</div>
											</form>


										</div>

									</div>
									<!-- End Bordered Tabs -->

								</div>
							</div>

						</div>
					</div>
				</section>

			</main>

		</div>
	</div>

	<!-- Bootstrap and custom scripts -->
	<!-- Bootstrap JS (optional) -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
	<script src="js/sidebar.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    // Function to populate branch dropdown based on company selection
    function populateBranches(companyName, selectedBranch) {
        var branches = [];

        switch (companyName) {
            case 'Comfac Global Group':
                branches = ['Calbayog', 'CGF'];
                break;
            case 'Comfac Technology Options (CTO)':
                branches = ['Calbayog', 'CTO'];
                break;
            case 'Cornersteel Systems Corporation':
                branches = ['Laguna', 'Makati'];
                break;
            case 'Energy Specialist Company (ESCO)':
                branches = ['Mandaluyong', 'ESCO'];
                break;
            default:
                branches = [];
        }

        // Populate the branch dropdown
        $('#branch').html(''); // Clear previous options
        if (branches.length > 0) {
            $.each(branches, function(index, value) {
                var isSelected = (value === selectedBranch) ? 'selected' : '';
                $('#branch').append($('<option>', {
                    value: value,
                    text: value,
                    selected: isSelected
                }));
            });
            $('#branchGroup').show(); // Show branch group if there are branches
        } else {
            $('#branchGroup').hide(); // Hide branch group if no branches
        }
    }

    // On company change, update branch options
    $('#company').change(function() {
        var companyName = $(this).val();
        console.log("Selected Company:", companyName); // Debug log
        populateBranches(companyName, ''); // No pre-selected branch on change
    });

    // When the page loads, populate branches with pre-selected branch
    var selectedCompany = $('#company').val();
    console.log("Initial Company:", selectedCompany); // Debug log
    var selectedBranch = '<%=branch != null ? branch : ""%>'; // Get current branch from JSP
    console.log("Selected Branch:", selectedBranch); // Debug log
    populateBranches(selectedCompany, selectedBranch);
});
</script>

	<script>
		function restrictToLettersWithSingleSpace(input) {
			var lastNameNote = input.parentNode.querySelector('.note');
			var inputValue = input.value;

			// Replace multiple spaces with a single space
			inputValue = inputValue.replace(/  +/g, ' ');

			// Remove any non-letter characters except spaces
			var lettersOnly = inputValue.replace(/[^A-Za-zñÑ ]/g, '');

			if (inputValue !== lettersOnly && inputValue.trim() !== '') {
				lastNameNote.style.display = 'block';
			} else {
				lastNameNote.style.display = 'none';
			}

			input.value = lettersOnly;
		}
	</script>

	<script>
		function restrictToNumbers(input) {
			var phoneNumberNote = input.parentNode.querySelector('.note');
			var inputValue = input.value;
			var numbersOnly = inputValue.replace(/[^0-9]/g, '').slice(0, 11);

			if (inputValue !== numbersOnly || inputValue.length !== 11) {
				phoneNumberNote.style.display = 'block';
			} else {
				phoneNumberNote.style.display = 'none';
			}

			input.value = numbersOnly;
		}
	</script>

	<script>
		var myInput = document.getElementById("password");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");

		// When the user clicks on the password field, show the message box
		myInput.onfocus = function() {
			document.getElementById("message").style.display = "block";
		}

		// When the user clicks outside of the password field, hide the message box
		myInput.onblur = function() {
			document.getElementById("message").style.display = "none";
		}

		// When the user starts to type something inside the password field
		myInput.onkeyup = function() {
			// Validate lowercase letters
			var lowerCaseLetters = /[a-z]/g;
			if (myInput.value.match(lowerCaseLetters)) {
				letter.classList.remove("invalid");
				letter.classList.add("valid");
			} else {
				letter.classList.remove("valid");
				letter.classList.add("invalid");
			}

			// Validate capital letters
			var upperCaseLetters = /[A-Z]/g;
			if (myInput.value.match(upperCaseLetters)) {
				capital.classList.remove("invalid");
				capital.classList.add("valid");
			} else {
				capital.classList.remove("valid");
				capital.classList.add("invalid");
			}

			// Validate numbers
			var numbers = /[0-9]/g;
			if (myInput.value.match(numbers)) {
				number.classList.remove("invalid");
				number.classList.add("valid");
			} else {
				number.classList.remove("valid");
				number.classList.add("invalid");
			}

			var specialCharacters = /[!@#$%^&*(),.?\:{}|<>]/g;
			if (myInput.value.match(specialCharacters)) {
				special.classList.remove("invalid");
				special.classList.add("valid");
			} else {
				special.classList.remove("valid");
				special.classList.add("invalid");
			}

			// Validate length
			if (myInput.value.length >= 8) {
				length.classList.remove("invalid");
				length.classList.add("valid");
			} else {
				length.classList.remove("valid");
				length.classList.add("invalid");
			}
		}
	</script>
	<script>
		const togglePasswordButton = document.getElementById('togglePassword');
		const passwordInput = document.getElementById('password');

		togglePasswordButton
				.addEventListener(
						'click',
						function() {
							const type = passwordInput.getAttribute('type') === 'password' ? 'text'
									: 'password';
							passwordInput.setAttribute('type', type);
							togglePasswordButton.querySelector('i').classList
									.toggle('fa-eye');
							togglePasswordButton.querySelector('i').classList
									.toggle('fa-eye-slash');
						});
	</script>
	<script>
    // Toggle visibility for Re-Enter Password
    const toggleReEnterPasswordButton = document.getElementById('toggleReEnterPassword');
    const reEnterPasswordInput = document.getElementById('ReEnterPassword');

    toggleReEnterPasswordButton.addEventListener('click', function() {
        const type = reEnterPasswordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        reEnterPasswordInput.setAttribute('type', type);
        toggleReEnterPasswordButton.querySelector('i').classList.toggle('fa-eye');
        toggleReEnterPasswordButton.querySelector('i').classList.toggle('fa-eye-slash');
    });
</script>
	<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        const newPassword = document.getElementById('password').value;
        const reEnterPassword = document.getElementById('ReEnterPassword').value;

        if (newPassword !== reEnterPassword) {
            event.preventDefault(); // Prevent form submission
            alert("Passwords do not match! Please ensure both passwords are the same.");
        }
    });
</script>


	<script>
		document.getElementById('uploadImageButton').addEventListener(
				'click',
				function() {
					const fileInput = document.getElementById('fileUpload');
					const mainFileInput = document
							.getElementById('profilePictureInput');
					const fileNameDisplay = document
							.getElementById('fileNameDisplay');

					if (fileInput.files.length > 0) {
						// Set the file to the hidden input
						mainFileInput.files = fileInput.f	iles;
						// Display the selected file name
						fileNameDisplay.innerText = fileInput.files[0].name;
						// Close the modal
						var modal = bootstrap.Modal.getInstance(document
								.getElementById('exampleModal'));
						modal.hide();
					} else {
						alert('Please select a file.');
					}
				});
	</script>
</body>
	</html>