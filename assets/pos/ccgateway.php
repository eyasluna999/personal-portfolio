<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:user_login.php');
};

if(isset($_POST['order'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $ccnumber = $_POST['ccnumber'];
   $ccnumber = filter_var($ccnumber, FILTER_SANITIZE_STRING);
   $expmonth = $_POST['expmonth'];
   $expmonth = filter_var($expmonth, FILTER_SANITIZE_STRING);
   $expyear = $_POST['expyear'];
   $expyear = filter_var($expyear, FILTER_SANITIZE_STRING);
   $cvv = $_POST['cvv'];
   $cvv = filter_var($cvv, FILTER_SANITIZE_STRING);


   $check_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
   $check_cart->execute([$user_id]);

   if($check_cart->rowCount() > 0){

      $insert_order = $conn->prepare("INSERT INTO `creditcard`(name, ccnumber, expmonth, expyear, cvv) VALUES(?,?,?,?,?)");
      $insert_order->execute([$name, $ccnumber, $expmonth, $expyear, $cvv]);


      $message[] = 'order placed successfully!';
   }else{
      $message[] = 'your cart is empty';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="checkout-orders">

   <form action="" method="POST">

   

      <h3>Billing Information:</h3>

      <div class="flex">
         <div class="inputBox">
            <span>Name on Card:</span>
            <input type="text" name="name" placeholder="Juan Dela Cruz" class="box" maxlength="20" required>
         </div>
         <div class="inputBox">
            <span>Credit Card Number:</span>
            <input type="number" name="ccnumber" placeholder="4834 xxxx xxxx xxxx" class="box" min="0" max="9999999999999999" onkeypress="if(this.value.length == 16) return false;" required>
         </div>
         <div class="inputBox">
            <span>Expiration Month:</span>
            <input type="number" name="expmonth" placeholder="04" class="box" maxlength="2" required>
         </div>
         <div class="inputBox">
            <span>Expiration Year:</span>
            <input type="number" name="expyear" placeholder="2030" class="box" maxlength="4" required>
         </div>
         <div class="inputBox">
            <span>CVV</span>
            <input type="text" name="cvv" placeholder="304" class="box" maxlength="3" required>
         </div>

      </div>

      <input type="submit" name="order" class="btn" value="place order">

   </form>

</section>













<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>