-- Tạo database
CREATE DATABASE IF NOT EXISTS WebShop CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE WebShop;

-- Bảng Category
CREATE TABLE Categories (
    id VARCHAR(50) NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    UNIQUE KEY (name)
);

INSERT INTO Categories (id, name) VALUES
('C001', 'Điện thoại'),
('C002', 'Laptop'),
('C003', 'Phụ kiện'),
('C004', 'Máy tính bảng'),
('C005', 'Đồng hồ thông minh');


-- Bảng Product
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    image VARCHAR(255),
    price DOUBLE,
    Createdate DATE DEFAULT (CURRENT_DATE),
    available BOOLEAN,
    Categoryid VARCHAR(50),
    CONSTRAINT fk_product_category FOREIGN KEY (Categoryid) REFERENCES Categories(id)
);

INSERT INTO Products (name, image, price, available, Categoryid) VALUES
('iPhone 15 Pro Max', 'iphone15.jpg', 33990000, TRUE, 'C001'),
('Samsung Galaxy S24 Ultra', 'galaxy_s24ultra.jpg', 28990000, TRUE, 'C001'),
('MacBook Air M2', 'macbook_air_m2.jpg', 27990000, TRUE, 'C002'),
('Dell XPS 13', 'dell_xps13.jpg', 25990000, TRUE, 'C002'),
('Tai nghe AirPods Pro 2', 'airpods_pro2.jpg', 5490000, TRUE, 'C003'),
('Chuột Logitech MX Master 3S', 'logitech_mx3s.jpg', 2490000, TRUE, 'C003'),
('iPad Pro M2 12.9 inch', 'ipad_pro_m2.jpg', 32990000, TRUE, 'C004'),
('Apple Watch Ultra 2', 'apple_watch_ultra2.jpg', 21990000, TRUE, 'C005'),
('Samsung Galaxy Watch 6', 'galaxy_watch6.jpg', 8490000, TRUE, 'C005'),
('Lenovo Tab P12', 'lenovo_tab_p12.jpg', 9990000, TRUE, 'C004');


-- Bảng Account
CREATE TABLE Accounts (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(100),
    fullname VARCHAR(100),
    email VARCHAR(100),
    photo VARCHAR(255),
    activated BOOLEAN DEFAULT TRUE,
    admin BOOLEAN DEFAULT FALSE
);

-- Bảng Orders
CREATE TABLE Orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255),
    Createdate DATE DEFAULT (CURRENT_DATE),
    Username VARCHAR(50),
    CONSTRAINT fk_order_account FOREIGN KEY (Username) REFERENCES Accounts(username)
);

-- Bảng OrderDetails
CREATE TABLE Orderdetails (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    price DOUBLE,
    quantity INT,
    Productid INT,
    Orderid BIGINT,
    CONSTRAINT fk_orderdetail_product FOREIGN KEY (Productid) REFERENCES Products(id),
    CONSTRAINT fk_orderdetail_order FOREIGN KEY (Orderid) REFERENCES Orders(id)
);
