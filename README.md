# Guide to Design Database for Gift Card Shop

This README provides a step-by-step guide to designing the database for a **Gift Card Shop** system. The database is structured to handle categories, users, gift cards, orders, payments, and transactions.

## Prerequisites
Before you start, ensure you have the following:
- A MySQL database server (or a compatible SQL database).
- Basic knowledge of SQL.

## Step 1: Create the Database
Start by creating a new database to store all the tables and their data.

```sql
CREATE DATABASE GiftCardShop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE GiftCardShop;
```
- The database GiftCardShop will be created with the utf8mb4 character set and utf8mb4_unicode_ci collation to support multilingual characters and emojis.

## Step 2: Create Categories Table
Create a table to store the different categories of gift cards.
```sql
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci
);
```
- The Categories table stores category_id and name for the gift card categories (e.g., E-commerce, Entertainment, etc.).

#### Sample Data for Categories
```sql
INSERT INTO Categories (name) VALUES
('E-commerce'),
('Entertainment'),
('Food & Beverage');
```
## Step 3: Create Users Table
Create a table to store user information.

```sql
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci,
    email VARCHAR(100) NOT NULL COLLATE utf8mb4_unicode_ci,
    password_hash VARCHAR(255) NOT NULL COLLATE utf8mb4_unicode_ci,
    phone_number VARCHAR(15) COLLATE utf8mb4_unicode_ci,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
- The Users table stores information about users, such as user_id, username, email, password_hash, and phone_number.

#### Sample Data for Users

```sql
INSERT INTO Users (username, email, password_hash, phone_number) VALUES
('JohnDoe', 'johndoe@example.com', 'hashedpassword123', '123-456-7890'),
('JaneSmith', 'janesmith@example.com', 'hashedpassword456', '987-654-3210'),
('AliceJohnson', 'alicej@example.com', 'hashedpassword789', '555-123-4567');
```
## Step 4: Create Gift Cards Table
Create a table to store gift card details.

```sql
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
```
- The GiftCards table links gift cards to the Categories table via category_id and stores information like name, value, description, and stock.

#### Sample Data for Gift Cards

```sql
INSERT INTO GiftCards (category_id, name, value, description, stock) VALUES
(1, 'Amazon Gift Card', 50.00, 'A gift card for shopping on Amazon.', 200),
(2, 'iTunes Gift Card', 25.00, 'A gift card for purchasing music, movies, and more on iTunes.', 150),
(3, 'Starbucks Gift Card', 15.00, 'A gift card for purchasing coffee and snacks at Starbucks.', 300);
```
## Step 5: Create Gift Card Codes Table
Create a table to store unique gift card codes.

```sql
CREATE TABLE GiftCardCodes (
    code_id INT AUTO_INCREMENT PRIMARY KEY,
    giftcard_id INT,
    code VARCHAR(50) NOT NULL UNIQUE COLLATE utf8mb4_unicode_ci,
    is_used BOOLEAN DEFAULT FALSE,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (giftcard_id) REFERENCES GiftCards(giftcard_id)
);
```
- The GiftCardCodes table links gift card codes to the GiftCards table and tracks whether a code has been used (is_used).

#### Sample Data for Gift Card Codes
```sql
INSERT INTO GiftCardCodes (giftcard_id, code) VALUES
(1, 'AMZ12345'),
(1, 'AMZ67890'),
(2, 'ITUN12345'),
(2, 'ITUN67890'),
(3, 'STB12345');
```
## Step 6: Create Orders Table
Create a table to store orders made by users.
```sql
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
```
- The Orders table stores details about each order, including user_id, total_amount, and order_date.

#### Sample Data for Orders
```sql
INSERT INTO Orders (user_id, total_amount) VALUES
(1, 100.00),
(2, 50.00),
(3, 45.00);
```
## Step 7: Create Payments Table
Create a table to store payment information for each order.
```sql
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50) NOT NULL COLLATE utf8mb4_unicode_ci,
    payment_status VARCHAR(20) DEFAULT 'Pending' COLLATE utf8mb4_unicode_ci,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
```
- The Payments table stores payment details such as payment_method, payment_status, and payment_date.

#### Sample Data for Payments
```sql
INSERT INTO Payments (order_id, payment_method, payment_status) VALUES
(1, 'Credit Card', 'Completed'),
(2, 'PayPal', 'Pending'),
(3, 'Debit Card', 'Completed');
```
## Step 8: Create Transactions Table
Create a table to store transaction details related to gift card codes.

```sql
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    giftcard_code_id INT,
    transaction_amount DECIMAL(10, 2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (giftcard_code_id) REFERENCES GiftCardCodes(code_id)
);
```
- The Transactions table tracks transactions involving specific giftcard_code_id and the transaction_amount.

#### Sample Data for Transactions
```sql
INSERT INTO Transactions (order_id, giftcard_code_id, transaction_amount) VALUES
(1, 1, 50.00),
(1, 2, 50.00),
(2, 3, 25.00),
(3, 4, 15.00);
```
## Database Schema
The visual database design of the Gift Card Shop Database is shown below.

![Gift Card Shop Database](https://github.com/ParsaAzari/Gift-Card-Shop-Database/blob/main/Gift%20Card%20Shop%20Database%20Schema.png "Gift Card Shop Database")
### Conclusion
This database schema provides a comprehensive structure for managing a gift card shop, including product categories, users, gift cards, orders, payments, and transactions.

### Next Steps

- Customize the schema as needed.
- Implement additional business logic or features.
- Integrate the database with your backend or frontend systems.

### License

This project is licensed under the MIT License. See the [MIT LICENSE](https://github.com/ParsaAzari/Gift-Card-Shop-Database/blob/main/LICENSE) file for details.
