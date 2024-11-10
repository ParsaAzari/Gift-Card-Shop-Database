-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 10, 2024 at 02:47 PM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GiftCardShop`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`category_id`, `name`) VALUES
(1, 'E-commerce'),
(2, 'Entertainment'),
(3, 'Food & Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `GiftCardCodes`
--

CREATE TABLE `GiftCardCodes` (
  `code_id` int(11) NOT NULL,
  `giftcard_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `issued_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GiftCardCodes`
--

INSERT INTO `GiftCardCodes` (`code_id`, `giftcard_id`, `code`, `is_used`, `issued_at`) VALUES
(1, 1, 'AMZ12345', 0, '2024-11-10 13:49:18'),
(2, 1, 'AMZ67890', 0, '2024-11-10 13:49:18'),
(3, 2, 'ITUN12345', 0, '2024-11-10 13:49:18'),
(4, 2, 'ITUN67890', 0, '2024-11-10 13:49:18'),
(5, 3, 'STB12345', 0, '2024-11-10 13:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `GiftCards`
--

CREATE TABLE `GiftCards` (
  `giftcard_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `stock` int(11) DEFAULT '100',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `GiftCards`
--

INSERT INTO `GiftCards` (`giftcard_id`, `category_id`, `name`, `value`, `description`, `stock`, `created_at`) VALUES
(1, 1, 'Amazon Gift Card', '50.00', 'A gift card for shopping on Amazon.', 200, '2024-11-10 13:49:18'),
(2, 2, 'iTunes Gift Card', '25.00', 'A gift card for purchasing music, movies, and more on iTunes.', 150, '2024-11-10 13:49:18'),
(3, 3, 'Starbucks Gift Card', '15.00', 'A gift card for purchasing coffee and snacks at Starbucks.', 300, '2024-11-10 13:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `user_id`, `total_amount`, `order_date`) VALUES
(1, 1, '100.00', '2024-11-10 13:49:18'),
(2, 2, '50.00', '2024-11-10 13:49:18'),
(3, 3, '45.00', '2024-11-10 13:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `Payments`
--

CREATE TABLE `Payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Pending',
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Payments`
--

INSERT INTO `Payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `payment_date`) VALUES
(1, 1, 'Credit Card', 'Completed', '2024-11-10 13:49:18'),
(2, 2, 'PayPal', 'Pending', '2024-11-10 13:49:18'),
(3, 3, 'Debit Card', 'Completed', '2024-11-10 13:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `Transactions`
--

CREATE TABLE `Transactions` (
  `transaction_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `giftcard_code_id` int(11) DEFAULT NULL,
  `transaction_amount` decimal(10,2) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Transactions`
--

INSERT INTO `Transactions` (`transaction_id`, `order_id`, `giftcard_code_id`, `transaction_amount`, `transaction_date`) VALUES
(1, 1, 1, '50.00', '2024-11-10 13:49:18'),
(2, 1, 2, '50.00', '2024-11-10 13:49:18'),
(3, 2, 3, '25.00', '2024-11-10 13:49:18'),
(4, 3, 4, '15.00', '2024-11-10 13:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `email`, `password_hash`, `phone_number`, `created_at`) VALUES
(1, 'JohnDoe', 'johndoe@example.com', '9fc6dc6eb8fb685e679343358fadbf09', '123-456-7890', '2024-11-10 13:49:18'),
(2, 'JaneSmith', 'janesmith@example.com', 'f50ba7ac5494615fd8c3ce0b4a56b564', '987-654-3210', '2024-11-10 13:49:18'),
(3, 'AliceJohnson', 'alicej@example.com', '6dbf3e3a7c28aa6fefdbf70a86aa9945', '555-123-4567', '2024-11-10 13:49:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `GiftCardCodes`
--
ALTER TABLE `GiftCardCodes`
  ADD PRIMARY KEY (`code_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `giftcard_id` (`giftcard_id`);

--
-- Indexes for table `GiftCards`
--
ALTER TABLE `GiftCards`
  ADD PRIMARY KEY (`giftcard_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Payments`
--
ALTER TABLE `Payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `giftcard_code_id` (`giftcard_code_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `GiftCardCodes`
--
ALTER TABLE `GiftCardCodes`
  MODIFY `code_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `GiftCards`
--
ALTER TABLE `GiftCards`
  MODIFY `giftcard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Payments`
--
ALTER TABLE `Payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `GiftCardCodes`
--
ALTER TABLE `GiftCardCodes`
  ADD CONSTRAINT `giftcardcodes_ibfk_1` FOREIGN KEY (`giftcard_id`) REFERENCES `GiftCards` (`giftcard_id`);

--
-- Constraints for table `GiftCards`
--
ALTER TABLE `GiftCards`
  ADD CONSTRAINT `giftcards_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Categories` (`category_id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `Payments`
--
ALTER TABLE `Payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`);

--
-- Constraints for table `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`giftcard_code_id`) REFERENCES `GiftCardCodes` (`code_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
