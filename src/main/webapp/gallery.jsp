<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Image Categories</title>
  <style>
     body {
      font-family: Arial, sans-serif;
      text-align: center;
    }
    .header {
      position: relative;
      width: 100%;
      height: 300px;
      overflow: hidden;
    }
    .header img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .header-text {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: white;
      padding: 20px 40px;
      border-radius: 10px;
      font-size: 3.5rem;
      font-weight: bold;
    }
 
    .category-buttons {
      margin-bottom: 20px;
      justify-content: center;
      display: flex;
    }

    .category-buttons button {
      padding: 10px 20px;
      margin: 5px;
      border: none;
      background-color: grey;
      color: white;
      cursor: pointer;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    .category-buttons button:hover {
      background-color: #0056b3;
    }

    .images-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      margin-bottom:10px;
    }
    .images-container img {
      width: 350px;
      height: 200px;
      object-fit: cover;
      display: none; /* Hidden by default */
    }

    .images-container img:hover {
    transform: scale(1.05); 
}

    .images-container img.active {
      display: block; /* Display only the active images */
    }
  </style>
</head>
<body>
  <%@ include file="header.jsp"%>
  <section class="header">
    <img src="./images/gal-bg.jpg" alt="Gallery Background">
    <div class="header-text">
      Our <span>Gallery</span>
    </div>
  </section>
 
  <div class="category-buttons">
    <button onclick="filterImages('all')">All</button>
    <button onclick="filterImages('Marriage')">Marriage</button>
    <button onclick="filterImages('Birthday')">Birthday</button>
    <button onclick="filterImages('corporateevent')">corporateevent</button>
  </div>

  <div class="images-container">
    <img src="./images/m1.jpg" alt="Marriage1" class="Marriage">
    <img src="./images/m2.jpg" alt="Marriage1" class="Marriage">
    <img src="./images/wedding.jpg" alt="Marriage1" class="Marriage">
   
    <img src="./images/b1.jpg" alt="Birthday" class="Birthday">
    
    <img src="./images/b2.jpg" alt="Birthday" class="Birthday">
    <img src="./images/b3.jpg" alt="Birthday" class="Birthday">
    <img src="./images/c1.jpg" alt="corporateevent" class="corporateevent">
   
    <img src="./images/c2.jpg" alt="corporateevent" class="corporateevent">
    <img src="./images/corpo.jpg" alt="corporateevent" class="corporateevent">
   
  </div>

  <script>
    function filterImages(category) {
      const images = document.querySelectorAll('.images-container img');

      images.forEach(img => {
        if (category === 'all' || img.classList.contains(category)) {
          img.classList.add('active');
        } else {
          img.classList.remove('active');
        }
      });
    }

    // Display all images by default on page load
    filterImages('all');
  </script>
  <%@ include file="footer.jsp"%>
</body>
</html>

