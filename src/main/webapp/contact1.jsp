<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<style>
.error {
	color: red;
}

input {
	display: block;
}

#msg {
	color: green;
	width: 100%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
}
</style>
</head>
<body class="container"
	style="background-color: #f1f8e9; font-style: inherit; color: black;">
	<script>
		//jQuery.validator.addMethod( name, method [, message ] )
		//
		//value---> "current value of the validated element".
		//elememt---> " element to be validated ".
		jQuery.validator
				.addMethod(
						"checkemail",
						function(value, element) {
							return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
									.test(value)
									|| /^[0-9]{10}$/.test(value);
						});
		jQuery(document)
				.ready(
						function($) {
							$("#signup").validate({
												//ignore: [],
												rules : {
													name : {
														required : true
													},
													email : {
														required : true,
														checkemail : true
													},
													phone : {
														required : true,
														minlength : 10,
														maxlength : 10
													},
messages: {
													name : {
														required : "Please enter the name."
													},
													email: {
														required : "Please enter the email.",
														email : "Please enter valid email id"
													},
phone: {
														required : "Please enter the number.",
														minlength : "Please enter the 10 digit number .",
														maxlength : "more than 10 digits."
													}
												}
											});
						});
	</script>
	<div class="container-fluid row mt-5 text-center">
		<div id="contact" class="w-50">
			<div class="row">
				<div>
					
					<h1 class="d-inline display-4 m-3 "style="color:red;">Contact Us</h1>
				</div>
				<div class="text-start me-5 p-5">
					<p class="me-5">Thank you for considering our event management
						services. We value your interest and are here to assist you every
						step of the way. If you have any questions, inquiries, or would
						like to discuss your upcoming event, our dedicated team is ready
						to help. Whether you're planning a corporate conference, a social
						gathering, or a special celebration, we have the expertise to
						ensure a seamless and memorable experience.</p>
					<p class="me-5">
						<span class="text-success">Office Address:</span> Plot No.765,8th
						Cross Road, M.R.C.R Extension, Govindaraja Nagar, Bangalore-560040
						(Near Hosahalli metro station)
					</p>
					<p class="me-5">
						<span class="text-success">Contact Number: </span> +91 9916012459
					</p>
					<p class="me-5">
						<span class="text-success">Mail ID: </span> samratevents@gmail.com
					</p>
				</div>
				
			</div>
		</div>
		<div id="form" class="w-50 text-start">
			<%
			if (request.getAttribute("status") != null) {
			%>
			<div id="msg">
				<%=request.getAttribute("status")%></div>
			<%
			}
			%>
			<form method="POST" class="form-card" id="signup" action="register">
				<div class="row justify-content-between text-left">
					<div class="form-group col-sm-6 flex-column d-flex">
						<label class="form-control-label py-2">Name<span
							class="text-danger"> *</span>
						</label> <input type="text" name="name" class="px-3" required="required"
							style="height: 40px; border-color: #e0e0e0; border-style: solid;"
							placeholder="Your Name">
					</div>
					<div class="form-group col-sm-6 flex-column d-flex">
						<label class="form-control-label py-2">Email<span
							class="text-danger"> *</span></label> <input type="email" name="email"
							class="px-3" required="required"
							style="height: 40px;  border-color: #e0e0e0; border-style: solid;"
							id="lname" placeholder="example@email.com">
					</div>
				</div>
				<div class="row justify-content-between text-left">
					<div class="form-group col-sm-12 flex-column d-flex">
						<label class="form-control-label py-2">Contact Number<span
							class="text-danger"> *</span></label> <input type="number" name="phone"
							class="px-3" required="required"
							style="height: 40px;  border-color: #e0e0e0; border-style: solid;"
							id="email" placeholder="Your Contact Number">
					</div>
					<div class="form-group col-sm-12 flex-column d-flex">
						<label class="form-control-label py-2">Subject<span
							class="text-danger"> *</span></label> <input type="text" name="sub"
							required="required" class="px-3"
							style="height: 40px;  border-color: #e0e0e0; border-style: solid;"
							id="mob" placeholder="Your Message Subject">
					</div>
				</div>
				<div class="row justify-content-between text-left">
					<div class="form-group col-sm-12 flex-column d-flex">
						<label class="form-control-label py-2">Your Message<span
							class="text-danger"> *</span></label>
						<textarea type="text" name="msg" required="required" class="px-3"
							style="height: 180px; background-color: #f5f5f5; border: none;"
							id="job" placeholder="Your Message Here"></textarea>
					</div>
				</div>
				<div class="row justify-content-start m-3">
					<div class="form-group col-sm-6">
						<input type="submit" name="enq" value="Submit"
							style="width: 150px; height: 50px;background-color:rebeccapurple; color:white; ">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>