<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
HttpSession httpSession = request.getSession();

String firstName = (String) session.getAttribute("firstName");
String middleInitial = (String) session.getAttribute("middleInitial");
String lastName = (String) session.getAttribute("lastName");
String userId = (String) httpSession.getAttribute("userId");
String ticketIdFromRequest = request.getParameter("ticket_id");
String ticketId = (String) httpSession.getAttribute("ticket_id");
String username = (String) httpSession.getAttribute("username");
if (ticketIdFromRequest != null && !ticketIdFromRequest.isEmpty()) {
	ticketId = ticketIdFromRequest;
	httpSession.setAttribute("ticket_id", ticketId); // Set it in the session
} else if (ticketId == null || ticketId.isEmpty()) {
	return; // Prevent the page from continuing if no ticket_id is available
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Ticket Info</title>
<!-- Favicon -->
<link rel="icon" href="img/logo2.png" type="image/x-icon">
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

<link rel="stylesheet" href="css/sidebar_navbar.css">
<style>
.ticket {
	border: 1px solid #ccc;
	padding: 16px;
	margin-bottom: 16px;
}

.ticket-header {
	border-bottom: 1px solid #ccc;
	margin-bottom: 16px;
	padding-bottom: 16px;
	display: flex;
	justify-content: space-between;
}

.ticket-details {
	margin-bottom: 16px;
}

.header-buttons button {
	margin-left: 8px;
}

.dialog-box {
	max-width: 60%;
	margin-bottom: 1rem;
	border-radius: 15px;
	display: flex;
	flex-direction: column;
	background-color: #f5f5f5;
	position: relative;
}

.dialog-header {
	padding: 0.5rem 1rem;
	background-color: #f5f5f5;
	border-radius: 15px 15px 0 0;
	border-bottom: 1px solid #ddd;
	display: flex;
	align-items: center;
}

.dialog-header img {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	object-fit: cover;
	margin-right: 0.5rem;
}

.dialog-header p {
	margin-bottom: 0;
}

.dialog-body {
	padding: 0.5rem 1rem;
	border-radius: 0 0 15px 15px;
	background-color: #fff;
}

.reply-dialog {
	align-self: flex-start;
}

.user-dialog {
	align-self: flex-end;
	background-color: #dcf8c6;
}

.btn-custom {
	background-color: #333333;
	color: #ffffff;
	transition: color 0.3s;
}

.btn-custom:hover {
	color: #ffffff;
}

.image-wrapper {
	display: inline-block;
	margin: 10px;
}

.lb-close {
	position: absolute;
	top: 25px;
	/* Adjust top position as needed */
	right: 10px;
	/* Adjust right position as needed */
	z-index: 1031;
	/* Ensure close button is above other elements */
}
/* On screens smaller than 768px, ensure alignment to the right */
@media ( max-width : 768px) {
	.header-buttons {
		justify-content: flex-end; /* Right-aligns buttons on small screens */
	}
}
.ticket-header {
    width: 100%;
    padding: 10px;
}

.ticket-id {
    word-wrap: break-word; /* Ensures long ticket IDs will wrap */
    overflow-wrap: anywhere;
}

.info, .status-badge {
    word-wrap: break-word;
    overflow-wrap: break-word; /* Ensures text wraps within the container */
    white-space: normal; /* Makes sure text doesn't stay in one line */
}

@media (max-width: 768px) {
    .ticket-header {
        padding: 5px;
    }

    .number.pull-right {
        text-align: left; /* Aligns text to the left on smaller screens */
        margin-top: 10px; /* Adds space above the status on small screens */
    }
}

</style>
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


		<div class="container-fluid">
			<div class="main p-3">
				<div class="ticket">
					<div class="ticket-header d-flex flex-column align-items-start">
						<div class="header-content mb-3">
							<h2><%= request.getAttribute("ticket_id") %></h2>
							<p class="info">
								Subject:
								<%= request.getAttribute("subject") %><br> Requested by: <a
									href="#"><%= request.getAttribute("fullName") %></a> <br>
								<%= request.getAttribute("created_date") %>
							</p>
							<span class="number pull-right"> <b>Status: <span
									class="badge"
									style="<%String status = (String) request.getAttribute("status");
String bgColor = "";
String textColor = "black"; // default text color

if ("Resolved".equals(status)) {
	bgColor = "#20a464";
} else if ("Pending".equals(status)) {
	bgColor = "#e3d354";
} else if ("Cancelled".equals(status)) {
	bgColor = "#e04f4f";
} else if ("Working".equals(status)) {
	bgColor = "#58a7d1";
} else if ("Unresolved".equals(status)) {
	bgColor = "#53e827";
	textColor = "black"; // Customize as needed for better readability
}%>background-color: <%=bgColor%>; color: <%=textColor%>;">
										<%=status%>
								</span>
							</b>
							</span>
							<!-- Updated Status modal -->
							<button type="button" class="btn badge text-bg-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								<%if ("Cancelled".equals(status)) {%> disabled <%}%>>Update
								Status</button>
							<br> <br>
							<!-- Button Container with Responsive Alignment -->
							<!-- Responsive Button Container -->
							<div
								class="header-buttons d-flex flex-wrap gap-2 mt-auto justify-content-end w-100">
								<button type="button" class="btn btn-success flex-fill"
									data-bs-toggle="modal" data-bs-target="#acceptModal"
									<% if ("Cancelled".equals(status) || "Working".equals(status) || "Resolved".equals(status)) { %>
									disabled <% } %>>Accept</button>

								<button type="button" class="btn btn-primary flex-fill"
									data-bs-toggle="modal" data-bs-target="#replyModal"
									data-ticket-id="${ticket.ticket_id}"
									<% if ("Cancelled".equals(status)) { %> disabled <% } %>>
									Reply</button>

								<button type="button" class="btn btn-danger flex-fill"
									data-bs-toggle="modal" data-bs-target="#cancelModal"
									<% if ("Cancelled".equals(status) || "Working".equals(status) || "Resolved".equals(status)) { %>
									disabled <% } %>>Cancel Ticket</button>

								<a href="tickets" class="btn btn-secondary flex-fill" style=margin-left:8px >Go
									Back</a>
							</div>
						</div>
						<!-- Only show "Remove Ticket" button if the ticket status is "Cancelled" -->
						<%
							if ("Cancelled".equals(status)) {
							%>
						<!-- Remove Ticket Button 
							<button type="button" class="btn badge text-bg-danger"
								data-bs-toggle="modal" data-bs-target="#removeTicketModal">
								Remove Ticket</button> -->
						<%
							}
							%>

						<!-- Remove Ticket Modal 
							<div class="modal fade" id="removeTicketModal" tabindex="-1"
								aria-labelledby="removeTicketModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="removeTicketModalLabel">Remove
												Ticket</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">Are you sure you want to remove
											this ticket? This action cannot be undone.</div>
										<div class="modal-footer">
											<form action="UpdateServlet" method="POST">
												<input type="hidden" name="ticket_id" value="<%=ticketId%>">
												<input type="hidden" name="action" value="remove_ticket">
												<button type="submit" class="btn btn-danger">Confirm
													Removal</button>
											</form>
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>
										</div>
									</div>
								</div>
							</div> -->



						<!-- Update Status Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Ticket
											Status</h5>

										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<form id="status-form" action="UpdateServlet" method="POST">
											<input type="hidden" name="ticket_id" value="<%=ticketId%>">
											<input type="hidden" name="action" value="change_status">
											<!-- Ticket ID -->
											<input type="hidden" name="updatedby"
												value="<%=session.getAttribute("fullName")%>">
											<!-- User's full name -->

											<label for="Status" class="form-label"><i
												class="fas fa-info-circle"></i> Status</label> <select id="Status"
												name="status" class="form-control" required>
												<option value="" disabled>Select your Status</option>
												<option value="Unresolved">Unresolved</option>
												<option value="Resolved">Resolved</option>
											</select>

											<div class="modal-footer">
												<button class="btn btn-primary float-end" type="submit"
													name="change_status">Save Changes</button>
												<button type="button" class="btn btn-danger"
													data-bs-dismiss="modal">Close</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>






					<!-- Accept Ticket Modal -->
					<div class="modal fade" id="acceptModal" tabindex="-1"
						aria-labelledby="acceptModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="acceptModalLabel">Accept
										ticket</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="UpdateServlet" method="POST">
										<input type="hidden" name="ticket_id" value="<%=ticketId%>">
										<input type="hidden" name="action" value="accept_ticket">
										Are you sure you want to accept this ticket?<br>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" name="accept_ticket"
												class="btn btn-success">Confirm</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- Reply Modal -->
					<div class="modal fade" id="replyModal" tabindex="-1"
						aria-labelledby="replyModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="replyModalLabel">Reply</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="ReplyServlet" method="POST">
										<input type="hidden" name="ticket_id" value="<%=ticketId%>">
										<div class="mb-3">
											<label for="replyMessage" class="form-label">Reply</label>
											<textarea class="form-control" name="reply" rows="3"></textarea>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Add
												reply</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Cancel Ticket Modal -->
				<div class="modal fade" id="cancelModal" tabindex="-1"
					aria-labelledby="cancelModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="cancelModalLabel">Confirm
									Cancel</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="UpdateServlet" method="POST">
									<input type="hidden" name="userId" value="<%=userId%>">
									<input type="hidden" name="ticket_id" value="<%=ticketId%>">
									<input type="hidden" name="action" value="cancelStatus">
									Are you sure you want to cancel this ticket? <br> <br>
									<textarea class="form-control" name="cancel_reason" rows="4"
										placeholder="Reason" required></textarea>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">CLose</button>
										<button type="submit" name="cancel_ticket"
											class="btn btn-danger">Confirm</button>
									</div>
								</form>
							</div>
						</div>
					</div>


				</div>



				<div class="ticket-details">
					<p class="text-justify"><%=request.getAttribute("details")%></p>
				</div>
				<%
					Blob fileBlob = (Blob) request.getAttribute("fileBlob");
					String fileName = (String) request.getAttribute("fileName");

					if (fileBlob != null) {
						InputStream inputStream = fileBlob.getBinaryStream();
						byte[] fileBytes = new byte[(int) fileBlob.length()];
						inputStream.read(fileBytes);
						String fileBase64 = Base64.getEncoder().encodeToString(fileBytes);

						// Logic to determine if it's an image or a downloadable file
						if (fileBytes.length > 0 && (fileBytes[0] == (byte) 0xFF && fileBytes[1] == (byte) 0xD8)) { // JPEG
					%>
				<img src="data:image/jpeg;base64,<%=fileBase64%>"
					alt="Attached Image" />
				<%
					} else if (fileBytes.length > 0 && (fileBytes[0] == (byte) 0x89 && fileBytes[1] == (byte) 0x50)) { // PNG
					%>
				<img src="data:image/png;base64,<%=fileBase64%>"
					alt="Attached Image" />
				<%
					} else {
					%>
				<a href="data:application/octet-stream;base64,<%=fileBase64%>"
					download="<%=fileName%>"><%=fileName%></a>
				<%
					}
					}
					%>

				<%
					List<Map<String, Object>> replies = (List<Map<String, Object>>) request.getAttribute("replies");
					%>

				<%
					if (replies != null && !replies.isEmpty()) {
					%>
				<table>
					<%
						for (Map<String, Object> reply : replies) {
						%>
					<tr>
						<td>
							<div class="dialog-header">
								<%
									byte[] profilePic = (byte[]) reply.get("profile_picture");
									if (profilePic != null) {
										String base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(profilePic);
									%>
								<img src="<%=base64Image%>" alt="Profile Icon"
									class="dialog-profile-icon" style="background-color: #555;">
								<%
									} else {
									%>
								<img src="/img/default.jpg" alt="Profile Icon"
									class="dialog-profile-icon" style="background-color: #555;">
								<%
									}
									%>

								<p class="mb-0"><%=reply.get("fullName")%></p>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="dialog-body">
								<p class="mb-0"><%=reply.get("reason")%></p>
							</div>
						</td>
					</tr>
					<%
						}
						%>
				</table>
				<%
					} else {
					}
					%>

				<script src="js/sidebar.js"></script>
				<!-- Include jQuery -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<!-- Include Lightbox 2 JS -->
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>
				<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
					crossorigin="anonymous"></script>
				<script
					src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

				<script>
						document
								.getElementById('status-form')
								.addEventListener(
										'submit',
										function() {
											// Show spinner when form is submitted
											document
													.getElementById('loading-spinner').classList
													.remove('d-none');
											// Disable submit button to prevent multiple submissions
											document.getElementById(
													'submit-btn').setAttribute(
													'disabled', 'true');
										});
					</script>
				<script>
						var replyModal = document.getElementById('replyModal');
						replyModal.addEventListener('show.bs.modal', function(
								event) {
							// Button that triggered the modal
							var button = event.relatedTarget;

							// Extract info from data-* attributes
							var ticketId = button
									.getAttribute('data-ticket-id');

							// Update the modal's hidden input field with the ticket_id
							var ticketIdInput = replyModal
									.querySelector('input[name="ticket_id"]');
							ticketIdInput.value = ticketId;
						});
					</script>
				<script>
						function openCancelModal(ticketId) {
							document.querySelector('input[name="ticket_id"]').value = ticketId;
						}
					</script>
</body>
</html>