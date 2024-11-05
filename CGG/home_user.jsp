<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%
HttpSession httpSession = request.getSession();

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
String firstName = (String) session.getAttribute("firstName");
String middleInitial = (String) session.getAttribute("middleInitial");
String lastName = (String) session.getAttribute("lastName");
String suffix = (String) session.getAttribute("suffix");
String profilePic = (String) session.getAttribute("profilePic");
String username = (String) session.getAttribute("username");
String company = (String) session.getAttribute("company");
String branch = (String) session.getAttribute("branch");
String department = (String) session.getAttribute("department");
String companyName = (String) session.getAttribute("company_name");
String branchName = (String) session.getAttribute("branch_name");
String departmentName = (String) session.getAttribute("department_name");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<!-- Favicon -->
<link rel="icon" href="img/logo2.png" type="image/x-icon">
<link rel="stylesheet" href="css/sidebar_navbar.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Bootstrap 4.5.2 from CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Bootstrap 5.3.0 from CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.lineicons.com/3.0/lineicons.css">
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">

<!-- Custom Styles -->


<style>
.sidebar-link:hover, .sidebar-footer:hover {
	background-color: white;
	color: #FFF;
	/* Set the desired text color for hover state */
}

body h2 {
	font-family: "Arial", sans-serif;
}

.btn-custom {
	background-color: #333333;
	color: #ffffff;
	transition: color 0.3s;
}

.btn-custom:hover {
	background-color: gray;
	color: #fff;
}

.sender {
	color: black;
	padding: 5px;
	margin: 10px;
	border-radius: 5px;
	display: inline-block;
}

.icon-container {
	background-color: #6c757d;
	color: #fff;
	padding: 10px;
	border-radius: 7px;
	margin-right: 3px;
}

.table th:nth-child(7), .table td:nth-child(7), .table th:nth-child(9),
	.table td:nth-child(9) {
	white-space: pre-wrap;
}

.sidebar-link:hover, .sidebar-footer:hover {
	background-color: white;
	color: #FFF;
}

.btn-custom {
	z-index: 1050; /* Ensure it's above other elements */
}

.btn-secondary {
	z-index: 1050; /* Ensure it's above other elements */
}
</style>
<script>
        function filterByStatus() {
            const status = document.getElementById("statusFilter").value;
            if (status) {
                window.location.href = "tickets?status=" + encodeURIComponent(status);
            }
        }
    </script>
</head>

<body>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #595959;">
		<div class="container-fluid">
			<!-- System Name (Upper Left Corner) -->
			<a class="navbar-brand" href="tickets"> <img
				src="img/Ticket-Logo-3.png" height="40px" alt="Logo"> CGG
				NEXUS
			</a>

			<!-- Navbar Toggler (for responsive behavior) -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Content (Upper Right Corner) -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto">
					<!-- User Profile Picture -->
					<li class="nav-item"><img
						src="<%=session.getAttribute("profilePic") != null
		? "data:image/jpeg;base64," + session.getAttribute("profilePic")
		: request.getContextPath() + "/img/default.jpg"%>"
						alt="User Profile" class="nav-link rounded-circle"
						style="width: 50px; height: 50px;"></li>

					<!-- User Name -->
					<li class="nav-item"><a class="nav-link"
						href="User_Profile.jsp"><%=firstName + " " + (middleInitial != null ? middleInitial + ". " : "") + lastName%></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Sidebar and Main Content Wrapper -->
	<div class="wrapper">
		<!-- Sidebar -->
		<aside id="sidebar">
			<div class="d-flex">
				<button class="toggle-btn" type="button">
					<i class="lni lni-grid-alt"></i>
				</button>
			</div>
			<ul class="sidebar-nav">
				<li class="sidebar-item"><a href="tickets" class="sidebar-link">
						<i class="fa-solid fa-house"></i> <span><strong>TICKETS</strong></span>
				</a></li>
				<li class="sidebar-item"><a href="resolvedtickets.jsp"
					class="sidebar-link"> <i class="fa-solid fa-star"></i> <span><strong>RESOLVED
								TICKETS</strong></span>
				</a></li>
				<li class="sidebar-item"><a href="User_Profile.jsp"
					class="sidebar-link"> <i class="fa fa-gear"></i> <span><strong>SETTINGS</strong></span>
				</a></li>
				<hr style="border-color: white;">
				<li class="sidebar-item"><a href="login.jsp"
					class="sidebar-link"> <i class="fa-solid fa-right-from-bracket"></i>
						<span><strong>LOGOUT</strong></span>
				</a></li>
			</ul>
		</aside>

<!-- Main Content -->
<div class="main p-3">
    <div class="container-fluid">
        <div class="container1">
            <!-- Filters -->
            <div class="row mb-4">
                <div class="col-12 col-md-3 mb-2 mb-md-0">
                    <input type="text" class="form-control form-control-sm" id="ticketNumberSearch" placeholder="Search by Ticket Number">
                </div>
                <div class="col-12 col-md-3 mb-2 mb-md-0">
                    <select class="form-select form-select-sm" id="statusFilter" name="status" onchange="filterByStatus()">
                        <option value="">Filter by Status</option>
                        <option value="All">All</option>
                        <option value="Pending">Pending</option>
                        <option value="Resolved">Resolved</option>
                        <option value="Unresolved">Unresolved</option>
                        <option value="Cancelled">Cancelled</option>
                        <option value="Working">Working</option>
                    </select>
                </div>
                <div class="col-12 col-md-3 mb-2 mb-md-0">
                    <input type="text" class="form-control form-control-sm" id="requestorSearch" placeholder="Search by Requestor">
                </div>
                <div class="col-12 col-md-3">
                    <button type="button" id="resetFilters" class="btn btn-secondary btn-sm w-100 w-md-auto">Reset Filters</button>
                </div>
            </div>

            <!-- Button Section Below Filters, aligned to the right -->
            <div class="row mb-3">
                <div class="col-12 d-flex flex-column flex-md-row justify-content-md-end align-items-center">
                    <!-- Download CSV Button -->
                    <form action="/exportTickets" method="get" class="mb-2 mb-md-0 me-md-2 w-100 w-md-auto">
                        <input type="submit" class="btn btn-secondary w-100 w-md-auto px-3 py-1" name="download" value="Download CSV">
                    </form>

                    <!-- Create Ticket Button -->
                    <button type="button" class="btn btn-custom w-100 w-md-auto px-3 py-1" data-bs-toggle="modal" data-bs-target="#myModal">
                        Create Ticket
                    </button>
                </div>
            </div>
					<%
					try {
						// Retrieve the ticket list set by the servlet
						List<Map<String, String>> ticketList = (List<Map<String, String>>) request.getAttribute("ticketList");
						if (ticketList != null && !ticketList.isEmpty()) {
					%>
					<div class="table-responsive">
					<table id="example" class="table table-bordered">
						<thead class="table-light">
							<tr>
								<th>Ticket ID</th>
								<th class="text-center">Requestor</th>
								<th class="text-center">Assigned Branch</th>
								<th class="text-center">Subject</th>
								<th class="text-center">Status</th>
								<th class="text-center">View</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Map<String, String> ticket : ticketList) {
								// Generate a unique modal ID based on the ticket ID
								String modalId = "infoModal" + ticket.get("ticket_id");
							%>
							<tr>
								<td><a
									href="ticket_info?ticket_id=<%=ticket.get("ticket_id")%>"
									class="text-body fw-bold"> <%=ticket.get("ticket_id")%>
								</a></td>
								<td class="text-center"><%=ticket.get("fullName")%></td>
								<td class="text-center"><%=ticket.get("branch_name")%></td>
								<td class="text-justify"><%=ticket.get("subject")%></td>
								<td class="text-center"><span class="badge text"
									style="<%String status = (String) ticket.get("status");
String bgColor = "";
if ("Resolved".equals(status)) {
	bgColor = "#20a464";
} else if ("Pending".equals(status)) {
	bgColor = "#e3d354";
} else if ("Cancelled".equals(status)) {
	bgColor = "#e04f4f";
} else if ("Working".equals(status)) {
	bgColor = "#58a7d1";
} else if ("Unresolved".equals(status)) {
	bgColor = "#53e827"; // Plain style for unresolved
}%>background-color: <%=bgColor%>; color: black;">
										<%=status%>
								</span></td>
								<td class="text-center"><a href="#" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#<%=modalId%>"> <i
										class="fas fa-eye"></i>&nbsp;View
								</a></td>
							</tr>

							<!-- View Modal for each ticket -->
							<div class="modal fade" id="<%=modalId%>" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Ticket Information</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<div class="col-md-12 mt-3">
												<label><i class="fas fa-envelope"></i> Updated by</label> <input
													type="text" name="updated_by"
													value="<%=ticket.get("updated_by") != null ? ticket.get("updated_by") : "N/A"%>"
													class="form-control" disabled>
											</div>

											<div class="col-md-12 mt-3">
												<label for="reason"><i class="fas fa-message"></i>
													Reason</label>
												<textarea class="form-control" name="cancel_reason" rows="3"
													required disabled><%=ticket.get("cancel_reason") != null ? ticket.get("cancel_reason") : "N/A"%>
                    </textarea>
											</div>

											<div class="col-md-12 mt-3">
												<label><i class="fas fa-user"></i> Date Created</label> <input
													type="text" name="created_date"
													value="<%=ticket.get("created_date") != null ? ticket.get("created_date") : "N/A"%>"
													class="form-control" disabled>
											</div>

											<div class="col-md-12 mt-3">
												<label><i class="fas fa-envelope"></i> Updated Date</label>
												<input type="text" name="updated_date"
													value="<%=ticket.get("updated_date") != null ? ticket.get("updated_date") : "N/A"%>"
													class="form-control" disabled>
											</div>

											<div class="col-md-12 mt-3">
												<label><i class="fas fa-clock"></i> Ticket Duration</label>
												<input type="text" name="time_difference"
													value="<%=ticket.get("time_difference") != null ? ticket.get("time_difference") : "N/A"%>"
													class="form-control" disabled>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- End of View Modal -->
							<%
							}
							%>
						</tbody>
					</table>
					</div>
					<%
					} else {
					out.println("<p class='text-center'>No tickets found.</p>"); // For debugging
					}
					} catch (Exception e) {
					out.println("<p class='text-danger'>Error retrieving ticket list: " + e.getMessage() + "</p>");
					e.printStackTrace(); // Log the error in the server logs for further analysis
					}
					%>



				</div>
				<!-- Create Ticket Modal -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">
									<i class="fas fa-ticket"></i> Submit a Ticket
								</h4>
							</div>
							<div class="modal-body">
								<form action="tickets" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="action" value="create">

									<!-- Sender Information -->
									<div class="form-group">
										<h5>
											<div class="sender">SENDER:</div>
											<div class="input-group">
												<span class="icon-container"> <i class="fas fa-user"></i>
												</span>
												<!-- Hidden requestor name, auto-filled from session -->
												<input type="hidden" name="requestor_name"
													value="<%=session.getAttribute("firstName")%> <%=session.getAttribute("lastName")%>">
												<input type="text" class="form-control"
													placeholder="<%=session.getAttribute("firstName")%> <%=session.getAttribute("lastName")%>"
													readonly>
											</div>
										</h5>
									</div>

									<!-- Receiver Information -->
									<h5>
										<div class="sender">RECEIVER:</div>
										<div class="input-group">
											<span class="icon-container"> <i
												class="fa-solid fa-building"></i>
											</span> <label for="company_name" class="sr-only">To Company</label>
											<select class="form-control" name="company_name"
												id="company_name" required>
												<option value="Comfac Global Group">Comfac Global
													Group</option>
												<option value="Comfac Technology Options (CTO)">Comfac
													Technology Options (CTO)</option>
												<option value="Cornersteel Systems Corporation">Cornersteel
													Systems Corporation</option>
												<option value="Energy Specialist Company (ESCO)">Energy
													Specialist Company (ESCO)</option>
												<option value="Test">Test</option>
											</select>
										</div>
										<br>
										<div class="input-group">
											<span class="icon-container"> <i
												class="fa-solid fa-code-branch"></i>
											</span> <label for="branch_name" class="sr-only">Branch</label> <select
												class="form-control" name="branch_name" id="branch_name"
												required>
												<option value="">Select To Branch</option>
												<!-- Branch options would be dynamically filled in real-world applications -->
											</select>
										</div>
										<br>
										<div class="input-group">
											<span class="icon-container"> <i
												class="fa-solid fa-building"></i>
											</span> <label for="department_name" class="sr-only">To
												Department</label> <select name="department_name"
												class="form-control" readonly>
												<option value="IT Department">IT Department</option>
											</select>
										</div>
									</h5>

									<!-- Subject -->
									<div class="form-group">
										<div class="sender">SUBJECT:</div>
										<div class="input-group">
											<span class="icon-container"> <i
												class="fa-solid fa-file"></i>
											</span> <label for="subject" class="sr-only">Subject</label> <input
												type="text" class="form-control" name="subject"
												placeholder="Subject" required>
										</div>
									</div>
									<br>

									<!-- Details -->
									<div class="form-group">
										<div class="input-group">
											<span class="icon-container"> <i
												class="fa-solid fa-comment-alt"></i>
											</span> <label for="details" class="sr-only">Details</label>
											<textarea class="form-control" name="details" rows="4"
												placeholder="Details" required></textarea>
										</div>
									</div>
									<br>

									<!-- File Attachment -->
									<div class="form-group">
										<div class="input-group">
											<span class="icon-container"> <i class="fa fa-chain">&nbsp;</i>
											</span> <label for="file" class="sr-only">Attach File:</label> <input
												type="file" id="example-fileinput" class="form-control"
												name="file" multiple>
										</div>
										<br>
										<div id="image-preview">
											<img id="preview-image" src="img/empty.png" height="200"
												alt="Image Preview">
										</div>

										<!-- Spinner -->
										<div id="loading-spinner" class="text-center d-none">
											<div class="spinner-border text-primary" role="status">
												<span class="visually-hidden">Submitting...</span>
											</div>
											<div>Submitting...</div>
										</div>
									</div>

									<!-- Modal Footer -->
									<div class="modal-footer">
										<button type="submit" class="btn"
											style="background-color: #6C757D; color: #FFF;">Submit</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!-- End of Create Ticket Modal -->
			</div>
		</div>
	</div>


	<script defer src="js/script.js"></script>
	<!-- JavaScript Files -->
	<script src="js/sidebar.js"></script>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<!-- Bootstrap JS and Popper JS -->
	<!-- DataTables JS -->
	<script
		src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
	<!-- Custom Scripts -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
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
        $('#branch_name').html(''); // Clear previous options
        if (branches.length > 0) {
            $.each(branches, function(index, value) {
                var isSelected = (value === selectedBranch) ? 'selected' : '';
                $('#branch_name').append($('<option>', {
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
    $('#company_name').change(function() {
        var companyName = $(this).val();
        console.log("Selected Company:", companyName); // Debug log
        populateBranches(companyName, ''); // No pre-selected branch on change
    });

    // When the page loads, populate branches with pre-selected branch
    var selectedCompany = $('#company_name').val();
    console.log("Initial Company:", selectedCompany); // Debug log
    var selectedBranch = '<%=session.getAttribute("branch_name") != null ? session.getAttribute("branch_name") : ""%>';
    console.log("Selected Branch:", selectedBranch); // Debug log
    populateBranches(selectedCompany, selectedBranch);
});
</script>


	<script>
      // File Input and Preview
      const fileInput = document.getElementById('example-fileinput');
      const imagePreview = document.getElementById('image-preview');

      fileInput.addEventListener('change', function () {
          imagePreview.innerHTML = ''; // Clear previous previews

          const files = this.files;

          for (const file of files) {
              const reader = new FileReader();

              reader.addEventListener('load', function () {
                  if (file.type === 'application/pdf' ||
                      file.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
                      file.type === 'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
                      // Display filename for non-image files
                      const filenameElement = document.createElement('p');
                      filenameElement.textContent = file.name;
                      imagePreview.appendChild(filenameElement);
                  } else if (file.type.startsWith('image/')) {
                      // Display image preview
                      const imgElement = document.createElement('img');
                      imgElement.src = reader.result;
                      imgElement.height = 200;
                      imgElement.alt = 'Image Preview';
                      imagePreview.appendChild(imgElement);
                  }
              });

              if (file.type === 'application/pdf' ||
                  file.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
                  file.type === 'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
                  reader.readAsDataURL(new Blob([file.name]));
              } else {
                  reader.readAsDataURL(file);
              }
          }
      });

      // Filters Functionality
      document.addEventListener("DOMContentLoaded", function () {
          const statusFilter = document.getElementById('statusFilter');
          const requestorSearch = document.getElementById('requestorSearch');
          const ticketNumberSearch = document.getElementById('ticketNumberSearch');
          const resetFiltersButton = document.getElementById('resetFilters');

          statusFilter.addEventListener('change', filterTickets);
          requestorSearch.addEventListener('input', filterTickets);
          ticketNumberSearch.addEventListener('input', filterTickets);
          resetFiltersButton.addEventListener('click', resetFilters);

          function filterTickets() {
              const tickets = document.querySelectorAll('#example tbody tr');
              const statusValue = statusFilter.value.toLowerCase();
              const requestorValue = requestorSearch.value.toLowerCase();
              const ticketNumberValue = ticketNumberSearch.value.toLowerCase();

              tickets.forEach(ticket => {
                  const ticketID = ticket.querySelector('td:first-child').textContent.toLowerCase();
                  const requestor = ticket.querySelector('td:nth-child(2)').textContent.toLowerCase();
                  const status = ticket.querySelector('td:nth-child(5) span').textContent.toLowerCase();

                  let shouldShow = true;

                  if (ticketNumberValue && !ticketID.includes(ticketNumberValue)) {
                      shouldShow = false;
                  }
                  if (requestorValue && !requestor.includes(requestorValue)) {
                      shouldShow = false;
                  }
                  if (statusValue && status !== statusValue) {
                      shouldShow = false;
                  }

                  // Set row visibility based on filter results
                  ticket.style.display = shouldShow ? 'table-row' : 'none';
              });
          }

          function resetFilters() {
              statusFilter.value = '';
              requestorSearch.value = '';
              ticketNumberSearch.value = '';
              filterTickets();
          }
      });

      // Form Submission Spinner
      document.getElementById('ticket-form').addEventListener('submit', function () {
          document.getElementById('loading-spinner').classList.remove('d-none');
          document.querySelector('button[type="submit"]').setAttribute('disabled', 'true');
      });

      // AJAX for Branch Selection

  </script>

</body>

</html>
