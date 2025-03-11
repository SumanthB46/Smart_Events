<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: sans-serif;
}

nav {
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	justify-content: space-around;
	align-items: center;
	min-height: 10vh;
	background-color: transparent;
}

.logo {
	color: #141733;
	text-transform: capitalize;
	font-size: 24px;
	cursor: pointer;
	font-weight: 900;
	letter-spacing: 1px;
	text-shadow: 2px 2px 6px white;
}

.menu {
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	justify-content: space-around;
	width: 30%;
	text-shadow: 2px 2px 6px white;
}

.menu li {
	list-style: none;
	font-size: 30px;
}

.menu a {
	color: #141733;
	text-decoration: none;
	font-size: 19px;
	padding: 30px;
	font-weight: 600;
}

.menu a:hover {
	color: #ff6138;
	transition: .6s;
}

.bar {
	display: none;
	cursor: pointer;
}

.bar div {
	width: 25px;
	height: 3px;
	background-color: #ff6138;
	margin: 5px;
	transition: all .5s ease;
}

@media screen and (max-width:1024px) {
	.menu {
		width: 60%;
	}
	.menu a {
		color: #fff;
	}
}

@media screen and (max-width:768px) {
	body {
		overflow-x: hidden;
	}
	.menu {
		position: absolute;
		right: -100%;
		height: 90vh;
		top: 10vh;
		background-color: #000;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
		transform: translateX(100%);
		transition: transform 0.5s ease-in-out;
		opacity: .9;
	}
	.bar {
		display: block;
	}
	.menu a {
		color: #fff;
	}
}

.nav-active {
	transform: translateX(-100%);
}

.bar-active .bar-1 {
	transform: rotate(-45deg) translate(-5px, 6px);
}

.bar-active .bar-2 {
	opacity: 0;
}

.bar-active .bar-3 {
	transform: rotate(45deg) translate(-5px, -6px);
}

.banner {
	height: 100vh;
	background-size: cover;
	background-position: center;
}

.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.4s;
	animation-name: fade;
	animation-duration: 1.4s;
}

@
-webkit-keyframes fade {
	from {opacity: .5
}

to {
	opacity: 2
}

}
@
keyframes fade {from { opacity:.5
	
}

to {
	opacity: 2
}

}
.content h2 {
	color: #fff;
	cursor: pointer;
	font-size: 80px;
	font-weight: 100;
	text-shadow: 2px 2px 6px black;
}

.content p {
	width: 50%;
	color: #fff;
	line-height: 2;
	margin: auto;
	cursor: pointer;
	font-size: 40px;
	text-shadow: 2px 6px 6px black;
}

.content span {
	font-size: 40px;
	color: gold;
}

.btn a {
	text-decoration: none;
	background: #ff6138;
	padding: 15px 10px;
	display: inline-block;
	color: #fff;
	margin-top: 15px;
	border-radius: 50px;
	width: 130px;
	text-align: center;
}

.wrapper {
	width: 1060px;
	margin: auto;
	padding-top: 12%;
}

.content {
	text-align: center;
}

@media only screen and (min-width: 768px) and (max-width: 991px) {
	.wrapper {
		width: 75%;
		padding-top: 26%;
	}
	.content {
		text-align: center;
	}
	.content h2 {
		font-size: 60px;
	}
	.content p {
		width: 100%;
	}
}

@media screen and (max-width: 767px) {
	.banner {
		background-position: 60%;
	}
	.wrapper {
		width: 75%;
		padding-top: 26%;
	}
	.content h2 {
		font-size: 25px;
	}
	.content p {
		width: 100%;
	}
	.btn a {
		padding: 9px 4px;
		width: 105px;
	}
}
</style>
</head>
<body class="container">
	<section class="banner fade">
		<header>
			<nav>
				<div class="navigations">
					<ul class="menu">
						<li><a href="adHome.jsp">Home</a></li>
						<li><a href="viewEvents.jsp">Events</a></li>
						<li><a href="ViewClients.jsp">Clients</a></li>
						<li><a href="bookedEvents.jsp">Booked</a></li>
						<li><a href="addDelEvent.jsp">Add/Delete</a></li>
						<li><a href="enquiryList.jsp">Enquiry</a></li>
						<li><a href="viewReview.jsp">Feedback</a></li>
						<%
						if (session.getAttribute("uname") != null) {
						%>
						<li><a href="register?logout=yes">Logout</a></li>
						<li><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("uname")%></li>
						<%
						}
						%>
					</ul>
				</div>
				<div class="bar">
					<div class="bar-1"></div>
					<div class="bar-2"></div>
					<div class="bar-3"></div>
				</div>
			</nav>
		</header>
		<div class="wrapper">
			<div class="content">
				<p>
					Epic<span>V</span>ents
				</p>
				<h2>Admin Home Page</h2>
			</div>
		</div>
	</section>
	<script>
        const X = () => {
            const menu = document.querySelector('.bar');
            const nav = document.querySelector('.menu');
            
            menu.addEventListener('click', () => {
               menu.classList.toggle('bar-active');
                nav.classList.toggle('nav-active');
            });
        }
        X();
        
        function changeBg() {
			
        	const images = [
        		'url("./images/ad1.jpg")',
        		'url("./images/ad2.jpg")',
        		'url("./images/ad3.jpg")',
        		'url("./images/ad4.jpg")',		
        	]
        	const section = document.querySelector('section')
        	const bg=images[Math.floor(Math.random()* images.length)];
        	section.style.backgroundImage=bg;
		}
        setInterval(changeBg,2000);
    </script>
</body>
</html>