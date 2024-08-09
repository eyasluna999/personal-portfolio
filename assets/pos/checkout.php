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
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $method = $_POST['method'];
   $method = filter_var($method, FILTER_SANITIZE_STRING);
   $address = 'flat no. '. $_POST['flat'] .', '. $_POST['street'] .', '. $_POST['city'] .', '. $_POST['state'] .', - '. $_POST['pin_code'];
   $address = filter_var($address, FILTER_SANITIZE_STRING);
   $total_products = $_POST['total_products'];
   $total_price = $_POST['total_price'];
   $ccname = $_POST['ccname'];
   $ccname = filter_var($ccname, FILTER_SANITIZE_STRING);
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

      $insert_order = $conn->prepare("INSERT INTO `orders`(user_id, name, number, email, method, address, total_products, total_price) VALUES(?,?,?,?,?,?,?,?)");
      $insert_order->execute([$user_id, $name, $number, $email, $method, $address, $total_products, $total_price]);

      $insert_order = $conn->prepare("INSERT INTO `creditcard`(name, ccnumber, expmonth, expyear, cvv) VALUES(?,?,?,?,?)");
      $insert_order->execute([$name, $ccnumber, $expmonth, $expyear, $cvv]);


      $delete_cart = $conn->prepare("DELETE FROM `cart` WHERE user_id = ?");
      $delete_cart->execute([$user_id]);

      echo "<script>
alert('Order placed successfully!');
window.location.href='orders.php';
</script>";
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

   <h3>your orders</h3>

      <div class="display-orders">
      <?php
         $grand_total = 0;
         $cart_items[] = '';
         $select_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
         $select_cart->execute([$user_id]);
         if($select_cart->rowCount() > 0){
            while($fetch_cart = $select_cart->fetch(PDO::FETCH_ASSOC)){
               $cart_items[] = $fetch_cart['name'].' ('.$fetch_cart['price'].' x '. $fetch_cart['quantity'].') - ';
               $total_products = implode($cart_items);
               $grand_total += ($fetch_cart['price'] * $fetch_cart['quantity']);
      ?>
         <p> <?= $fetch_cart['name']; ?> <span>(<?= '₱'.$fetch_cart['price'].'/- x '. $fetch_cart['quantity']; ?>)</span> </p>
      <?php
            }
         }else{
            echo '<p class="empty">your cart is empty!</p>';
         }
      ?>
         <input type="hidden" name="total_products" value="<?= $total_products; ?>">
         <input type="hidden" name="total_price" value="<?= $grand_total; ?>" value="">
         <div class="grand-total">grand total : <span>₱<?= $grand_total; ?>/-</span></div>
      </div>

      <h3>place your orders</h3>

      <div class="flex">
         <div class="inputBox">
            <span>Name:</span>
            <input type="text" name="name" placeholder="enter your name" class="box" maxlength="20" required>
         </div>
         <div class="inputBox">
            <span>Number:</span>
            <input type="number" name="number" placeholder="enter your number" class="box" min="0" max="9999999999" onkeypress="if(this.value.length == 11) return false;" required>
         </div>
         <div class="inputBox">
            <span>Email:</span>
            <input type="email" name="email" placeholder="enter your email" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>Payment Method:</span>
            <select name="method" class="box" required onchange="toggleCCDetails(this.value)";>
               <option value="Cash on Delivery">Cash on Delivery</option>
               <option value="Credit Card">Credit Card</option>
            </select>
         </div>
         <div class="inputBox">
            <span>Address Line 1:</span>
            <input type="text" name="flat" placeholder="e.g. flat number" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>Address Line 2:</span>
            <input type="text" name="street" placeholder="e.g. street name" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>City:</span>
            <input type="text" name="city" placeholder="e.g. Imus" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>Province:</span>
            <input type="text" name="state" placeholder="e.g. Cavite" class="box" maxlength="50" required>
         </div>
         <div class="inputBox">
            <span>Zip Code:</span>
            <input type="number" min="0" name="pin_code" placeholder="1500" min="0" max="999999" onkeypress="if(this.value.length == 4) return false;" class="box" required>
         </div>
      </div>

   <div class="flex" id="ccdetails" style="display:none;">
      <div class="inputBox">
         <span>Name on Card:</span>
         <input type="text"  name="ccname" placeholder="Juan Dela Cruz" class="box" maxlength="20">
      </div>
      <div class="inputBox">
         <span>Credit Card Number:</span>
         <input type="number" name="ccnumber" placeholder="4834 xxxx xxxx xxxx" class="box" min="0" max="9999999999999999" onkeypress="if(this.value.length == 16) return false;">
      </div>
      <div class="inputBox">
         <span>Expiration Month:</span>
         <input type="number" name="expmonth" placeholder="04" class="box" maxlength="2">
      </div>
      <div class="inputBox">
         <span>Expiration Year:</span>
         <input type="number" name="expyear" placeholder="2030" class="box" maxlength="4">
      </div>
      <div class="inputBox">
         <span>CVV</span>
         <input type="text" name="cvv" placeholder="304" class="box" maxlength="3" >
      </div>
   </div>



      
      <input type="submit" name="order" class="btn <?= ($grand_total > 1) ?>" value="place order">

   </form>



</section>













<?php include 'components/footer.php'; ?>

<script>
function toggleCCDetails(value) {
   var ccdetails = document.getElementById('ccdetails');
   var ccinputs = ccdetails.querySelectorAll('input');
   
   if (value === 'Credit Card') {
      ccdetails.style.display = 'flex';
      ccinputs.forEach(function(input) {
         input.required = true;
      });
   } else {
      ccdetails.style.display = 'none';
      ccinputs.forEach(function(input) {
         input.required = false;
      });
   }
}
</script>

<script src="js/script.js"> </script>

</body>
</html>