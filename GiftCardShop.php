<?php
/**
 * Export to PHP Array plugin for PHPMyAdmin
 * @version 5.2.0
 */

/**
 * Database `GiftCardShop`
 */

/* `GiftCardShop`.`Categories` */
$Categories = array(
  array('category_id' => '1','name' => 'E-commerce'),
  array('category_id' => '2','name' => 'Entertainment'),
  array('category_id' => '3','name' => 'Food & Beverage')
);

/* `GiftCardShop`.`GiftCardCodes` */
$GiftCardCodes = array(
  array('code_id' => '1','giftcard_id' => '1','code' => 'AMZ12345','is_used' => '0','issued_at' => '2024-11-10 17:19:18'),
  array('code_id' => '2','giftcard_id' => '1','code' => 'AMZ67890','is_used' => '0','issued_at' => '2024-11-10 17:19:18'),
  array('code_id' => '3','giftcard_id' => '2','code' => 'ITUN12345','is_used' => '0','issued_at' => '2024-11-10 17:19:18'),
  array('code_id' => '4','giftcard_id' => '2','code' => 'ITUN67890','is_used' => '0','issued_at' => '2024-11-10 17:19:18'),
  array('code_id' => '5','giftcard_id' => '3','code' => 'STB12345','is_used' => '0','issued_at' => '2024-11-10 17:19:18')
);

/* `GiftCardShop`.`GiftCards` */
$GiftCards = array(
  array('giftcard_id' => '1','category_id' => '1','name' => 'Amazon Gift Card','value' => '50.00','description' => 'A gift card for shopping on Amazon.','stock' => '200','created_at' => '2024-11-10 17:19:18'),
  array('giftcard_id' => '2','category_id' => '2','name' => 'iTunes Gift Card','value' => '25.00','description' => 'A gift card for purchasing music, movies, and more on iTunes.','stock' => '150','created_at' => '2024-11-10 17:19:18'),
  array('giftcard_id' => '3','category_id' => '3','name' => 'Starbucks Gift Card','value' => '15.00','description' => 'A gift card for purchasing coffee and snacks at Starbucks.','stock' => '300','created_at' => '2024-11-10 17:19:18')
);

/* `GiftCardShop`.`Orders` */
$Orders = array(
  array('order_id' => '1','user_id' => '1','total_amount' => '100.00','order_date' => '2024-11-10 17:19:18'),
  array('order_id' => '2','user_id' => '2','total_amount' => '50.00','order_date' => '2024-11-10 17:19:18'),
  array('order_id' => '3','user_id' => '3','total_amount' => '45.00','order_date' => '2024-11-10 17:19:18')
);

/* `GiftCardShop`.`Payments` */
$Payments = array(
  array('payment_id' => '1','order_id' => '1','payment_method' => 'Credit Card','payment_status' => 'Completed','payment_date' => '2024-11-10 17:19:18'),
  array('payment_id' => '2','order_id' => '2','payment_method' => 'PayPal','payment_status' => 'Pending','payment_date' => '2024-11-10 17:19:18'),
  array('payment_id' => '3','order_id' => '3','payment_method' => 'Debit Card','payment_status' => 'Completed','payment_date' => '2024-11-10 17:19:18')
);

/* `GiftCardShop`.`Transactions` */
$Transactions = array(
  array('transaction_id' => '1','order_id' => '1','giftcard_code_id' => '1','transaction_amount' => '50.00','transaction_date' => '2024-11-10 17:19:18'),
  array('transaction_id' => '2','order_id' => '1','giftcard_code_id' => '2','transaction_amount' => '50.00','transaction_date' => '2024-11-10 17:19:18'),
  array('transaction_id' => '3','order_id' => '2','giftcard_code_id' => '3','transaction_amount' => '25.00','transaction_date' => '2024-11-10 17:19:18'),
  array('transaction_id' => '4','order_id' => '3','giftcard_code_id' => '4','transaction_amount' => '15.00','transaction_date' => '2024-11-10 17:19:18')
);

/* `GiftCardShop`.`Users` */
$Users = array(
  array('user_id' => '1','username' => 'JohnDoe','email' => 'johndoe@example.com','password_hash' => '9fc6dc6eb8fb685e679343358fadbf09','phone_number' => '123-456-7890','created_at' => '2024-11-10 17:19:18'),
  array('user_id' => '2','username' => 'JaneSmith','email' => 'janesmith@example.com','password_hash' => 'f50ba7ac5494615fd8c3ce0b4a56b564','phone_number' => '987-654-3210','created_at' => '2024-11-10 17:19:18'),
  array('user_id' => '3','username' => 'AliceJohnson','email' => 'alicej@example.com','password_hash' => '6dbf3e3a7c28aa6fefdbf70a86aa9945','phone_number' => '555-123-4567','created_at' => '2024-11-10 17:19:18')
);
