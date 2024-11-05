<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="icon" href="img/logo2.png" type="image/x-icon">
<link rel="stylesheet" href="css/des5.css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/login.css">
	

<!-- Boxicons CSS for icons -->
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
/* Base styles */
.links ul {
    display: flex;
}

.links ul li {
    list-style: none;
    margin: 0 15px;
}

/* Hide the mobile login button by default */
.mobile-login {
    display: none; /* Ensure it's hidden by default */
}

/* Media query for smaller screens */
@media (max-width: 768px) {
    /* Hide all links except the login link */
    .links ul li {
        display: none; /* Hide all items */
    }

    /* Show only the mobile login button */
    .mobile-login {
        display: block; /* Show mobile login button */
        margin-top: 10px; /* Optional: add some spacing */
    }
    
    /* Style the mobile login button */
    .mobile-login .login-button {
        background-color: #333; /* Button background */
        color: #fff; /* Button text color */
        padding: 10px 20px; /* Button padding */
        border-radius: 5px; /* Rounded corners */
        text-decoration: none; /* Remove underline */
        display: inline-block; /* Make it an inline block element */
    }
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar">
		<div class="navbar-logo">
			<a href="index.jsp"><img src="img/logo2.png"
				alt="CGG Nexus Logo"></a> <span class="logo-text">CGG NEXUS</span>
		</div>
		<div class="links">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="index.jsp#aboutus">About</a></li>
				<li><a href="index.jsp#contact">Contact</a></li>
				<li><a href="login.jsp" class="active always-visible">LOGIN</a></li>
			</ul>
		</div>
		
	</nav>

	<!-- Employee Login Form Section -->
	<section class="container forms">
		<div class="form login">
			<div class="form-content">
				<header>Login</header>
				<!-- Update the form action to use userServlet -->
				<form action="UserServlet" method="post">
					<input type="hidden" name="action" value="login">
					<div class="field input-field">
						<input type="email" id="email" name="email" placeholder="Email"
							class="input" required>
					</div>

					<!-- Password Input Field -->
					<div class="field input-field">
						<input type="password" id="password" name="password"
							placeholder="Password" class="password" required> <i
							class='bx bx-hide eye-icon'></i>
					</div>

					<!-- Forgot Password Link -->
					<div class="form-link">
						<a href="" class="forgot-pass">Forgot password?</a>
					</div>

					<!-- Sign In Button -->
					<div class="field button-field">
						<button type="submit" name="emp_login_btn">Sign In</button>
					</div>
				</form>

				<!-- Signup Link -->
				<div class="form-link">
					<span>Don't have an account yet? <a href="register.jsp"
						class="button">Signup</a></span>
				</div>

			</div>
		</div>
	</section>

	<!-- JavaScript to Toggle Password Visibility -->
	<script>
        const forms = document.querySelector(".forms"),
            pwShowHide = document.querySelectorAll(".eye-icon");

        pwShowHide.forEach(eyeIcon => {
        	
            eyeIcon.addEventListener("click", () => {
                let pwFields = eyeIcon.parentElement.querySelectorAll(".password");

                pwFields.forEach(password => {
                    if (password.type === "password") {
                        password.type = "text";
                        eyeIcon.classList.replace("bx-hide", "bx-show");
                    } else {
                        password.type = "password";
                        eyeIcon.classList.replace("bx-show", "bx-hide");
                    }
                });
            });
        });
    </script>

	<!-- Footer Section -->
	<footer class="footer">
		<div class="bottom-footer">
			<div class="copyright">
				<p class="text">&copy; 2024 Comfac Global Group.</p>
			</div>

			<!-- Social Media and Back-to-Top Button -->
			<div class="followme-wrap">
				<div class="followme">
					<h3>Follow Us</h3>
					<span class="footer-line"></span>
					<div class="social-media">
						<a href="https://www.facebook.com/ComfacGlobalGroupRecruitment/">
							<i class="fab fa-facebook-f"></i>
						</a> <a href="https://www.instagram.com/cornersteelsystemscorp/">
							<i class="fa fa-instagram"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- Back to Top Button -->
			<div class="back-btn-wrap">
				<a href="#" class="back-btn"> <i class="fas fa-chevron-up"></i>
				</a>
			</div>
		</div>
	</footer>
</body>

</html>
