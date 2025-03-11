<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.EnqList"%>
<%@page import="model.Enquiry"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container {
	max-width: 1500px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #35475e;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}

table.table tr th:first-child {
	width: 60px;
}

table.table tr th:last-child {
	width: 100px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: white;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.cost {
	float: right;
	font-size: 25px;
	color: black;
	padding-top: 20px;
	padding-right: 300px;
}

.btn btn-warning {
	margin-top: 17px
}
</style>
</head>
<body class="container"
	style="background-color: #f1f8e9; font-style: inherit; color: rgb(99, 118, 84);">
	<div class="header">
		<div class="container">
			<%@include file="adHeader.jsp"%>
		</div>
	</div>
	<%
	if (session.getAttribute("uname") != null) {
	%>
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="container-fluid"
					style="background-color: #648256; width: 1090px; height: 67px; margin-left: -23px; margin-top: -20px; font-style: inherit; color: white;">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Enquiry <b>List</b>
							</h3>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Subject</th>
							<th>Message</th>
							<th>Date</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
						Enquiry s1 = new Enquiry(session);
						ArrayList<EnqList> ar = s1.getEnquiryList();
						Iterator<EnqList> itr = ar.iterator();
						while (itr.hasNext()) {
							EnqList s = itr.next();
						%>
						<tr>
							<td><%=s.getId()%></td>
							<td><%=s.getName()%></td>
							<td><%=s.getEmail()%></td>
							<td><%=s.getPhno()%></td>
							<td><%=s.getSub()%></td>
							<td><%=s.getMsg()%></td>
							<td><%=s.getDate()%></td>
							<td>
								<form action="deleteenq" method="POST">
									<input type="hidden" name="userid" value="<%=s.getId()%>" /> <input
										type="submit" class="btn btn-danger" value="Delete" />
								</form>
							</td>
						</tr>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%}%>
	<%@include file="footer.jsp"%>
</body>
</html>