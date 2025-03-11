<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.Events"%>
<%@page import="model.Enquiry"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' id='font-awesome-5-all-css'
	href='https://eventsstudio.in/wp-content/plugins/elementor/assets/lib/font-awesome/css/all.min.css?ver=3.18.3'
	type='text/css' media='all' />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous" />
<style>
/*<!-- categories-->*/
.categories {
	margin: 40px 0;
}

.small-container {
	max-width: 1080px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-around;
}

.categories .col-3 {
	flex-basis: 100%;
	min-width: 250px;
	margin-bottom: 0px;
	text-align: center;
	padding: 40px 10px;
	/* box-shadow: 0 0 20px 0px rgba(0,0,0,0.1);*/
	cursor: pointer;
	transition: transform 0.5s;
}

.categories .col-3 img {
	width: 350px;
	height: 250px;
	margin-top: 20px;
	border-radius: 50px 0px 50px 0px;
}

.categories .col-3:hover {
	transform: translateY(-6px);
}

a {
	text-decoration: none;
	font-size: 30px;
}

</style>
</head>
<body class="container"
	style=" font-style: inherit; color: rgb(99, 118, 84);">
	<%@ include file="header.jsp"%>
	<div class="categories">
		<div class="small-container">
			<div class="container-fluid text-center pt-4 pb-4"
				style="color: black; box-shadow: rgba(0, 0, 0, 0.1) 0px 5px 15px;">
				<h1 class="title">Event Categories</h1>
			</div>
			<%
			Enquiry s1 = new Enquiry(session);
			ArrayList<Events> ar = s1.getEventList();
			Iterator<Events> itr = ar.iterator();
			while (itr.hasNext()) {
				Events s = itr.next();
			%>
			<div class="row">
				<div class="col-3">
					<a class="text-success"
						href="events.jsp?event_category=<%=s.getEvent_category()%>"><img
						src="images/<%=s.getEvent_img()%>"><br><%=s.getEvent_category()%></a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>