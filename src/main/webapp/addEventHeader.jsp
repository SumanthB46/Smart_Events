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

  span{
      color: gold;
    }
    h4{
       color: white;
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
	background-color: black;
}

.logo {
	color: #141733;
	text-transform: capitalize;
	font-size: 24px;
	cursor: pointer;
	font-weight: 900;
	letter-spacing: 1px;
	margin-left: -400px;
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
	margin-left: -600px;
	font-weight:large;
	color:red;
}

.menu li {
	list-style: none;
	margin-left: -20px;
}

.menu a {
	color: white;
	text-decoration: none;
	font-size: 15px;
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
keyframes fade {
	from {opacity: .5
}

to {
	opacity: 2
}

}
.content h2 {
	color: #fff;
	font-size: 60px;
	font-weight: 900;
	text-shadow: 2px 2px 6px black;
}

.content p {
	width: 50%;
	color: #fff;
	line-height: 2;
	margin: auto;
	text-shadow: 2px 2px 6px black;
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
	<header>
		<nav>
			<div class="logo">
				<h4>Epic<span>Vents</span></h4>
			</div>
			<ul class="menu">
				<li><a href="adHome.jsp">Home</a></li>
				<li><a href="viewEvents.jsp">Events</a></li>
				<li><a href="ViewClients.jsp">Clients</a></li>
				<li><a href="bookedEvents.jsp">Booked</a></li>
				<li><a href="addDelEvent.jsp">Add/Delete</a></li>
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