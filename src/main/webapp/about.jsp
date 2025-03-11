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
	<style>
	
	body{
	width:100%;
	overflow-x: hidden;
	}
	.bg-img{
	position:relative;
	width:100%;
	overflow:hodden;
	}
	.bg-img img {
		margin-left:20px
		
		
	}
	.featurette-heading{
	color:rebeccapurple;
	font-weight: 600;
	}
	.bg-img p {
		position: absolute; /* Positions the text on top of the image */
		top: 50%; /* Centers vertically */
		left: 50%; /* Centers horizontally */
		transform: translate(-50%, -50%); /* Adjusts for the center point */
		font-size: 90px;
		color: #f1f8e9;
			justify-content: center;
		align-items: center;
		display: flex;
		}

	</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="bg-img col-md-6">
			<p>ABOUT</p>
			<img src="./images/ab-bg.jpg" alt="Background">
		</div>
	<section class="container"
	style=" font-style: inherit; color:black;">
	<div class="container-fluid my-4">
		<div
			class="row featurette d-flex justify-content-center align-items-center">
			<div class="col-6">
				<h1 class="featurette-heading">About EPICVENTS</h1>
				<p>At EpicVents, we are passionate about creating
					exceptional and memorable events. With years of experience in the
					industry, we specialize in planning, organizing, and executing a
					wide range of events, from corporate conferences and trade shows to
					weddings and private parties.</p>
				<p>Our dedicated team of event professionals is committed to
					delivering excellence in every aspect of event management. We
					understand that each event is unique, and we take the time to truly
					understand your vision, goals, and requirements. From the initial
					concept to the final execution, we work closely with our clients to
					ensure that every detail is meticulously planned and executed to
					perfection.</p>
				<p class="lead"></p>
			</div>
			<div class="col-6">
				<img class="img-fluid" style="height: 500px; width: 600px;" alt=""
					src="./images/abt1.jpg">
			</div>
		</div>
		<div class="row featurette d-flex justify-content-center align-items-center">
			<div class="col-6 order-2">
			<img class="img-fluid" style="height: 500px; width: 600px;" alt=""
					src="./images/abt2.jpg">
			</div>
				<br>
				<h1 class="featurette-heading">Our Vision</h1>
				<p>At EpicVents, our vision is to be the premier provider of
					exceptional event experiences that leave a lasting impact. We
					believe that every event has the power to create memories, inspire
					connections, and bring people together in meaningful ways.</p>
				<p>Our vision is fueled by a deep passion for creativity,
					innovation, and the art of event planning. We strive to push the
					boundaries of what is possible, constantly seeking new and exciting
					ways to engage and captivate our clients and their guests. We
					envision events that not only meet expectations but surpass them,
					leaving a lasting impression and creating a buzz long after the
					event is over.</p>
				<p>We are committed to excellence in every aspect of event
					management. From the initial concept development to the meticulous
					planning and flawless execution, we leave no stone unturned in
					ensuring that every detail is taken care of.</p>
			
			
		</div>
		
			
	
	</div>
	
	
	<%@ include file="footer.jsp"%>
	</section>
</body>
</html>