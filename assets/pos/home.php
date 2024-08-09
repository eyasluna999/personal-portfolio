<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<div class="home-bg">

<section class="home">

   <div class="swiper home-slider">
   
   <div class="swiper-wrapper">

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/home 1.png" alt="">
         </div>
         <div class="content">
            <span></span>
            <h3>Build your dream PC!</h3>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/home 2.jpg" alt="">
         </div>
         <div class="content">
            <span></span>
            <h3>Experience Greatness</h3>
            <span>With the new NVIDIA 4000 Series Graphcis Cards</span>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/home 3.png" alt="">
         </div>
         <div class="content">
            <h3>Dominate with Pulsar</h3>
            <span>up to 30% off!</span>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

   </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

</div>

<section class="category">

   <h1 class="heading">shop by category</h1>

   <div class="swiper category-slider">

   <div class="swiper-wrapper">

   <a href="category.php?category=cpu" class="swiper-slide slide">
      <img src="images/CPU.jpg" alt="">
      <h3>CPU</h3>
   </a>

   <a href="category.php?category=gpu" class="swiper-slide slide">
      <img src="images/GPU.jpg" alt="">
      <h3>GPU</h3>
   </a>

   <a href="category.php?category=ram" class="swiper-slide slide">
      <img src="images/RAM icon.png" alt="">
      <h3>RAM</h3>
   </a>

   <a href="category.php?category=motherboard" class="swiper-slide slide">
      <img src="images/Motherboard icon.png" alt="">
      <h3>Motherboard</h3>
   </a>

   <a href="category.php?category=psu" class="swiper-slide slide">
      <img src="images/PSU icon.png" alt="">
      <h3>Power Supply</h3>
   </a>

   <a href="category.php?category=hdd" class="swiper-slide slide">
      <img src="images/hdd.png" alt="">
      <h3>Hard Drives</h3>
   </a>

   <a href="category.php?category=nvme" class="swiper-slide slide">
      <img src="images/nvme.png" alt="">
      <h3>NVME SSDs</h3>
   </a>

   <a href="category.php?category=case" class="swiper-slide slide">
      <img src="images/case.jpg" alt="">
      <h3>PC Case</h3>
   </a>


   <a href="category.php?category=monitor" class="swiper-slide slide">
      <img src="images/monitor.jpg" alt="">
      <h3>Monitor</h3>
   </a>

   <a href="category.php?category=mouse" class="swiper-slide slide">
      <img src="images/mouse icon.png" alt="">
      <h3>Mouse</h3>
   </a>


   <a href="category.php?category=keyboard" class="swiper-slide slide">
      <img src="images/keyboard.png" alt="">
      <h3>Keyboard</h3>
   </a>


   <a href="category.php?category=headset" class="swiper-slide slide">
      <img src="images/headset.png" alt="">
      <h3>Headsets</h3>
   </a>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>

<section class="home-products">

   <h1 class="heading">latest products</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <?php
     $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="swiper-slide slide">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-star" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>₱</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products added yet!</p>';
   }
   ?>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>











<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".home-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
    },
});

 var swiper = new Swiper(".category-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
         slidesPerView: 2,
       },
      650: {
        slidesPerView: 3,
      },
      768: {
        slidesPerView: 4,
      },
      1024: {
        slidesPerView: 5,
      },
   },
});

var swiper = new Swiper(".products-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>