<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Dproduct"%>
<%@page import="model.Enquiry"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.container1 {
	margin-top: 100px;
	width: 100%;
	padding-left: 100px;
}

.container {
	max-width: 1300px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
}
/* body{
font-family: 'Poppins', sans-serif;
background-color: white;
}*/
/* .header{
background: radial-gradient(#fff,#ffd2d2);
background-color: whitesmoke;
}*/
.col-md-7 {
	/* color:#555;*/
	
}

.d-block w-100 {
	border-radius: 50px 0px 50px 0px;
}

.row {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	justify-content: space-around;
}

.price {
	color: #FE980F;
	font-size: 26px;
	font-weight: bold;
	padding-top: 20px;
}
/* .cart{
background: #FE980F;
color:#FFFFFF;
font-size: 15px;
margin-left:20px;
}*/
.but {
	display: inline-block;
	color: black;
	padding: 8px 30px;
	margin: 30px 0;
	text-decoration: none;
	box-shadow: rgba(0, 0, 0, 0.17) 0px -23px 25px 0px inset,
		rgba(0, 0, 0, 0.15) 0px -36px 30px 0px inset, rgba(0, 0, 0, 0.1) 0px
		-79px 40px 0px inset, rgba(0, 0, 0, 0.06) 0px 2px 1px,
		rgba(0, 0, 0, 0.09) 0px 4px 2px, rgba(0, 0, 0, 0.09) 0px 8px 4px,
		rgba(0, 0, 0, 0.09) 0px 16px 8px, rgba(0, 0, 0, 0.09) 0px 32px 16px;
}
</style>
</head>
<body class="container"
	style="background-color: #f1f8e9; font-style: inherit; color: rgb(99, 118, 84);">
	<div class="header">
		<div class="container">
			<%@include file="header.jsp"%>
			<%
			Enquiry en = new Enquiry(session);
			ArrayList<Dproduct> al = en.get_eventinfo(request.getParameter("event_category"));
			Iterator<Dproduct> it = al.iterator();
			while (it.hasNext()) {
				Dproduct s = it.next();
			%>
			<div class="container1">
				<div class="row">
					<div class="col-md-5">
						<img src="images/<%=s.getP_image()%>" class="d-block w-100"
							style="border-radius: 50px 0px 50px 0px; width: 350px; height: 250px;">
					</div>
					<div class="col-md-7">
						<h2><%=s.getP_name()%></h2>
						<p class="price">
							&#8377
							<%=s.getP_cost()%></p>
						<p><%=s.getP_details()%></p>
						<%
						if (session.getAttribute("uname") != null) {
						%>
						<a href="eventBooking.jsp?event_id=<%=s.getP_id()%>" class="but">Book
							Now</a>
						<%
						} else {
						session.setAttribute("logoutredirect", "events.jsp?event_category=" + request.getParameter("event_category"));
						%>
						<a href="login.jsp" class="but">Book Now</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<br>
	<br>
	<br>
	<!-- <%@include file="footer.jsp"%> -->
</body>
</html>