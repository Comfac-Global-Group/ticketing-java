<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>CGG NEXUS</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="icon" href="img/logo2.png" type="image/x-icon">
<link rel="stylesheet" href="css/des5.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@10">


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
.grid-item {
	width: 48%;
	margin: 1%;
}

@media ( max-width : 767px) {
	.grid-item {
		width: 100%;
		margin: 0;
	}
}

.grid-item {
	width: 48%;
	margin: 1%;
	float: left;
}

@media ( max-width : 767px) {
	.grid-item {
		width: 100%;
		margin: 0;
		float: none;
	}
}

.footer {
	padding: 10px 0;
}

.logo img {
	width: 100px;
	height: auto;
}

.copyright {
	text-align: center;
}

.copyright p {
	font-weight: bold;
	font-size: 16px;
}

.logo-text {
	font-size: 24px;
	margin-left: 10px;
	font-weight: bold;
	color: #fff;
}

.gallery-image img {
	width: 250px;
	height: auto;
	border-radius: 15px;
}

.row {
	display: flex;
	flex-direction: column;
}

.contact-input {
	margin-bottom: 5px;
}
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
}

</style>
</head>

<body>
	<main>

<header id="header">
    <div class="overlay overlay-lg"></div>
    <nav id="navbar">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><img src="img/logo2.png" alt=""></a>
                <span class="logo-text">CGG NEXUS</span>
            </div>
            
            <!-- Hamburger Menu Icon -->
            <div class="hamburger-menu" onclick="toggleMenu()">
                <div class="bar"></div>
            </div>

            <div class="links">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#aboutus">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="login.jsp" class="active">LOGIN</a></li>
                </ul>
            </div>
            
            <!-- Mobile-specific Login button -->
            <div class="mobile-login">
                <a href="login.jsp" class="login-button" style=margin-left:10px>Login</a>
            </div>
        </div>
    </nav>
</header>

		<section class="portfolio section" id="portfolio">
			<div class="background-bg">
				<div class="overlay overlay-sm">
					<img src="./img/shapes/half-circle.png" class="shape half-circle1"
						alt="" /> <img src="./img/shapes/half-circle.png"
						class="shape half-circle2" alt="" /> <img
						src="./img/shapes/wave.png" class="shape wave" alt="" /> <img
						src="./img/shapes/circle.png" class="shape circle" alt="" /> <img
						src="./img/shapes/triangle.png" class="shape triangle" alt="" />
					<img src="./img/shapes/x.png" class="shape xshape" alt="" />
				</div>
			</div>
			<div class="container">
				<div class="section-header">
					<h3 class="title">COMPANIES</h3>
				</div>

				<div class="section-body">
					<div class="grid">
						<div class="grid-item logo-design">
							<div class="gallery-image">
								<img src="./img/portfolio/compf.png" alt="" />
								<div class="img-overlay">
									<div class="img-description">
										<center>
											<h3>
												<b>COMFAC CORPORATION</b>
											</h3>
										</center>
										<center>Integrating technology solutions for
											workspace and people.</center>
									</div>
									<a href="http://comfaccorp.com/" class="btn" target="_blank">Click</a>
								</div>
							</div>
						</div>

						<div class="grid-item webdev">
							<div class="gallery-image">
								<img src="./img/portfolio/cors.png" alt="" />
								<div class="img-overlay">
									<div class="img-description">
										<center>
											<h3>
												<b>CORNERSTEEL SYSTEMS CORPORATION</b>
											</h3>
										</center>
										<center>Marketing and manufacturing modular and
											custom-made furniture.</center>
									</div>
									<a href="http://cornersteelsystems.com/" class="btn"
										target="_blank">Click</a>
								</div>
							</div>
						</div>

						<div class="grid-item ui webdev">
							<div class="gallery-image">
								<img src="./img/portfolio/esco1.png" alt="" />
								<div class="img-overlay">
									<div class="img-description">
										<center>
											<h3>
												<b>ESCO INC.</b>
											</h3>
										</center>
										<center>Facilities maintenance and sustainability
											solutions.</center>
									</div>
									<a href="http://escoincsolutions.com/" target="_blank"
										class="btn">Click</a>
								</div>
							</div>
						</div>

						<div class="grid-item ui webdev">
							<div class="gallery-image">
								<img src="./img/portfolio/comft.png" alt="" />
								<div class="img-overlay">
									<div class="img-description">
										<center>
											<h3>
												<b>COMFAC TECHNOLOGY OPTIONS</b>
											</h3>
										</center>
										<center>Consulting and information technology
											services to enterprise.</center>
									</div>
									<a href="https://www.comfactechoptions.com/" target="_blank"
										class="btn">Click</a>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>


		<section class="aboutus section" id="aboutus">
			<div class="header-content">
				<div class="container grid-2">
					<div class="column-1">
						<h1 class="header-title">CGG NEXUS</h1>
						<p class="text" style="text-align: justify;">CGG NEXUS is a
							specialized platform designed to streamline and enhance the
							users' support process by leveraging digital technology. It
							serves as a centralized hub for users to report issues, seek
							assistance, and receive timely resolutions, ensuring a seamless
							support experience.</p>
					</div>
					<div class="container-about">
						<div class="column-2 image">
							<img src="./img/cover2.jpg" class="img-element z-index" alt="" />
						</div>
						<div class="column-2 image1">
							<img src="./img/cover1.jpg" class="img-element z-index" alt="" />
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="contact" id="contact">
			<div class="container">
				<div class="contact-box">
					<div class="contact-info">
						<h3 class="title">Get in touch</h3>
						<p class="text">If you need our assistance, we invite you to
							fill out the forms on our website. Our team is available to
							answer any questions or concerns.</p>
						<div class="information-wrap">
							<div class="information">
								<div class="contact-icon">
									<i class="fas fa-map-marker-alt"></i>
								</div>
								<p class="info-text">536 Calbayog St. Mandaluyong City,
									Metro Manila 1550</p>
							</div>
							<div class="information">
								<div class="contact-icon">
									<i class="fas fa-paper-plane"></i>
								</div>
								<p class="info-text">cornetsteel@gmail.com</p>
							</div>
							<div class="information">
								<div class="contact-icon">
									<i class="fas fa-phone-alt"></i>
								</div>
								<p class="info-text">02-7907-15-07</p>
							</div>
						</div>
					</div>
					<div class="contact-form">
						<h3 class="title">Contact Us</h3>
						<form method="post" action="">
							<div class="row">
								<input type="text" name="first_name" class="contact-input"
									placeholder="First Name"
									oninput="restrictToLettersWithSingleSpace(this)" required>
								<span class="note"
									style="display: none; color: red; font-size: 12px;">Please
									enter letters only.</span>
							</div>
							<div class="row">
								<input type="text" name="last_name" class="contact-input"
									placeholder="Last Name"
									oninput="restrictToLettersWithSingleSpace(this)" required>
								<span class="note"
									style="display: none; color: red; font-size: 12px;">Please
									enter letters only.</span>
							</div>
							<div class="row">
								<input type="text" name="phone" maxlength="11"
									class="contact-input" placeholder="Phone"
									oninput="restrictToNumbers(this)" required> <span
									class="note"
									style="display: none; color: red; font-size: 12px;">Please
									enter a valid 11-digit numbers.</span>
							</div>
							<div class="row">
								<input type="email" name="email" class="contact-input"
									placeholder="Email" required>
							</div>
							<div class="row">
								<textarea name="message" class="contact-input textarea"
									placeholder="Message" required></textarea>
							</div>
							<input type="submit" name="submit" value="Send" class="btn">
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<footer class="footer">
		<div class="container">
			<div class="bottom-footer">

				<div class="copyright">
					<p class="text">&copy; 2024 Comfac Global Group.</p>
				</div>

				<div class="followme-wrap">
					<div class="followme">
						<h3>Follow Us</h3>
						<span class="footer-line"></span>
						<div class="social-media">
							<a href="https://www.facebook.com/ComfacGlobalGroupRecruitment/">
								<i class="fab fa-facebook-f"></i>
							</a>
						</div>
					</div>

					<div class="followme-wrap">
						<div class="followme">

							<div class="social-media">
								<a href="https://www.instagram.com/cornersteelsystemscorp/">
									<i class="fab fa-instagram"></i>
								</a>
							</div>
						</div>

						<div class="back-btn-wrap">
							<a href="#" class="back-btn"> <i class="fas fa-chevron-up"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
	</footer>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<script>
        function restrictToLettersWithSingleSpace(input) {
            var lastNameNote = input.parentNode.querySelector('.note');
            var inputValue = input.value;

            // Replace multiple spaces with a single space
            inputValue = inputValue.replace(/  +/g, ' ');

            // Remove any non-letter characters except spaces
            var lettersOnly = inputValue.replace(/[^A-Za-z ]/g, '');

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
    <script>
    function toggleMenu() {
        const navbar = document.getElementById('navbar');
        navbar.classList.toggle('open');  // Adds or removes the 'open' class
    }
    </script>
</body>

</html>