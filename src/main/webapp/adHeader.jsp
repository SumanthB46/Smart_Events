<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: sans-serif;
	overflow-x: hidden;
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
	background: #fff;
}

.logo {
	color: #141733;
	text-transform: capitalize;
	font-size: 24px;
	cursor: pointer;
	font-weight: 900;
	letter-spacing: 1px;
	font: bolder;
	margin-left: 0px;
}
.logo h5{
font-size: 30px;
	cursor: pointer;
	font-weight: 500;
}
.logo span{
color:gold;
}

.menu {
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	width: 80%;
	margin-left: 0px;
}

.menu li {
	list-style: none;
	margin-top: 10px;
	margin-left: 10px;
}

.menu a {
	color: #141733;
	text-decoration: none;
	font-size: 18px;
	padding: 10px;
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
</style>
</head>
<body class="container">
	<header>
		<nav>
			<div class="logo">
				<h5>Epic<span>Vents</span></h5>
			</div>
			<ul class="menu">
				<li><a href="adHome.jsp">Home</a></li>
				<li><a href="viewEvents.jsp">Events</a></li>
				<li><a href="ViewClients.jsp">Clients</a></li>
				<li><a href="bookedEvents.jsp">Booked</a></li>
				<li><a href="addDelEvent.jsp">Add/DeleteEvent</a></li>
				<li><a href="enquiryList.jsp">Enquiry</a></li>
				<li><a href="viewReview.jsp">Feedback</a></li>
				<% if (session.getAttribute("uname") != null) {%>
				<li><a href="register?logout=yes">Logout</a></li>
				<li><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("uname")%></li>
				<%}%>
			</ul>
			<div class="bar">
				<div class="bar-1"></div>
				<div class="bar-2"></div>
				<div class="bar-3"></div>
			</div>
		</nav>
	</header>
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
    </script>
</body>
</html>