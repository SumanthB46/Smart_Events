<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Footer</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
    body{
    margin-left:0px;
    }
        .footer {
            background: linear-gradient(90deg, #ff7e5f, #feb47b);
            color: #fff;
            padding: 40px 0;
            text-align: center;
        }
        .footer a {
            color: #fff;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .social-icons a {
            margin: 0 10px;
            color: #fff;
            font-size: 24px;
        }
        .social-icons a:hover {
            color: #333;
        }
        .input {
            max-width: 400px;
            margin: 20px auto;
        }
        .footer-bottom {
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Footer Section -->
<footer class="footer">
    <div class="container">
        <!-- Call to Action -->
        <h3 class="mb-4">Let's Plan Your Next Event</h3>
        
        <!-- Links Section -->
        <div class="row justify-content-center mb-3">
            <div class="col-auto">
                <a href="#">Privacy Policy</a>
            </div>
            <div class="col-auto">
                <a href="#">Terms of Service</a>
            </div>
            <div class="col-auto">
                <a href="contact.jsp">Contact Us</a>
            </div>
            <div class="col-auto">
                <a href="about.jsp">About Us</a>
            </div>
            <div class="col-auto">
                <a href="#">FAQ</a>
            </div>
        </div>

        
        <div class="social-icons mb-4">
            <a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a>
            <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
        </div>

        
        <form class="input">
            <div class="input-group">
                <input type="email" class="form-control" placeholder="Enter your email" aria-label="Email address">
                <button class="btn btn-dark" type="submit">Subscribe</button>
            </div>
        </form>

        <!-- Footer Bottom Text -->
        <p class="footer-bottom">@2024 Events Co. Crafted with for your <i class="fa-solid fa-heart"></i> celebrations.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- FontAwesome -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>