<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Design</title>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
 
    <style>
    * {
    box-sizing: border-box;
		}  
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            overflow-x: hidden;               
       		 }
       		 
#scrollToTopBtn {
  position: fixed;
  bottom: 20px;
  right: 20px;
  background-color: blue;
  color: white;
  border: none;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  font-size: 24px;
  display: none;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: opacity 0.3s ease;
}

#scrollToTopBtn:hover {
  background-color: #0056b3;
}

        .landing-video {
            width: 100%;
            height: 100vh;
            object-fit: cover;
        }

        .Header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: absolute;
    top: 0;
    width: 100%;
    padding: 10px 20px;
    z-index: 10;
    max-width: 100%;
}
        

      @media (max-width: 1200px) {
    .Header {
        flex-wrap: wrap;
        justify-content: center;
    }
}

        .logo img {
            height: 100px;
        }

        .parent {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-right: 20px;
        }

        .parent a {
            text-decoration: none;
            color: white;
            font-weight: 800;
            font-size: 28px;
            margin-right: 20px;
        }

        .parent a:hover {
            color: black;
            text-decoration: underline;
        }

        .service {
            padding: 20px;
            background-color: rgb(232, 218, 201);
        }

        .service h1 {
            text-align: center;
            font-family: "Lucida Handwriting", cursive;
            font-size: 2rem;
        }
    
        .service .box-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2.5rem;
        }
        .service .box:hover {
  transform: translateY(-6px);
}
        .service .box {
            border-radius: 0.5rem;
            background: rgb(168, 163, 163);
            text-align: center;
            transition: transform 0.3s ease;
            overflow: hidden;
        }
    
        .service .box img {
            width: 100%;
            gap: 20px;
            object-fit: cover;
        }

        .about-heading {
            text-align: center;
            font-size: 2rem;
        }

        .about-info {
            
            justify-content: center;
            text-align: center;
        }
        .about-info p{
            margin: 30px 30px;
            font-size: large;
            font-weight: 3  00;
        }
       .abt-btn {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
  
}
.about-btn{
    background-color: rebeccapurple;
    height: 45px;
    width: 160px;
    font-size: large;
    color: white;
}

            .about-btn:hover {
                background-color: white;
                border: 2px solid rebeccapurple;
                color: rebeccapurple;
            }
            .about-us{
        margin-top: 0px;
        display: flex;
        margin: 30px;

    }
        @media (max-width: 1200px) {
    .about-us {
        flex-wrap: wrap;
        justify-content: center;
    }
}
    @media (max-width: 1200px) {
    .card-1, .card-2 {
        flex-wrap: wrap;
        justify-content: center;
    }
}
     .card-1, .card-2 {
            display: flex;
            flex-direction: column;
            
           
            
        }

        .card-1 img{
            height: 400px;
            width: 600px;
            object-fit: cover; 
           
        }

        .card-2 {
            height: 400px;
            width: 600px;
            object-fit: cover;
            color: white;
            background-image:linear-gradient(to bottom right, violet,yellow) ;

        }
        .card-2 H3{
            margin-top: 20px;
            margin-left: 40PX;
            margin-right: 40PX;
            font-size:70px;
         margin-bottom: 0px;  
        }
        .card-2 span{
color: rgb(61, 9, 118);
        }
        .card-2 p{
            margin-left: 40PX;
            margin-right: 40PX;
            text-shadow: black;
            font-size:25px;
           
        }

        .cont-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .cont-left {
            flex: 1;
            min-width: 280px;
        }

        .cont-right {
            flex: 1;
            min-width: 280px;
            margin-top: 80px;
        }

        .input-contact input {
            width: 95%;
            margin-bottom: 10px;
            padding: 10px;
        }


    </style>
</head>
<body>
 <button id="scrollToTopBtn"><i class="fa-sharp fa-solid fa-arrow-up"></i></button>
    <video class="landing-video" autoplay loop muted>
        <source src="./src/main/webapp/images/video.mp4" type="video/mp4">
    </video>
    <section class="Header">
        <div class="logo">
            <img src="./src/main/webapp/images/logo.png" id="#home" alt="logo">
        </div>
        <div class="parent">
            <a href="#home">Home</a>
            <a href="service.jsp">Services</a>
            <a href="about.jsp">About</a>
            <a href="gallery.jsp">Gallery</a>
            <a href="contact.jsp">Contact</a>
            <a href="login.jsp">Login</a>
            <% if (session.getAttribute("uname") != null) {%>
                <li><a href="register?logout=yes">Logout</a></li>
                <li><i class="fa fa-user-circle" aria-hidden="true"></i>
                <%=session.getAttribute("uname")%></li>	
                <%}%>
        </div>
    </section>

    <section class="service" id="service">
        <h1>We<span style="color: red;">Arrange</span></h1>
        <div class="box-container">
            <div class="box">
                <img src="./src/main/webapp/images/corpo.jpg" alt="">
                <h3>CORPORATE EVENT</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
            <div class="box">
                <img src="./src/main/webapp/images/birthday.jpg" alt="">
                <h3>BIRTHDAY EVENT</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
            <div class="box">
                <img src="./src/main/webapp/images/wedding.jpg" alt="">
                <h3>WEDDING EVENT</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
            <div class="box">
                <img src="./src/main/webapp/images/decor.jpg" alt="">
                <h3>DECOR</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
            <div class="box">
                <img src="./src/main/webapp/images/pv.jpg" alt="">
                <h3>PHOTOGRAPHY & VIDEO</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
            <div class="box">
                <img src="./src/main/webapp/images/enterain.jpg" alt="">
                <h3>CONCERT</h3>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
        </div>
    </section>

    <div class="about-heading">
        <h1><span style="color: rebeccapurple;">ABOUT</span> US</h1>
    </div>
  
    
    <div class="about-info">    
        <p>At EPICVENTS we are passionate about creating unforgettable experiences through expert event management. With years of industry experience, we specialize in planning, organizing, and executing events that leave lasting impressions. Whether it’s a corporate conference, a glamorous wedding, or a community festival, we bring creativity, precision, and dedication to every detail. Our team works closely with clients to understand their vision and transform it into reality, ensuring every event is unique and flawlessly executed. At the heart of our service is a commitment to excellence, innovation, and customer satisfaction. Your event, our expertise!</p>
    </div>
    <div class="abt-btn">
       <a href="about.jsp"><button class="about-btn">Know More <i class="fa-solid fa-arrow-right"></i></button></a>
    </div>
    <section class="about-us">
          
        <div data-aos="fade-right" data-aos-duration="2000" class="card-1">
            <img src="./images/about-img.webp" alt="Logo 1">
        </div>
        <div data-aos="fade-left" data-aos-duration="2000" class="card-2">
            <H3><span>WELCOME</span> TO EPIC EVENTS & SERVICES</H3>
        <P>WE TAKE RESPONSIBILITY OF MAKING YOUR DREAM A REALITY</P> </div>
    </section>

    <div class="cont-container">
        <div class="cont-left">
            <h1><span style="color: rebeccapurple;">LOCATE</span> US</h1>
            <iframe style="width: 100%; height: 300px;" src="https://maps.google.com/maps?q=pentagon%20space%20head&amp;output=embed"></iframe>
        </div>
        <div class="cont-right">
            <div class="input-contact">
                <input type="text" placeholder="Full Name">
                <input type="email" placeholder="Email">
                <input type="text" placeholder="Phone">
                <input type="text" placeholder="Message">
                <input type="submit" value="Submit" style="width: 30%;">
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <script> // Get the button element
    const scrollToTopBtn = document.getElementById("scrollToTopBtn");

 // Show the button when scrolled down
 window.addEventListener("scroll", () => {
   if (window.scrollY > 300) {
     scrollToTopBtn.style.display = "flex";
   } else {
     scrollToTopBtn.style.display = "none";
   }
 });

 // Scroll to top when the button is clicked
 scrollToTopBtn.addEventListener("click", () => {
   window.scrollTo({
     top: 0,
     behavior: "smooth"
   });
 });
</script>
<%@ include file="footer.jsp"%>
</body>
</html>