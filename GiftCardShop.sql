-- ================================================================
-- Gift Card Shop Database Schema
-- ================================================================
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Server version: 5.7.39
-- PHP Version: 8.2.0
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `GiftCardShop`
-- ================================================================
-- This SQL script creates and populates a GiftCardShop database with
-- tables for categories, users, gift cards, gift card codes, orders, 
-- payments, and transactions. It also sets up foreign key relationships 
-- to maintain data integrity.
-- All tables use the utf8mb4 character set and utf8mb4_unicode_ci collation 
-- to support multilingual text storage.
-- ================================================================

-- Create Database with utf8mb4 collation
CREATE DATABASE GiftCardShop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE GiftCardShop;

-- Create Categories Table with utf8mb4 collation
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci
);

-- Sample data for Categories
INSERT INTO Categories (name) VALUES
('E-commerce'),
('Entertainment'),
('Food & Beverage');

-- Create Users Table with utf8mb4 collation
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci,
    email VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    password_hash VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    phone_number VARCHAR(15) COLLATE utf8mb4_unicode_ci,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data for Users
INSERT INTO Users (username, email, password_hash, phone_number) VALUES
('JohnDoe', 'johndoe@example.com', 'hashedpassword123', '123-456-7890'),
('JaneSmith', 'janesmith@example.com', 'hashedpassword456', '987-654-3210'),
('AliceJohnson', 'alicej@example.com', 'hashedpassword789', '555-123-4567');

-- Create Gift Cards Table with utf8mb4 collation
CREATE TABLE GiftCards (
    giftcard_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    value DECIMAL(10, 2) NOT NULL,
    description TEXT COLLATE utf8mb4_unicode_ci,
    stock INT DEFAULT 100,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Sample data for Gift Cards
INSERT INTO GiftCards (category_id, name, value, description, stock) VALUES
(1, 'Amazon Gift Card', 50.00, 'A gift card for shopping on Amazon.', 200),
(2, 'iTunes Gift Card', 25.00, 'A gift card for purchasing music, movies, and more on iTunes.', 150),
(3, 'Starbucks Gift Card', 15.00, 'A gift card for purchasing coffee and snacks at Starbucks.', 300);

-- Create Gift Card Codes Table with utf8mb4 collation
CREATE TABLE GiftCardCodes (
    code_id INT AUTO_INCREMENT PRIMARY KEY,
    giftcard_id INT,
    code VARCHAR(50) NOT NULL UNIQUE COLLATE utf8mb4_unicode_ci,
    is_used BOOLEAN DEFAULT FALSE,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (giftcard_id) REFERENCES GiftCards(giftcard_id)
);

-- Sample data for Gift Card Codes
INSERT INTO GiftCardCodes (giftcard_id, code) VALUES
(1, 'AMZ12345'),
(1, 'AMZ67890'),
(2, 'ITUN12345'),
(2, 'ITUN67890'),
(3, 'STB12345');

-- Create Orders Table with utf8mb4 collation
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Sample data for Orders
INSERT INTO Orders (user_id, total_amount) VALUES
(1, 100.00),
(2, 50.00),
(3, 45.00);

-- Create Payments Table with utf8mb4 collation
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci,
    payment_status VARCHAR(20) DEFAULT 'Pending' COLLATE utf8mb4_unicode_ci,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample data for Payments
INSERT INTO Payments (order_id, payment_method, payment_status) VALUES
(1, 'Credit Card', 'Completed'),
(2, 'PayPal', 'Pending'),
(3, 'Debit Card', 'Completed');

-- Create Transactions Table with utf8mb4 collation
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    giftcard_code_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (giftcard_code_id) REFERENCES GiftCardCodes(code_id)
);

-- Sample data for Transactions
INSERT INTO Transactions (order_id, giftcard_code_id, transaction_amount) VALUES
(1, 1, 50.00),
(1, 2, 50.00),
(2, 3, 25.00),
(3, 4, 15.00);
